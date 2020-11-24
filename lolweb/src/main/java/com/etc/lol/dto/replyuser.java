package com.etc.lol.dto;

public class replyuser {

    public Integer reply_id;
    public String reply_text;
    public String reply_time;

    public Integer user_id;
    private String user_name;
    private String user_img;
    private Integer user_level;

    public Integer forum_id;
    public String forum_title;
    public String forum_time;
    private String forum_text;
    private Integer forum_browse;

    public Integer getReply_id() {
        return reply_id;
    }

    public void setReply_id(Integer reply_id) {
        this.reply_id = reply_id;
    }

    public String getReply_text() {
        return reply_text;
    }

    public void setReply_text(String reply_text) {
        this.reply_text = reply_text;
    }

    public String getReply_time() {
        return reply_time;
    }

    public void setReply_time(String reply_time) {
        this.reply_time = reply_time;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_img() {
        return user_img;
    }

    public void setUser_img(String user_img) {
        this.user_img = user_img;
    }

    public Integer getUser_level() {
        return user_level;
    }

    public void setUser_level(Integer user_level) {
        this.user_level = user_level;
    }

    public Integer getForum_id() {
        return forum_id;
    }

    public void setForum_id(Integer forum_id) {
        this.forum_id = forum_id;
    }

    public String getForum_title() {
        return forum_title;
    }

    public void setForum_title(String forum_title) {
        this.forum_title = forum_title;
    }

    public String getForum_time() {
        return forum_time;
    }

    public void setForum_time(String forum_time) {
        this.forum_time = forum_time;
    }

    public String getForum_text() {
        return forum_text;
    }

    public void setForum_text(String forum_text) {
        this.forum_text = forum_text;
    }

    public Integer getForum_browse() {
        return forum_browse;
    }

    public void setForum_browse(Integer forum_browse) {
        this.forum_browse = forum_browse;
    }
}
