package com.etc.lol.bizimpl;

import com.etc.lol.biz.InfluenceBiz;
import com.etc.lol.dao.InfluenceDao;
import com.etc.lol.dao.UserDao;
import com.etc.lol.entity.Influence;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class InfluenceBizImpl implements InfluenceBiz {
    @Resource
    private InfluenceDao dao;

    @Override
    public Influence queryInfById(Integer id) {
        return dao.queryInfById(id);
    }

    @Override
    public List<Influence> queryAllInfluence() {
        return dao.queryAllInfluence();
    }
}