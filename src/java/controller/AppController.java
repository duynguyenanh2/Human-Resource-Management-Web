package controller;

import dao.StaffDao;
import entity.Staff;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppController {
    
    @Autowired
    private StaffDao staffDao;

    @RequestMapping("/home")
    public String home(Model model) {
        List<Staff> list = staffDao.getList();
        model.addAttribute("list",list);
        model.addAttribute("message","helo world");
        return "index";
    }
    


}
