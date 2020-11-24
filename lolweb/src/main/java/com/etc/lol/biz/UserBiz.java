package com.etc.lol.biz;

import com.etc.lol.entity.User;

import java.util.List;

public interface UserBiz {

    public User login(String name, String pwd);

    public boolean addUser(User user);

    public boolean queryUserByName(String name);

    public List<User> queryAll();

    public User queryById(Integer id);

    public User checkNameIsRegister(String name);

    public User checkTelIsRegister(String email);

    public boolean editUser(User user);
}
