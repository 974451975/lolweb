package com.etc.lol.bizimpl;

import com.etc.lol.biz.StoryBiz;
import com.etc.lol.dao.StoryDao;
import com.etc.lol.dto.herostoryDto;
import com.etc.lol.entity.Story;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class StoryBizImpl implements StoryBiz {
    @Resource
    private StoryDao dao;

    @Override
    public List<Story> queryFourStory() {
        return dao.queryFourStory();
    }

    @Override
    public List<Story> queryAllStoryByPage(Integer page, Integer size) {
        return dao.queryAllStoryByPage(page, size);
    }

    @Override
    public Integer queryAllStoryCount() {
        return dao.queryAllStoryCount();
    }

    @Override
    public List<Story> queryStoryAll() {
        return dao.queryStoryAll() ;
    }

    @Override
    public List<herostoryDto> queryHeroStoryById(Integer id) {
        return dao.queryHeroStoryById(id);
    }

    @Override
    public List<Story> queryStoryByKey(String key) {
        return dao.queryStoryByKey(key);
    }

    @Override
    public Story queryStoryIndexById(Integer id) {
        return dao.queryStoryIndexById(id);
    }
}
