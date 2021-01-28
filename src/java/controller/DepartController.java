package controller;

import entity.Depart;
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
@RequestMapping("/depart")
public class DepartController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("")
    public String viewDepart(@RequestParam("page") Integer page, Model model) {
        Session session = factory.getCurrentSession();

        long tong = (long) session.createQuery("SELECT COUNT(id) FROM Depart").uniqueResult();
        long pages = page, maxResult = 6;
        long indexrow = maxResult * (pages - 1);
        long totalpage = (long) Math.ceil((double) tong / maxResult);

        Query query = session.createQuery("FROM Depart");
        query.setFirstResult((int) indexrow);
        query.setMaxResults((int) maxResult);

        List<Depart> list = query.list();

        model.addAttribute("list", list);
        model.addAttribute("pages", pages);
        model.addAttribute("totalpage", totalpage);

        return "depart/view";
    }

    @RequestMapping("/add")
    public String addDepart(Model model) {
        model.addAttribute("depart", new Depart());
        return "depart/form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveDepart(@Valid @ModelAttribute("depart") Depart depart, BindingResult errs) {
        if (errs.hasErrors()) {
            return "depart/form";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            if (depart.getId() == null || depart.getId() == 0) {
                try {
                    session.save(depart);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            } else {
                try {
                    session.update(depart);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            }

            return "redirect:/depart?page=1";
        }
    }

    @RequestMapping("/edit")
    public ModelAndView editDepart(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("depart/form");
        Depart depart = get(id);
        mav.addObject("depart", depart);
        return mav;
    }

    @RequestMapping("/delete")
    public String deleteDepart(@RequestParam("id") Integer id) {
        Session session = factory.getCurrentSession();
        Depart depart = (Depart) session.get(Depart.class, id);
        session.delete(depart);
        return "redirect:/depart?page=1";
    }

    public Depart get(Integer id) {
        Session session = factory.getCurrentSession();
        Depart depart = (Depart) session.get(Depart.class, id);
        return depart;
    }

}
