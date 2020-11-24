package com.etc.lol.biz;

import com.etc.lol.entity.Hero;
import com.etc.lol.dto.heroDto;

import java.util.List;

public interface HeroBiz {


      public List<Hero> queryAll();

      public List<Hero> queryFourHero();

      public heroDto queryHeroById(Integer id);

      public List<Hero> queryAllByPage(Integer page, Integer size);

      public Integer queryAllHeroCount();

      public List<Hero> queryHeroByKey(String hkey);
}
