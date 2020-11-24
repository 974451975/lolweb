package com.etc.lol.controller;


import com.etc.lol.biz.ForumBiz;

import com.etc.lol.dto.collectuser;
import com.etc.lol.dto.forumuser;
import com.etc.lol.dto.replyuser;
import com.etc.lol.dto.searchReply;
import com.etc.lol.entity.Collect;
import com.etc.lol.entity.Forum;
import com.etc.lol.entity.Hero;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/forumcontroller")
public class MyForumController {

    @Resource
    private ForumBiz biz;

    @RequestMapping(value = "/queryAllForum")
    @ResponseBody
    public List<Forum> queryAllForum() {

        List<Forum> forumList=biz.queryAllForum();

        return forumList;
    }

    @RequestMapping(value = "/queryAllForumByPage")
    public String queryAllForumByPage( Integer page,HttpServletRequest request) {

        int pageid=1;
        int size=5;

        int count=biz.queryAllForumCount();
        int maxpage=count%size==0?(count/size):(count/size+1);
        pageid=pageid<1?1:page;
        pageid=pageid>maxpage?maxpage:page;

        if(page!=null){
            page=pageid;
        }

        List<forumuser> forumlist= biz.queryAllForumByPage((page-1)*size,size);

        String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";

        request.setAttribute("forumlist", forumlist);
        request.setAttribute("maxpage", maxpage);
        request.setAttribute("page", page);

        return "forumIndex";

    }

    @RequestMapping(value = "/queryForumByKey")
    public String queryForumByKey( String hkey,Integer page,HttpServletRequest request) {

        int pageid=1;
        int size=5;

        String key="%"+hkey+"%";

        int count=biz.queryForumKeyCount(key);
        int maxpage=count%size==0?(count/size):(count/size+1);
        pageid=pageid<1?1:page;
        pageid=pageid>maxpage?maxpage:page;

        if(page!=null){
            page=pageid;
        }

        if(count!=0){
            List<forumuser> forumlist= biz.queryForumByKey(key,(page-1)*size,size);
            request.setAttribute("forumlist", forumlist);

        }


        String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";


        request.setAttribute("maxpage", maxpage);
        request.setAttribute("page", page);

        return "forumIndex";

    }



    @RequestMapping(value = "/queryForumById")
    public String queryForumById( Integer forumid,Integer userid,HttpServletRequest request) {
        forumuser forum=biz.queryForumByid(forumid);
        request.setAttribute("forum",forum);
        Collect collect=biz.queryIsCollect(userid,forumid);

        if(collect!=null){
            System.out.println("true");
            request.setAttribute("isCollect",true);
        }else{
            System.out.println("false");
            request.setAttribute("isCollect",false);
        }
        return "forum";
    }

    @RequestMapping(value = "/replyForum")
    public void replyForum( Integer userid,Integer forumid,String replytext,HttpServletResponse response ){
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        //获取当前时间

        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();// 获取当前时间
        String time=sdf.format(date);
        if(biz.replyForum(userid,forumid,replytext,time)){
            out.print("<script>window.location.href=document.referrer;</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/queryReplyById")
    @ResponseBody
    public List<replyuser> queryReplyById(Integer forumid,Integer page,HttpSession session){
        int pageid=1;
        int size=8;

        int count=biz.queryReplyByIdCount(forumid);
        int maxpage=count%size==0?(count/size):(count/size+1);
        pageid=pageid<1?1:page;
        pageid=pageid>maxpage?maxpage:page;

        if(page!=null){
            page=pageid;
        }
        session.setAttribute("remaxpage", maxpage);
        session.setAttribute("repage", page);


        List<replyuser> list=biz.queryReplyByIdForPage(forumid,(page-1)*size,size);

        return list;

    }

    @RequestMapping(value = "/addCollect")
    public void addCollect(Integer userid,Integer forumid,HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }


        System.out.println("收藏"+userid+""+forumid);
        //获取当前时间

        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();// 获取当前时间
        String time=sdf.format(date);
        if(biz.collectForum(userid,forumid,time)){
            out.print("<script>alert('收藏成功');window.location.href=document.referrer;</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/cancelCollect")
    public void cancelCollect(Integer userid,Integer forumid,HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(biz.cancelCollectForum(forumid,userid)){
            System.out.println("345678"+userid+""+forumid);
            out.print("<script>alert('取消收藏成功');window.location.href=document.referrer;</script>");
        }
        out.flush();
        out.close();
    }


    @RequestMapping(value = "/replyforpage")
    @ResponseBody
    public searchReply replyforpage(HttpServletRequest request) {
        //第一步 ,设置请求编码
        try {
            request.setCharacterEncoding("utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        //第三步 调用biz访问到层获取该key对应的查询结果
        String strpage=request.getParameter("page");
        String forumid1=request.getParameter("forumid");
        System.out.println(forumid1);
        Integer forumid = Integer.valueOf(forumid1);
        //算出page合理值
        int page=1; //当前是第1页
        if(strpage==null){
            page=1;
        }else{
            try {
                page=Integer.valueOf(strpage);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        //算出最大页数
        int size=8; //每页显示12条
        //总共的记录数
        Integer count = biz.queryReplyByIdCount(forumid);

        int maxPage=(count%size==0)?(count/size):(count/size+1);


        //根据当前页数得到对应页的数据
        List<replyuser> list=biz.queryReplyByIdForPage(forumid,(page - 1) * size, size);

        //page确定上限和下限
        page=page<0?1:page;
        page=page>maxPage?maxPage:page;
        searchReply su = new searchReply();
        su.setList(list);
        su.setMaxPage(maxPage);
        su.setPage(page);
        return su;
    }

    @RequestMapping(value = "/queryCollectByUserId")
    @ResponseBody
    public List<collectuser> queryCollectByUserId(Integer userid,Integer page,HttpSession session){
        int pageid=1;
        int size=20;

        int count=biz.queryMyCollectCount(userid);
        int maxpage=count%size==0?(count/size):(count/size+1);
        pageid=pageid<1?1:page;
        pageid=pageid>maxpage?maxpage:page;

        if(page!=null){
            page=pageid;
        }
        session.setAttribute("remaxpage", maxpage);
        session.setAttribute("repage", page);

        List<collectuser> list=biz.queryMyAllCollect(userid,(page-1)*size,size);
        System.out.println(list);
        return list;
    }

    @RequestMapping(value = "/addForum")
    public void addForum(Integer userid,String forum_title,String forum_text,HttpServletResponse response){

        //获取当前时间
        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();// 获取当前时间
        String time=sdf.format(date);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer browse=1;

        if(biz.addForum(userid,forum_title,forum_text,time,browse)){
            out.print("<script>alert('发表成功');window.location.href='queryAllForumByPage.do?page=1';</script>");
        }else{
            out.print("<script>alert('发表失败');history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

}
