package com.etc.lol.controller;

import com.etc.lol.biz.UserBiz;
import com.etc.lol.entity.User;
import com.etc.lol.util.MyRenameFile;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value = "/usercontroller")
public class MyUserController {
    @Resource
    private UserBiz biz;
    @Resource
    private MyRenameFile rename;


    @RequestMapping(value = "/login")
    public void login(String user_name, String user_pwd, HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        User user = biz.login(user_name, user_pwd);
        if (user == null) {
            out.print("<script>alert('登录失败');history.go(-1);</script>");
        } else {
            //将登录用户保存在session中
            session.setAttribute("loginuser", user);
            out.print("<script>window.location.href=document.referrer;</script>");
        }
        out.flush();
        out.close();
    }


    @RequestMapping(value = "/checkNameIsRegister")
    public void checkNameIsRegister(String user_name, HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        User user = biz.checkNameIsRegister(user_name);
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (user == null) {
            out.print(1);
        } else {
            out.print(0);
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/checkTelIsRegister")
    public void checkTelIsRegister(String user_tel, HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        User flag = biz.checkTelIsRegister(user_tel);
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag == null) {
            out.print(1);
        } else {
            out.print(0);
        }
        out.flush();
        out.close();
    }

    //退出功能
    @RequestMapping(value = "/logout.do")
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.print("<script>window.location.href=document.referrer;</script>");
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public void register(MultipartFile mylogo, User user, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        //获取服务器所在的上传文件夹的盘符位置
        String path = session.getServletContext().getRealPath("/upload");
        //重命名当前文件
        String name2 = rename.myRename(mylogo.getOriginalFilename());

        File file = new File(path + "/" + name2);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            FileUtils.copyInputStreamToFile(mylogo.getInputStream(), file);
            System.out.println(file);
            user.setUser_img(name2);
            String sex = request.getParameter("sex");
            user.setUser_sex(sex);
            boolean flag;
            if(user.getUser_name()==null||user.getUser_email()==null||user.getUser_pwd()==null){
            flag=false;
            }else{
                biz.addUser(user);
                flag=true;
            }
            if (flag) {
                session.setAttribute("loginuser", user);
                out.print("<script>alert('注册成功');location.href='../index.jsp';</script>");
            } else {
                out.print("<script>alert('注册失败');history.go(-1);</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
            out.print("<script>alert('注册失败');history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/editUser",method = RequestMethod.POST)
    public void editUser(MultipartFile mylogo, User user, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        //获取服务器所在的上传文件夹的盘符位置
        String path = session.getServletContext().getRealPath("/upload");
        //重命名当前文件
        String name2 = rename.myRename(mylogo.getOriginalFilename());

        File file = new File(path + "/" + name2);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            FileUtils.copyInputStreamToFile(mylogo.getInputStream(), file);
            user.setUser_img(name2);
            String sex = request.getParameter("sex");
            user.setUser_sex(sex);
            User user2  = (User) request.getSession().getAttribute("loginuser");
            Integer id=user2.getUser_id();
            user.setUser_id(id);
            user.setUser_name(user2.getUser_name());
            user.setUser_img(user2.getUser_img());
            user.setUser_email(user2.getUser_email());
            boolean flag = biz.editUser(user);
            if (flag) {
                session.setAttribute("loginuser", user);
                out.print("<script>alert('修改成功');location.href='../index.jsp';</script>");
            } else {
                out.print("<script>alert('修改失败');history.go(-1);</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
            out.print("<script>alert('修改失败');history.go(-1);</script>");
        }

        out.flush();
        out.close();




    }
}

