package com.arisys.controller;

import com.arisys.entity.User;
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

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("/")
    public String getUsers(Model model) {

        List<User> users = jdbcTemplate.query(
                "SELECT * FROM USERINFO",
                new RowMapper<User>() {
                    @Override
                    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                        User user = new User();
                        user.setId(rs.getLong("id"));
                        user.setUsername(rs.getString("username"));
                        user.setEmail(rs.getString("email"));
                        return user;
                    }
                }
        );


        model.addAttribute("users", users);
        return "users";
    }
}
