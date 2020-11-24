package com.etc.lol.entity;

public class Reply {
    private Integer reply_id;
    private User reply_user;
    private String reply_time;
    private String reply_text;

    public Integer getReply_id() {
        return reply_id;
    }

    public void setReply_id(Integer reply_id) {
        this.reply_id = reply_id;
    }

    public User getReply_user() {
        return reply_user;
    }

    public void setReply_user(User reply_user) {
        this.reply_user = reply_user;
    }

    public String getReply_time() {
        return reply_time;
    }

    public void setReply_time(String reply_time) {
        this.reply_time = reply_time;
    }

    public String getReply_text() {
        return reply_text;
    }

    public void setReply_text(String reply_text) {
        this.reply_text = reply_text;
    }
}
