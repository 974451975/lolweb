package com.etc.lol.bizimpl;

import com.etc.lol.biz.AdminBiz;
import com.etc.lol.dao.AdminDao;
import com.etc.lol.entity.Admin;
import com.etc.lol.entity.Story;
import com.etc.lol.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminBizImpl implements AdminBiz {
    @Resource
    private AdminDao dao;
    //管理员登录
    @Override
    public Admin adminLogin(String name, String pwd) {
        return dao.adminLogin(name, pwd);
    }
    //查询所有用户
    @Override
    public List<User> queryAllUser() {
        return dao.queryAllUser();
    }

    @Override
    public boolean deleteUserById(Integer id) {
        return dao.deleteUserById(id);
    }

    @Override
    public List<Story> queryAllStory() {
        return dao.queryAllStory();
    }
}