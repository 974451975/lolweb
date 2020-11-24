package com.etc.lol.bizimpl;

import com.etc.lol.biz.HeroimgBiz;
import com.etc.lol.dao.HeroimgDao;
import com.etc.lol.entity.Heroimg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class HeroimgBizImpl implements HeroimgBiz {
    @Resource
    private HeroimgDao dao;

    @Override
    public List<Heroimg> queryALLHeroimg() {
        return dao.queryALLHeroimg();
    }

    @Override
    public List<Heroimg> queryHeroimgByKey(String key) {
        return dao.queryHeroimgByKey(key);
    }

    @Override
    public List<Heroimg> queryHeroimgById(Integer id) {
        return dao.queryHeroimgById(id);
    }

    @Override
    public Integer queryAllHeroimgCount() {
        return dao.queryAllHeroimgCount();
    }

    @Override
    public List<Heroimg> queryAllHeroimgByPage(Integer page, Integer size) {
        return dao.queryAllHeroimgByPage(page, size);
    }
}