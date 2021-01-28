package controller;

import dao.UserDao;
import javax.servlet.http.HttpServletRequest;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @Autowired
    UserDao userDao;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, RedirectAttributes ra) {
        String url;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userDao.findByUsername(username);

        if (user != null) {
            if (user.getPassword().equals(password)) {
                userDao.login(request, user);
                ra.addFlashAttribute("message", "Welcome " + username);
                url = "redirect:/admin";
            } else {
                ra.addFlashAttribute("message", "Wrong username or password");
                url = "redirect:/login";
            }
        } else {
            ra.addFlashAttribute("message", "This user does not exist");
            url = "redirect:/login";
        }

        return url;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        userDao.logout(request);
        return "redirect:/login";
    }

}
