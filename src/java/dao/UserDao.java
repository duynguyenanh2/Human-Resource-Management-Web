package dao;

import entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDao {

    @Autowired
    SessionFactory factory;

    public User findByUsername(String username) {
        try {
            Session session = factory.openSession();
            List<User> list = session.createQuery("FROM User WHERE username=?").setParameter(0, username).list();
            if (list.size() > 0) {
                return list.get(0);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean isDuplicated(Integer id, String username) {
        User user = findByUsername(username);
        boolean check = false;
        boolean isNew = (id == null || id == 0);

        if (isNew) {
            if (user != null) {
                check = true;
            }
        } else {
            if (user != null && user.getId() != id) {
                check = true;
            }
        }

        return check;
    }

    public static void login(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
    }

    public static void logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("user", null);
    }

    public static boolean authenticated(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("user") != null;
    }

}
