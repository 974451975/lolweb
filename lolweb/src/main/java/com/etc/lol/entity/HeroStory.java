package com.etc.lol.entity;

public class HeroStory {
    private Integer herostory_id;
    private Hero herostory_hero;
    private Story herostory_story;

    public Integer getHerostory_id() {
        return herostory_id;
    }

    public void setHerostory_id(Integer herostory_id) {
        this.herostory_id = herostory_id;
    }

    public Hero getHerostory_hero() {
        return herostory_hero;
    }

    public void setHerostory_hero(Hero herostory_hero) {
        this.herostory_hero = herostory_hero;
    }

    public Story getHerostory_story() {
        return herostory_story;
    }

    public void setHerostory_story(Story herostory_story) {
        this.herostory_story = herostory_story;
    }
}
