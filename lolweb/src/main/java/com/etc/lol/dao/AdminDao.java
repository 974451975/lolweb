package com.etc.lol.dao;

import com.etc.lol.entity.Admin;
import com.etc.lol.entity.Story;
import com.etc.lol.entity.User;

import java.util.List;

public interface AdminDao {
    //管理员登录
    public Admin adminLogin(String name, String pwd);
    //查询所有用户
    public List<User> queryAllUser();
    //查询所有故事
    public List<Story> queryAllStory();
    //删除用户
    public boolean deleteUserById(Integer id);
}
