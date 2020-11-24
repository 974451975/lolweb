package com.etc.lol.bizimpl;

import com.etc.lol.biz.HeroBiz;
import com.etc.lol.dao.HeroDao;
import com.etc.lol.entity.Hero;
import org.springframework.stereotype.Service;
import com.etc.lol.dto.heroDto;
import javax.annotation.Resource;
import java.util.List;

@Service
public class HeroBizImpl implements HeroBiz {

    @Resource
    private HeroDao dao;


    @Override
    public List<Hero> queryAll() {
        return dao.queryAll();
    }

    @Override
    public List<Hero> queryFourHero(){ return dao.queryFourHero(); }


    @Override
    public heroDto queryHeroById(Integer id) {
        if(id!=null){
            return dao.queryHeroById(id);
        }else{
            return null;
        }

    }


    @Override
    public List<Hero> queryAllByPage(Integer page, Integer size) {
        if(page!=null){
            return dao.queryAllByPage(page,size);
        }else{
            return null;
        }

    }

    @Override
    public Integer queryAllHeroCount() { return dao.queryAllHeroCount(); }

    @Override
    public List<Hero> queryHeroByKey(String hkey) {
        if(hkey!=null){
            return dao.queryHeroByKey(hkey);
        }else{
            return null;
        }

    }
}
