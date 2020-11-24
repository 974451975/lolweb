package com.etc.lol.dao;

import com.etc.lol.entity.Influence;

import java.util.List;

public interface InfluenceDao {
    //通过ID 查找地区
    public Influence queryInfById(Integer id);

    public List<Influence> queryAllInfluence();
}
