package cn.xhanglog.service;

import cn.xhanglog.entity.Tag;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
public interface TagService {
    /**
     * 获取所有的标签
     * @return
     */
    List<Tag> getTagList();

    /**
     * 根据名称获取标签
     * @param tagName
     * @return
     */
    Tag getTagByName(String tagName);

    /**
     * 获取标签总数
     * @return
     */
    Integer getTagCount();

    List<Tag> getTags(Integer page, Integer size, Date start, Date end, String tagName);

    Integer getTagCountByCriteria(Date start, Date end, String tagName);

    Tag getTagById(Integer tagId);

    Integer delTagById(Integer tagId);

    Integer editTagById(Tag tag);

    Integer addTag(Tag tag);
}
