package com.etc.lol.controller;

import com.etc.lol.biz.StoryBiz;
import com.etc.lol.dto.herostoryDto;
import com.etc.lol.entity.Hero;
import com.etc.lol.entity.Heroimg;
import com.etc.lol.entity.Story;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value = "/storycontroller")
public class MyStoryController {
    @Resource
    private StoryBiz biz;

    @RequestMapping(value = "/queryAllStory")
    public void queryAllHero(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Story> storylist = biz.queryStoryAll();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";

        if (storylist != null) {
            session.setAttribute("storylist", storylist);
            out.print("<script>location.href='" + basePath + "storyIndex.jsp';</script>");
        } else {
            out.print("<script>alert('没有找到');</script>");
        }
        out.flush();
        out.close();
    }


    @RequestMapping(value = "/queryFourStory")
    @ResponseBody
    public List<Story> queryFourStory() {
        return biz.queryFourStory();
    }


    @RequestMapping(value = "/queryAllStoryByPage")
    public String queryAllStoryByPage(Integer page, HttpServletRequest request) {

        int pageid = 1;
        int size = 4;

        int count = biz.queryAllStoryCount();
        int maxpage = count % size == 0 ? (count / size) : (count / size + 1);
        pageid = pageid < 1 ? 1 : page;
        pageid = pageid > maxpage ? maxpage : page;

        if (page != null) {
            page = pageid;
        }

        List<Story> storylist = biz.queryAllStoryByPage((page - 1) * size, size);
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";

        request.setAttribute("storylist", storylist);
        request.setAttribute("maxpage", maxpage);
        request.setAttribute("page", page);

        return "storyIndex";
    }

    @RequestMapping(value = "/queryStoryById/{heroid}", method = RequestMethod.GET)
    @ResponseBody
    public List<herostoryDto> queryStoryById(@PathVariable(value = "heroid") Integer heroid, HttpSession session, HttpServletResponse response, HttpServletRequest request) {

        List<herostoryDto> heroStoryList = biz.queryHeroStoryById(heroid);
        System.out.println(heroStoryList.size());
        if (heroStoryList.size() > 0) {
            return heroStoryList;
        }
        return null;
    }

    @RequestMapping(value = "/queryStoryByKey")
    @ResponseBody
    public void queryStoryByKey(String skey, HttpSession session,HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        String key = "%" + skey + "%";
        System.out.println(key);

        List<Story> list = biz.queryStoryByKey(key);
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
            out.print("<script>location.href='" + basePath + "story.jsp';</script>");
        } else {
            out.print("<script>alert('没有找到');</script>");
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/queryStoryIndexById")
    public void queryStoryIndexById(Integer id,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Story story=biz.queryStoryIndexById(id);
        session.setAttribute("storys",story);
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        out.print("<script>location.href='" + basePath + "story.jsp';</script>");
        out.flush();
        out.close();
    }

}