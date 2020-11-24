package com.etc.lol.entity;

public class Hero {
    private Integer hero_id;
    private String hero_name;
    private String hero_title;
    private Influence hero_influenece;
    private Profession hero_profession;
    private String hero_logo;
    private String hero_img;
    private String hero_info;

    public String getHero_info() {
        return hero_info;
    }

    public void setHero_info(String hero_info) {
        this.hero_info = hero_info;
    }

    public String getHero_img() {
        return hero_img;
    }

    public void setHero_img(String hero_img) {
        this.hero_img = hero_img;
    }

    public Integer getHero_id() {
        return hero_id;
    }

    public void setHero_id(Integer hero_id) {
        this.hero_id = hero_id;
    }

    public String getHero_name() {
        return hero_name;
    }

    public void setHero_name(String hero_name) {
        this.hero_name = hero_name;
    }

    public String getHero_title() {
        return hero_title;
    }

    public void setHero_title(String hero_title) {
        this.hero_title = hero_title;
    }

    public Influence getHero_influenece() {
        return hero_influenece;
    }

    public void setHero_influenece(Influence hero_influenece) {
        this.hero_influenece = hero_influenece;
    }

    public Profession getHero_profession() {
        return hero_profession;
    }

    public void setHero_profession(Profession hero_profession) {
        this.hero_profession = hero_profession;
    }

    public String getHero_logo() {
        return hero_logo;
    }

    public void setHero_logo(String hero_logo) {
        this.hero_logo = hero_logo;
    }
}
