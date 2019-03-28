package cn.xhanglog.service.impl;

import cn.xhanglog.dao.LinkMapper;
import cn.xhanglog.entity.Link;
import cn.xhanglog.service.LinkService;
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
public class LinkServiceImpl implements LinkService {

    @Autowired
    private LinkMapper linkMapper;
    @Override
    @Cacheable(value = "link")
    public List<Link> getShowIndexLinkList() {
        return linkMapper.getShowIndexLinkList();
    }
}
