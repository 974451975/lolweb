package com.etc.lol.entity;

public class Story {
    private Integer story_id;
    private HeroStory story_sh   ;
    private String story_title;
    private String story_context;
    private Integer story_agree;
    private String story_img;
    private String story_author;


    public Integer getStory_id() {
        return story_id;
    }

    public void setStory_id(Integer story_id) {
        this.story_id = story_id;
    }

    public HeroStory getStory_sh() {
        return story_sh;
    }

    public void setStory_sh(HeroStory story_sh) {
        this.story_sh = story_sh;
    }

    public String getStory_title() {
        return story_title;
    }

    public void setStory_title(String story_title) {
        this.story_title = story_title;
    }

    public String getStory_context() {
        return story_context;
    }

    public void setStory_context(String story_context) {
        this.story_context = story_context;
    }

    public Integer getStory_agree() {
        return story_agree;
    }

    public void setStory_agree(Integer story_agree) {
        this.story_agree = story_agree;
    }

    public String getStory_img() {
        return story_img;
    }

    public void setStory_img(String story_img) {
        this.story_img = story_img;
    }

    public String getStory_author() {
        return story_author;
    }

    public void setStory_author(String story_author) {
        this.story_author = story_author;
    }
}
