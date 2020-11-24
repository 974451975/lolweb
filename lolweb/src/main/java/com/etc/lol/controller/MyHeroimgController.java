package com.etc.lol.controller;

import com.etc.lol.biz.HeroimgBiz;
import com.etc.lol.dto.herostoryDto;
import com.etc.lol.entity.Hero;
import com.etc.lol.entity.Heroimg;
import com.etc.lol.entity.Story;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value = "/heroimgcontroller")
public class MyHeroimgController {
    @Resource
    private HeroimgBiz biz;

    @RequestMapping(value = "/queryAllHeroimg")
    public void queryAllHeroimg(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Heroimg> heroimglist = biz.queryALLHeroimg();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";

        if (heroimglist != null) {
            session.setAttribute("heroimglist", heroimglist);
            out.print("<script>location.href='" + basePath + "heroimgIndex.jsp';</script>");
        } else {
            out.print("<script>alert('没有找到');</script>");
        }
        out.flush();
        out.close();
    }



    @RequestMapping(value = "/queryHeroimgByKey")
    @ResponseBody
    public void queryHeroimgByKey(String imgkey, HttpSession session,HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        String key = "%" + imgkey + "%";
        System.out.println(key);

        List<Heroimg> list = biz.queryHeroimgByKey(key);
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";

        PrintWriter out = null;
        System.out.println(list);
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (list != null) {
            session.setAttribute("list", list);
            out.print("<script>location.href='" + basePath + "showimg.jsp';</script>");
        } else {
            out.print("<script>alert('没有找到');</script>");
        }
        out.flush();
        out.close();
    }

    //关键字查询
    @RequestMapping(value = "/queryAllHeroimgByPage")
    public String queryAllHeroimgByPage(Integer page, HttpServletRequest request) {
        int pageid = 1;
        int size = 6;
        int count = biz.queryAllHeroimgCount();
        System.out.println(count);
        int maxpage = count % size == 0 ? (count / size) : (count / size + 1);
        pageid = pageid < 1 ? 1 : page;
        pageid = pageid > maxpage ? maxpage : page;
        if (page != null) {
            page = pageid;
        }
        List<Heroimg> heroimglist = biz.queryAllHeroimgByPage((page - 1) * size, size);
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";

        request.setAttribute("heroimglist", heroimglist);
        request.setAttribute("maxpage", maxpage);
        request.setAttribute("page", page);

        return "heroimgIndex";
    }
}