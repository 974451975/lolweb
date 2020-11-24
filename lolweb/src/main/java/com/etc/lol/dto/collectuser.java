package com.etc.lol.dto;

public class collectuser {


    private Integer collect_id;
    private Integer forum_id;
    private String forum_title;
    private String collect_user;
    private String collect_time;

    public Integer getForum_id() {
        return forum_id;
    }

    public void setForum_id(Integer forum_id) {
        this.forum_id = forum_id;
    }
    public Integer getCollect_id() {
        return collect_id;
    }

    public void setCollect_id(Integer collect_id) {
        this.collect_id = collect_id;
    }

    public String getForum_title() {
        return forum_title;
    }

    public void setForum_title(String forum_title) {
        this.forum_title = forum_title;
    }

    public String getCollect_user() {
        return collect_user;
    }

    public void setCollect_user(String collect_user) {
        this.collect_user = collect_user;
    }

    public String getCollect_time() {
        return collect_time;
    }

    public void setCollect_time(String collect_time) {
        this.collect_time = collect_time;
    }
}
