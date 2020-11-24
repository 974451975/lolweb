package com.etc.lol.entity;

public class Information {
    private Integer information_id;
    private Integer information_hero;
    private String information_title;
    private String information_text;
    private Integer information_agree;
    private String  information_motto;

    public Integer getInformation_id() {
        return information_id;
    }

    public void setInformation_id(Integer information_id) {
        this.information_id = information_id;
    }

    public Integer getInformation_hero() {
        return information_hero;
    }

    public void setInformation_hero(Integer information_hero) {
        this.information_hero = information_hero;
    }

    public String getInformation_title() {
        return information_title;
    }

    public void setInformation_title(String information_title) {
        this.information_title = information_title;
    }

    public String getInformation_text() {
        return information_text;
    }

    public void setInformation_text(String information_text) {
        this.information_text = information_text;
    }

    public Integer getInformation_agree() {
        return information_agree;
    }

    public void setInformation_agree(Integer information_agree) {
        this.information_agree = information_agree;
    }

    public String getInformation_motto() { return information_motto; }

    public void setInformation_motto(String information_motto) { this.information_motto = information_motto; }
}
