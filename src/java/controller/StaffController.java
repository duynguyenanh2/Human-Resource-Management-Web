package controller;

import dao.DepartDao;
import dao.StaffDao;
import entity.Depart;
import entity.Staff;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Transactional
@RequestMapping("/staff")
public class StaffController {

    @Autowired
    SessionFactory factory;

    @Autowired
    private DepartDao departDao;
    
    @Autowired
    private StaffDao staffDao;

    @RequestMapping("")
    public String viewStaff(@RequestParam("page") Integer page, Model model) {
        Session session = factory.getCurrentSession();

        long tong = (long) session.createQuery("SELECT COUNT(id) FROM Staff").uniqueResult();
        long pages = page, maxResult = 6;
        long indexrow = maxResult * (pages - 1);
        long totalpage = (long) Math.ceil((double) tong / maxResult);

        Query query = session.createQuery("FROM Staff");
        query.setFirstResult((int) indexrow);
        query.setMaxResults((int) maxResult);

        List<Staff> list = query.list();

        model.addAttribute("list", list);
        model.addAttribute("pages", pages);
        model.addAttribute("totalpage", totalpage);

        return "staff/view";
    }

    @RequestMapping("/add")
    public String addStaff(Model model) {
        List<Depart> dlist = departDao.getList();
        model.addAttribute("dlist", dlist);
        model.addAttribute("staff", new Staff());
        return "staff/form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveStaff(HttpServletRequest request, @Valid @ModelAttribute("staff") Staff staff, BindingResult errs, Model model,
            @RequestParam("fileImg") MultipartFile multipartFile) throws IOException {
        if (errs.hasErrors()) {
            List<Depart> dlist = departDao.getList();
            model.addAttribute("dlist", dlist);
            return "staff/form";
        } else {
            if (!multipartFile.isEmpty()) {
                String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
                staff.setImage(fileName);

                String rootPath = request.getServletContext().getRealPath("resources/images");
                Path uploadPath = Paths.get(rootPath);
                
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                
                try {
                    InputStream inputStream = multipartFile.getInputStream();
                    Path filePath = uploadPath.resolve(fileName);
                    System.out.println(filePath.toFile().getAbsolutePath());
                    Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                } catch (Exception e) {
                    throw new IOException("File not saved");
                }
            }

            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            if (staff.getId() == null || staff.getId() == 0) {
                try {
                    session.save(staff);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            } else {
                try {
                    session.update(staff);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            }

            return "redirect:/staff?page=1";
        }
    }

    @RequestMapping("/edit")
    public ModelAndView editStaff(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("staff/form");
        Staff staff = get(id);
        List<Depart> dlist  = departDao.getList();
        mav.addObject("dlist", dlist);
        mav.addObject("staff", staff);
        return mav;
    }

    @RequestMapping("/delete")
    public String deleteStaff(@RequestParam("id") Integer id) {
        Session session = factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);
        session.delete(staff);
        return "redirect:/staff?page=1";
    }

    public Staff get(Integer id) {
        Session session = factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);
        return staff;
    }

    @RequestMapping("/report")
    public String report(Model model) {
        Session session = factory.getCurrentSession();
        String hql = "Select r.staff.id, r.staff.name, "
                + "SUM(case when r.type=1 then 1 else 0 end), "
                + "SUM(case when r.type=0 then 1 else 0 end) "
                + "from Record r group by r.staff.id, r.staff.name";
        Query query = session.createQuery(hql);
        List<Object[]> report = query.list();
        model.addAttribute("report", report);
        return "report";
    }

}
