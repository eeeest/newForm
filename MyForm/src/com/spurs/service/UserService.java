package com.spurs.service;

import com.spurs.entity.User;

import java.util.List;

public interface UserService {
    User userLogin(String username,String password);
    User userSelectById(Integer id);
    Integer userRegistered(User user);
    List<User> selectUserList();
    Integer userDelete(Integer id);
    Integer userUpdate(User user);
    List<User> userSelectByUsername(String username);
}
