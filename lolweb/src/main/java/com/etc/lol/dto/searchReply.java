package com.etc.lol.dto;

import java.util.List;

public class searchReply {
    private Integer page;
    private Integer maxPage;
    private List<replyuser> list;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(Integer maxPage) {
        this.maxPage = maxPage;
    }

    public List<replyuser> getList() {
        return list;
    }

    public void setList(List<replyuser> list) {
        this.list = list;
    }
}
