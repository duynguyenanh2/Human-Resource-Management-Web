package dao;

import entity.User;
import entity.Depart;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class DepartDao {

    @Autowired
    SessionFactory factory;

    public Depart findByName(String name) {
        try {
            Session session = factory.openSession();
            List<Depart> list = session.createQuery("FROM Depart WHERE name=?").setParameter(0, name).list();
            if (list.size() > 0) {
                return list.get(0);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Depart> getList() {
        Session session = factory.getCurrentSession();
        List<Depart> list = session.createQuery("FROM Depart").list();
        return list;
    }


}
