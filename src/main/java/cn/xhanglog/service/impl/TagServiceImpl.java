package cn.xhanglog.service.impl;

import cn.xhanglog.dao.TagMapper;
import cn.xhanglog.entity.Tag;
import cn.xhanglog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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

    @Override
    public Integer getTagCount() {
        return tagMapper.getTagCount();
    }

    @Override
    public List<Tag> getTags(Integer page, Integer size, Date start, Date end, String tagName) {
        Integer startRow = (page-1) * size;
        return tagMapper.getTags(startRow,size,start,end,tagName);
    }

    @Override
    public Integer getTagCountByCriteria(Date start, Date end, String tagName) {
        return tagMapper.getTagCountByCriteria(start,end,tagName);
    }

    @Override
    public Tag getTagById(Integer tagId) {
        return tagMapper.getTagById(tagId);
    }

    @Override
    @CacheEvict(value = "tag",allEntries=true)
    public Integer delTagById(Integer tagId) {
        return tagMapper.delTagById(tagId);
    }

    @Override
    @CachePut(value = "tag")
    public Integer editTagById(Tag tag) {
        return tagMapper.editTagById(tag);
    }

    @Override
    @CacheEvict(value = "tag",allEntries=true)
    public Integer addTag(Tag tag) {
        return tagMapper.addTag(tag);
    }
}