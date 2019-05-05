package cn.xhanglog.service.impl;

import cn.xhanglog.dao.LinkMapper;
import cn.xhanglog.entity.Link;
import cn.xhanglog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class LinkServiceImpl implements LinkService {

    @Autowired
    private LinkMapper linkMapper;
    @Override
    @Cacheable(value = "link")
    public List<Link> getShowIndexLinkList() {
        return linkMapper.getShowIndexLinkList();
    }

    @Override
    public Integer getLinkCount() {
        return linkMapper.getLinkCount();
    }

    @Override
    public List<Link> getLinks(Integer page, Integer size, String linkName) {
        Integer startRow = (page-1) * size;
        return linkMapper.getLinks(startRow,size,linkName);
    }

    @Override
    public Integer getLinkCountByCriteria(String linkName) {
        return linkMapper.getLinkCountByCriteria(linkName);
    }

    @Override
    @CacheEvict(value = "link",allEntries=true)
    public Integer delLinkById(Integer linkId) {
        return linkMapper.delLinkById(linkId);
    }

    @Override
    public List<Link> getPreLinks() {
        return linkMapper.getPreLinks();
    }

    @Override
    @CacheEvict(value = "link",allEntries=true)
    public Integer editSwitch(Integer linkId, Boolean val, String name) {
        return linkMapper.editSwitch(linkId,val,name);
    }

    @Override
    public Link getLinkInfo(Integer linkId) {
        return linkMapper.getLinkInfo(linkId);
    }

    @Override
    @CacheEvict(value = "link",allEntries=true)
    public Integer addLink(Link link) {
        return linkMapper.addLink(link);
    }

    @Override
    @CacheEvict(value = "link",allEntries=true)
    public Integer editLink(Link link) {
        return linkMapper.editLink(link);
    }
}
