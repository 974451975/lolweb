package com.etc.lol.biz;

import com.etc.lol.dto.herostoryDto;
import com.etc.lol.entity.Story;

import java.util.List;

public interface StoryBiz {
    //查看所有故事
    public List<Story> queryStoryAll();
    //查4条故事
    public List<Story> queryFourStory();
    //分页
    public List<Story> queryAllStoryByPage(Integer page, Integer size);
    //总条数
    public Integer queryAllStoryCount();
    //查询英雄关联的故事
    public List<herostoryDto> queryHeroStoryById(Integer id);
    //通过关键字查询插画
    public List<Story> queryStoryByKey(String key);

    public Story queryStoryIndexById(Integer id);
}
