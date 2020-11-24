package com.etc.lol.controller;

import com.etc.lol.biz.HeroBiz;

import com.etc.lol.entity.Hero;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.etc.lol.dto.heroDto;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.util.List;
@Controller
@RequestMapping(value = "/herocontroller")
public class MyHeroController {

    @Resource
    private HeroBiz biz;

    @RequestMapping(value = "/queryAllHero")
    public String queryAllHero(HttpSession session,HttpServletResponse response,HttpServletRequest request) {


        List<Hero> herolist= biz.queryAll();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("herolist",herolist);
        return "heroIndex";
    }

    @RequestMapping(value = "/queryFourHero")
    @ResponseBody
    public List<Hero> queryFourHero() {
        return biz.queryFourHero();
    }


    @RequestMapping(value = "/showHero/{heroid}", method = RequestMethod.GET)
    public void showHero( @PathVariable(value ="heroid" ) Integer heroid,HttpSession session, HttpServletResponse response,HttpServletRequest request) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(heroid);
        heroDto hero = biz.queryHeroById(heroid);

        String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";


        if (hero != null) {
            session.setAttribute("hero", hero);
            out.print("<script>location.href='"+basePath+"hero.jsp';</script>");
        } else {
            out.print("<script>alert('没有找到');</script>");
        }
        out.flush();
        out.close();

    }


    @RequestMapping(value = "/queryAllHeroByPage")
    public String queryAllHeroByPage( Integer page,HttpServletRequest request) {

        int pageid=1;
        int size=8;

        int count=biz.queryAllHeroCount();
        int maxpage=count%size==0?(count/size):(count/size+1);
        pageid=pageid<1?1:page;
        pageid=pageid>maxpage?maxpage:page;

        if(page!=null){
            page=pageid;
        }

        List<Hero> herolist= biz.queryAllByPage((page-1)*size,size);



        String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";

            request.setAttribute("herolist", herolist);
            request.setAttribute("maxpage", maxpage);
            request.setAttribute("page", page);

            return "heroIndex";

    }


    @RequestMapping(value = "/queryHeroByKey")
    @ResponseBody
    public List<Hero> queryHeroByKey( String hkey,HttpServletRequest request){

        String key="%"+hkey+"%";

        List<Hero> list=biz.queryHeroByKey(key);

        return list;
    }


}