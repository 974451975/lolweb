package com.etc.lol.controller;


import com.etc.lol.biz.InfluenceBiz;

import com.etc.lol.entity.Influence;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/placecontroller")
public class MyInfluenceController {

    @Resource
    private InfluenceBiz biz;

    @RequestMapping(value = "/queryAllPlace")
    @ResponseBody
    public List<Influence> queryFourHero() {
        return biz.queryAllInfluence();
    }
}
