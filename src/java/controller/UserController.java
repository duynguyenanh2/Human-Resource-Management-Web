package controller;

import entity.User;
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
@RequestMapping("/user")
public class UserController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("")
    public String viewUser(@RequestParam("page") Integer page, Model model) {
        Session session = factory.getCurrentSession();

        long tong = (long) session.createQuery("SELECT COUNT(id) FROM User").uniqueResult();
        long pages = page, maxResult = 6;
        long indexrow = maxResult * (pages - 1);
        long totalpage = (long) Math.ceil((double) tong / maxResult);

        Query query = session.createQuery("FROM User");
        query.setFirstResult((int) indexrow);
        query.setMaxResults((int) maxResult);

        List<User> list = query.list();

        model.addAttribute("list", list);
        model.addAttribute("pages", pages);
        model.addAttribute("totalpage", totalpage);

        return "user/view";
    }

    @RequestMapping("/add")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "user/form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult errs) {
        if (errs.hasErrors()) {
            return "user/form";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            if (user.getId() == null || user.getId() == 0) {
                try {
                    session.save(user);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            } else {
                User existUser = get(user.getId());
                user.setPassword(existUser.getPassword());

                try {
                    session.update(user);
                    t.commit();
                } catch (Exception e) {
                    t.rollback();
                } finally {
                    session.close();
                }
            }

            return "redirect:/user?page=1";
        }
    }

    @RequestMapping("/edit")
    public ModelAndView editUser(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("user/form");
        User user = get(id);
        mav.addObject("user", user);
        return mav;
    }

    @RequestMapping("/delete")
    public String deleteUser(@RequestParam("id") Integer id) {
        Session session = factory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        session.delete(user);
        return "redirect:/user?page=1";
    }

    public User get(Integer id) {
        Session session = factory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        return user;
    }

}
