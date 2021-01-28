package dao;

import entity.User;
import entity.Staff;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class StaffDao {

    @Autowired
    SessionFactory factory;

    public Staff findByName(String name) {
        try {
            Session session = factory.openSession();
            List<Staff> list = session.createQuery("FROM staffs WHERE name=?").setParameter(0, name).list();
            if (list.size() > 0) {
                return list.get(0);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Staff> getList() {
        Session session = factory.openSession();
        List<Staff> list = session.createQuery("FROM Staff").list();
        return list;
    }


}
