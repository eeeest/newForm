package com.spurs.dao;

import com.spurs.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User userLogin(@Param("username") String username, @Param("password") String password);
    User userSelectById(Integer id);
    Integer userRegistered(User user);
    List<User> selectUserList();
    List<User> userSelectByUsername(String username);
    Integer userDelete(Integer id);
    Integer userUpdate(User user);
}
