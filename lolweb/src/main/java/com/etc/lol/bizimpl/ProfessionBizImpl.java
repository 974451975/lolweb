package com.etc.lol.bizimpl;

import com.etc.lol.biz.ProfessionBiz;
import com.etc.lol.dao.ProfessionDao;
import com.etc.lol.entity.Profession;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProfessionBizImpl implements ProfessionBiz {

    @Resource
    private ProfessionDao dao;

    @Override
    public Profession queryPosById(Integer id) {
        return dao.queryPosById(id);
    }
}
