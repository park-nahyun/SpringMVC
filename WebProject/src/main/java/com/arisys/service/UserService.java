package com.arisys.service;

import com.arisys.dao.UserDAO;
import com.arisys.entity.User;
import com.arisys.mybatis.SessionFactoryManager;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class UserService {

    private final UserDAO userDAO;
    public UserService() {
        SessionFactoryManager sessionFactoryManager = new SessionFactoryManager();
        SqlSessionFactory sqlSessionFactory = sessionFactoryManager.getSqlSessionFactory();
        if (sqlSessionFactory != null) {
            SqlSession sqlSession = sqlSessionFactory.openSession();
            this.userDAO = sqlSession.getMapper(UserDAO.class);
        } else {
            throw new RuntimeException("SqlSessionFactory is null");
        }
    }

    public List<User> getUserList() {
        return userDAO.selectUserList();
    }

    // 다른 메서드도 추가할 수 있습니다.
}