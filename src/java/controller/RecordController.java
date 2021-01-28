package controller;

import dao.StaffDao;
import entity.Record;
import entity.Staff;
import java.util.List;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Transactional
@RequestMapping("/record")
public class RecordController {

    @Autowired
    SessionFactory factory;

    @Autowired
    private StaffDao staffDao;

    @RequestMapping("")
    public String viewRecord(@RequestParam("page") Integer page, Model model) {
        Session session = factory.getCurrentSession();

        long tong = (long) session.createQuery("SELECT COUNT(id) FROM Record").uniqueResult();
        long pages = page, maxResult = 6;
        long indexrow = maxResult * (pages - 1);
        long totalpage = (long) Math.ceil((double) tong / maxResult);

        Query query = session.createQuery("FROM Record");
        query.setFirstResult((int) indexrow);
        query.setMaxResults((int) maxResult);

        List<Record> list = query.list();

        model.addAttribute("list", list);
        model.addAttribute("pages", pages);
        model.addAttribute("totalpage", totalpage);

        return "record/view";
    }

    @RequestMapping("/add")
    public String addRecord(Model model) {
        List<Staff> slist = staffDao.getList();
        model.addAttribute("slist", slist);
        model.addAttribute("record", new Record());
        return "record/form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveRecord(@Valid @ModelAttribute("record") Record record, BindingResult errs, Model model) {
        if (errs.hasErrors()) {
            List<Staff> slist = staffDao.getList();
            model.addAttribute("slist", slist);
            return "record/form";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            if (record.getId() == null || record.getId() == 0) {
                try {
                    session.save(record);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            } else {
                try {
                    session.update(record);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            }

            return "redirect:/record?page=1";
        }
    }

    @RequestMapping("/edit")
    public ModelAndView editRecord(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("record/form");
        Record record = get(id);
        List<Staff> slist = staffDao.getList();
        mav.addObject("record", record);
        mav.addObject("slist", slist);
        return mav;
    }

    @RequestMapping("/delete")
    public String deleteRecord(@RequestParam("id") Integer id) {
        Session session = factory.getCurrentSession();
        Record record = (Record) session.get(Record.class, id);
        session.delete(record);
        return "redirect:/record?page=1";
    }

    public Record get(Integer id) {
        Session session = factory.getCurrentSession();
        Record record = (Record) session.get(Record.class, id);
        return record;
    }

}
