package com.pojo;

import java.util.List;

public class Page<T> {
    private Integer begin;//下标
    private Integer elementSize;//往后查的数量
    private Integer pageSize;//总共可以分为几页
    private Integer sumSize;//数据库中查询的总数量
    private List<T> elements;//查询到的信息列表

    public Integer getBegin() {
        return begin;
    }

    public void setBegin(Integer begin) {
        if(begin < 1)
            this.begin = 1;
        else if(begin > pageSize)
            this.begin = pageSize;
        else
            this.begin = begin;
    }

    public Integer getElementSize() {
        return elementSize;
    }

    public void setElementSize(Integer elementSize) {
        this.elementSize = elementSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getSumSize() {
        return sumSize;
    }

    public void setSumSize(Integer sumSize) {
        this.sumSize = sumSize;
    }

    public List<T> getElements() {
        return elements;
    }

    public void setElements(List<T> elements) {
        this.elements = elements;
    }
}
