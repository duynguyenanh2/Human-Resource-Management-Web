package dao;

import entity.Record;
import entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class RecordDao {

    @Autowired
    SessionFactory factory;

    public List<Record> getList() {
        Session session = factory.getCurrentSession();
        List<Record> list = session.createQuery("FROM Record").list();
        return list;
    }

}
