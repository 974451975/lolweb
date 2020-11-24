package com.etc.lol.bizimpl;

import com.etc.lol.biz.ForumBiz;
import com.etc.lol.dao.ForumDao;
import com.etc.lol.dto.collectuser;
import com.etc.lol.dto.forumuser;
import com.etc.lol.dto.replyuser;
import com.etc.lol.entity.Collect;
import com.etc.lol.entity.Forum;
import com.etc.lol.entity.Reply;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ForumBizImpl implements ForumBiz {

    @Resource
    private ForumDao dao;


    @Override
    public List<Forum> queryAllForum() { return dao.queryAllForum(); }

    @Override
    public Integer queryAllForumCount() {
        return dao.queryAllForumCount();
    }

    @Override
    public List<forumuser> queryAllForumByPage(Integer page, Integer size) {
        return dao.queryAllForumByPage(page,size);
    }

    @Override
    public boolean givelike(Integer id) {
        if(id!=null){
            return dao.givelike(id);
        }else{
            return false;
        }

    }

    @Override
    public boolean cancellike(Integer id) {
        if(id!=null){
            return dao.cancellike(id);
        }else{
            return false;
        }
    }

    @Override
    public boolean collectForum(Integer forumid, Integer userid, String time) {
        if(forumid!=null&&userid!=null){
            return dao.collectForum(forumid,userid,time);
        }else{
            return false;
        }

    }

    @Override
    public boolean cancelCollectForum(Integer forumid, Integer userid) {
        if(forumid!=null&&userid!=null){
            return dao.cancelCollectForum(forumid,userid);
        }else{
            return false;
        }
    }

    @Override
    public Collect queryIsCollect(Integer userid, Integer forumid) {
        return dao.queryIsCollect(userid,forumid);
    }

    @Override
    public List<forumuser> queryForumByKey(String key, Integer page, Integer size) { return dao.queryForumByKey(key,page,size); }

    @Override
    public Integer queryForumKeyCount(String key) {
        return dao.queryForumKeyCount(key);
    }

    @Override
    public forumuser queryForumByid(Integer forumid) {
        return dao.queryForumByid(forumid);
    }

    @Override
    public boolean replyForum(Integer userid, Integer forumid, String text, String time) { return dao.replyForum(userid,forumid,text,time); }

    @Override
    public List<replyuser> queryReplyById(Integer forumid) { return dao.queryReplyById(forumid); }

    @Override
    public List<replyuser> queryReplyByIdForPage(Integer forumid, Integer page, Integer size) { return dao.queryReplyByIdForPage(forumid,page,size); }

    @Override
    public Integer queryReplyByIdCount(Integer forumid) { return dao.queryReplyByIdCount(forumid); }

    @Override
    public List<collectuser> queryMyAllCollect(Integer userid,Integer page,Integer size) { return dao.queryMyAllCollect(userid,page,size); }

    @Override
    public Integer queryMyCollectCount(Integer userid) { return dao.queryMyCollectCount(userid); }

    @Override
    public boolean addForum(Integer userid, String forum_title, String forum_text, String time, Integer borwser) {
        return dao.addForum(userid,forum_title,forum_text,time,borwser);
    }


}

