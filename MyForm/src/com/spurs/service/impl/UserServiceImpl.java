package com.spurs.service.impl;

import com.spurs.dao.UserDao;
import com.spurs.entity.User;
import com.spurs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User userLogin(String username, String password) {
        return userDao.userLogin(username,password);
    }

    @Override
    public User userSelectById(Integer id) {
        return userDao.userSelectById(id);
    }

    @Override
    public Integer userRegistered(User user) {
        return userDao.userRegistered(user);
    }

    @Override
    public List<User> selectUserList() {
        return userDao.selectUserList();
    }

    @Override
    public Integer userDelete(Integer id) {
        return userDao.userDelete(id);
    }

    @Override
    public Integer userUpdate(User user) {
        return userDao.userUpdate(user);
    }

    @Override
    public List<User> userSelectByUsername(String username) {
        return userDao.userSelectByUsername(username);
    }
}
