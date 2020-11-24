package com.etc.lol.controller;


import com.etc.lol.biz.AdminBiz;
import com.etc.lol.biz.ForumBiz;
import com.etc.lol.dto.forumuser;
import com.etc.lol.entity.Admin;
import com.etc.lol.entity.Story;
import com.etc.lol.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value = "/admincontroller")
public class MyAdminController {
    @Resource
    private AdminBiz biz;
    @Resource
    private ForumBiz forumbiz;
    //登录
    @RequestMapping(value = "/adminLogin")
    public void adminLogin(String admin_name, String admin_pwd, HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Admin admin = biz.adminLogin(admin_name,admin_pwd);
        if (admin == null) {
            out.print("<script>alert('登录失败');history.go(-1);</script>");
        } else {
            //将登录用户保存在session中
            session.setAttribute("loginadmin", admin);
            System.out.println(admin.getAdmin_name());
            out.print("<script>alert('登录成功');location.href='../adminIndex.jsp';</script>");
        }
        out.flush();
        out.close();
    }


    //退出功能
    @RequestMapping(value = "/adminLogout.do")
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        try {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //显示所有的用户
    @RequestMapping(value = "/queryAllUser")
    @ResponseBody
    public List<User> queryAllUser(){
        List<User> userlist=biz.queryAllUser();
        return userlist;
    }

    //展示故事
    @RequestMapping(value = "/queryAllStory")
    @ResponseBody
    public List<Story> queryAllStory(){
        List<Story> storylist=biz.queryAllStory();
        return storylist;
    }

    @RequestMapping(value = "/queryAllForum")
    public String queryAllForum(Integer page,HttpServletRequest request) {

        int pageid = 1;
        int size = 8;
        int count = forumbiz.queryAllForumCount();
        int maxpage=count%size==0?(count/size):(count/size+1);
        pageid=pageid<1?1:page;
        pageid=pageid>maxpage?maxpage:page;

        if (page != null) {
            page = pageid;
        }
        List<forumuser> forumlist = forumbiz.queryAllForumByPage((page - 1) * size, size);
        System.out.println("???"+forumlist);

        request.setAttribute("maxpage", maxpage);
        request.setAttribute("page", page);
        request.setAttribute("forumlist",forumlist);

        return "adminForum";
    }


    //删除用户
    @RequestMapping(value = "/deleteUserById")
    public void deleteUserById(Integer id,HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean flag=biz.deleteUserById(id);
        System.out.println("------------a----------------");
        if (flag=false){
            out.print("<script>alert('删除失败');history.go(-1);</script>");
        }else {
            out.print("<script>alert('删除成功');location.href='../adminManageUser.jsp';</script>");
        }
    }





}
