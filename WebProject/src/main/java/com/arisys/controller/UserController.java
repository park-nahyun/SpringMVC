package com.arisys.controller;

import com.arisys.entity.User;
import com.arisys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

// UserController.java
@Controller
public class UserController {
    @GetMapping("/")
    public String getUsers(Model model) {
        UserService userService = new UserService();
        List<User> userList = userService.getUserList(); // 사용자 목록을 가져옵니다.
        System.out.println(":::::::::::" + userList);
        model.addAttribute("users", userList); // 사용자 목록을 모델에 추가합니다.
        return "index"; // index.html 뷰를 반환합니다.
    }
}
