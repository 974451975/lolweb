package com.etc.lol.entity;

public class Forum {
    private Integer forum_id;
    private String forum_title;
    private User forum_user;
    private String forum_time;
    private String forum_text;
    private Integer forum_satus;
    private Integer forum_browse;
    private Integer forum_good;

    public Integer getForum_browse() {
        return forum_browse;
    }

    public void setForum_browse(Integer forum_browse) {
        this.forum_browse = forum_browse;
    }

    public Integer getForum_good() {
        return forum_good;
    }

    public void setForum_good(Integer forum_good) {
        this.forum_good = forum_good;
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

    public User getForum_user() {
        return forum_user;
    }

    public void setForum_user(User forum_user) {
        this.forum_user = forum_user;
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

    public Integer getForum_satus() {
        return forum_satus;
    }

    public void setForum_satus(Integer forum_satus) {
        this.forum_satus = forum_satus;
    }
}
