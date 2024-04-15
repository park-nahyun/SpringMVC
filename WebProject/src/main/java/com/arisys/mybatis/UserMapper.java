package com.arisys.mybatis;
import com.arisys.entity.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {

        public int insertUser(User user);

        public User selectUserDetail(int id);

        public int updateUser(User params);

        public int deleteUser(int id);

        public List<User> selectUserList();

        public int selecUserTotalCount();

    }

}
