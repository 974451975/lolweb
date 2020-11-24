package com.etc.lol.biz;

import com.etc.lol.dto.collectuser;
import com.etc.lol.dto.forumuser;
import com.etc.lol.dto.replyuser;
import com.etc.lol.entity.Collect;
import com.etc.lol.entity.Forum;
import com.etc.lol.entity.Reply;

import java.util.List;

public interface ForumBiz {

    public List<Forum> queryAllForum();

    public Integer queryAllForumCount();

    public List<forumuser> queryAllForumByPage(Integer page, Integer size);

    /**
     * 点赞功能
     * 戴哥
     * @return
     */
    public boolean givelike(Integer id);
    public boolean cancellike(Integer id);

    /**
     * 收藏功能
     * dxj
     */
    public boolean collectForum(Integer forumid , Integer userid , String time);
    public boolean cancelCollectForum(Integer forumid , Integer userid);
    public Collect queryIsCollect(Integer userid, Integer forumid);

    /**
     * 搜索帖子
     * dxj
     */
    public List<forumuser> queryForumByKey(String key,Integer page, Integer size);

    /**
     * 搜索帖子条数
     */
    public Integer queryForumKeyCount(String key);

    /**
     * 通过id查找帖子
     * dxj
     */
    public forumuser queryForumByid(Integer forumid);

    /**
     * 用户回复帖子
     * dxj
     */
    public boolean replyForum(Integer userid,Integer forumid,String text,String time);

    /**
     * 通过id查回帖帖子
     * dxj
     */
    public List<replyuser> queryReplyById(Integer forumid);


    public List<replyuser> queryReplyByIdForPage(Integer forumid,Integer page,Integer size);

    public Integer queryReplyByIdCount(Integer forumid);

    public List<collectuser> queryMyAllCollect(Integer userid,Integer page,Integer size);

    public Integer queryMyCollectCount(Integer userid);

    public boolean addForum(Integer userid,String forum_title,String forum_text,String time,Integer borwser);

}
