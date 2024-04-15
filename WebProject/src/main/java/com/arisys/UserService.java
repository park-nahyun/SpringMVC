package com.arisys;

import com.arisys.mybatis.SessionFactoryManager;
import org.apache.ibatis.session.SqlSessionFactory;

public class UserService {

    public void createSqlSession() {
        SessionFactoryManager sessionFactoryManager = new SessionFactoryManager();
        SqlSessionFactory factory = sessionFactoryManager.getSqlSessionFactory();

        // SqlSession 생성
        session = factory.openSession();

        // 사용자 생성 및 삽입
        User newUser = new User();
                newUser.setName("John Doe");
                newUser.setEmail("john@example.com");
                session.getMapper(UserMapper.class).insertUser(newUser);
                session.commit();

        // 결과 출력
                System.out.println("New User ID: " + newUser.getId());
    }

}
