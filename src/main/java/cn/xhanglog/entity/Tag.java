package cn.xhanglog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 标签实体
 * @Author: Xhang
 */
public class Tag implements Serializable {
    private Integer tagId;
    private String tagName;
    private String tagDescription;
    private Date tagCreateTime;
    private Date tagUpdateTime;

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getTagDescription() {
        return tagDescription;
    }

    public void setTagDescription(String tagDescription) {
        this.tagDescription = tagDescription;
    }

    public Date getTagCreateTime() {
        return tagCreateTime;
    }

    public void setTagCreateTime(Date tagCreateTime) {
        this.tagCreateTime = tagCreateTime;
    }

    public Date getTagUpdateTime() {
        return tagUpdateTime;
    }

    public void setTagUpdateTime(Date tagUpdateTime) {
        this.tagUpdateTime = tagUpdateTime;
    }

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }
}
