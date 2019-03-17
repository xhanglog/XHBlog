package cn.xhanglog.service;

import cn.xhanglog.entity.Tag;

import java.util.List;

/**
 * @Author: Xhang
 */
public interface TagService {
    List<Tag> getTagList();

    Tag getTagByName(String tagName);
}
