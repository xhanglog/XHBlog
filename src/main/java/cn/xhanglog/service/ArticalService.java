package cn.xhanglog.service;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.util.Page;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
public interface ArticalService {

    /**
     * 推荐文章
     * @return
     */
    List<Artical> getRecommendedArtical();

    /**
     * 点击最多的文章
     * @return
     */
    List<Artical> getClickMostArtical();

    /**
     * 评论最多的文章
     * @return
     */
    List<Artical> getCommentMost();

    /**
     * 展示在首页的文章
     * @return
     */
    List<Artical> getShowIndexArtical();

    /**
     * 根据文章id 获取文章详情
     * @param id
     * @return
     */
    Artical getArticalInfoById(Integer id);

    /**
     * 获取上一篇文章
     * @param id
     * @return
     */
    Artical getPreArtical(Integer id);

    /**
     * 获取下一篇文章
     * @param id
     * @return
     */
    Artical getAfterArtical(Integer id);

    /**
     * 根据标签Id获取所属该标签的文章列表
     * @param tagId
     * @param page
     * @param rows
     * @return
     */
    Page<Artical> getArticalListByTagId(Integer tagId, Integer page, Integer rows);

    /**
     * 根据菜单Id获取所属菜单的文章
     * @param menuId
     * @param page
     * @param rows
     * @return
     */
    Page<Artical> getArticalListByMenuId(Integer menuId, Integer page, Integer rows);

    /**
     * 根据搜索关键词获取文章
     * @param keyword
     * @param page
     * @param rows
     * @return
     */
    Page<Artical> getArticalsBySearch(String keyword, Integer page, Integer rows);

    /**
     * 文章查看次数加一
     * @param id
     */
    void addArticalLookCount(Integer id);

    /**
     * 评论数加1
     * @param articalID
     */
    void addCommentCount(Integer articalID);

    /**
     * 获取所有的文章数目
     * @return
     */
    Integer getAriticalCount();

    /**
     * 获取评论总数
     * @return
     */
    Integer getCommentCount();

    /**
     * 获取浏览总数
     * @return
     */
    Integer getLookCount();

    /**
     * 添加文章
     * @param artical
     * @return
     */
    Integer addArtical(Artical artical);

    List<Artical> getArticals(Integer page, Integer size, Date start, Date end, String title);

    Integer getAriticalCountByCriteria(Date start, Date end, String title);

    Artical getArticalById(Integer parseInt);

    Integer editArtical(Artical artical);

    Integer delArticalById(Integer id);

    Integer editSwitch(Integer articalId, Boolean val, String name);
}
