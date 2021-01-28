package controller;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRestController {

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/user/checkunique", method = RequestMethod.POST)
    public String checkUnique(@RequestParam("id") Integer id, @RequestParam("username") String username) {
        return userDao.isDuplicated(id, username) ? "Duplicated" : "OK";
    }

}
