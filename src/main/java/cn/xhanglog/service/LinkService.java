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

    Integer editSwitch(Integer linkId, Boolean val, String name);

    Link getLinkInfo(Integer linkId);

    Integer addLink(Link link);

    Integer editLink(Link link);

    List<Link> getLinks(Integer page, Integer size, String title);

    Integer getLinkCountByCriteria(String title);

    Integer delLinkById(Integer linkId);

    List<Link> getPreLinks();
}
