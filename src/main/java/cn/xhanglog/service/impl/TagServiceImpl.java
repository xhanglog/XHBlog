package cn.xhanglog.service.impl;

import cn.xhanglog.dao.TagMapper;
import cn.xhanglog.entity.Tag;
import cn.xhanglog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    @Cacheable(value = "tag")
    public List<Tag> getTagList() {
        List<Tag> tagList = tagMapper.getTagList();
        return tagList;
    }

    @Override
    public Tag getTagByName(String tagName) {
        return tagMapper.getTagByName(tagName);
    }
}