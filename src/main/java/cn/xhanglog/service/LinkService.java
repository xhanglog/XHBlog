package cn.xhanglog.service;

import cn.xhanglog.entity.Link;

import java.util.List;

/**
 * @Author: Xhang
 */
public interface LinkService {
    /**
     * 获得显示在主页的友情链接数目
     * @return
     */
    List<Link> getShowIndexLinkList();

    /**
     * 获得所有的友情链接数目
     * @return
     */
    Integer getLinkCount();
}
