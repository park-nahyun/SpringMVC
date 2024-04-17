package com.arisys.dao;

import com.arisys.entity.User;

import java.util.List;

public interface UserDAO {
    List<User> selectUserList();
    User selectUserDetail(int id);
    void insertUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    int selectUserTotalCount();
}