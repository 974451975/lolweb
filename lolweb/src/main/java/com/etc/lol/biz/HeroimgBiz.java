package com.etc.lol.biz;

import com.etc.lol.entity.Heroimg;

import java.util.List;

public interface HeroimgBiz {
    //查询所有插画
    public List<Heroimg> queryALLHeroimg();
    //通过关键字查询插画
    public List<Heroimg> queryHeroimgByKey(String key);
    //查询英雄关联的插画
    public List<Heroimg> queryHeroimgById(Integer id);
    //分页
    public List<Heroimg> queryAllHeroimgByPage(Integer page, Integer size);
    //总条数
    public Integer queryAllHeroimgCount();
}