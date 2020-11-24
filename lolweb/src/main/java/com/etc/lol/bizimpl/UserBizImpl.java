package com.etc.lol.bizimpl;

import com.etc.lol.biz.UserBiz;
import com.etc.lol.dao.UserDao;
import com.etc.lol.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserBizImpl implements UserBiz {
    @Resource
    private UserDao dao;
    //查询用户名是否注册
    @Override
    public User checkNameIsRegister(String name) {
        return dao.checkNameIsRegister(name);
    }
    //查询手机号是否注册
    @Override
    public User checkTelIsRegister(String tel) {
        return dao.checkTelIsRegister(tel);
    }
    //修改用户信息
    @Override
    public boolean editUser(User user) {

        return dao.editUser(user);
    }

    //用户登录方法
    @Override
    public User login(String name, String pwd) {
        if (name.equals("") || name.equals(null) || pwd.equals("") || pwd.equals(null)) {
            return null;
        } else {
            return dao.login(name, pwd);
        }
    }
    //通过用户名查询用户
    @Override
    public boolean queryUserByName(String name) {
        return dao.queryUserByName(name);
    }

    //查询所有
    @Override
    public List<User> queryAll() {
        return dao.queryAll();
    }

    //添加用户
    @Override
    public boolean addUser(User user) {
        if (user == null) {
            return false;
        } else if (user.getUser_name() == null || user.getUser_pwd() == null || user.getUser_pwd().length() < 6) {
            return false;
        } else {
            return dao.addUser(user);
        }
    }

    //通过ID查询用户
    @Override
    public User queryById(Integer id) {
        if (id == null) {
            return null;
        } else {
            return dao.queryById(id);
        }
    }

}
