package cn.xhanglog.dao;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.entity.Tag;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface ArticalMapper {

    List<Artical> getRecommendedArtical();

    List<Artical> getClickMostArtical();

    List<Artical> getCommentMost();

    List<Artical> getShowIndexArtical();

    Artical getArticalInfoById(Integer id);

    List<Artical> getArticalListByTagId(@Param("tagId") Integer tagId, @Param("startRow") Integer startRow, @Param("rows") Integer rows);

    Integer getArticalCountByTagId(Integer tagId);

    List<Artical> getArticalListByMenuId(@Param("menuId") Integer menuId, @Param("startRow") Integer startRow, @Param("rows") Integer rows);

    Integer getArticalCountByMenuId(Integer menuId);

    Artical getPreArtical(Integer id);

    Artical getAfterArtical(Integer id);

    List<Artical> getArticalsBySearch(@Param("keyword") String keyword, @Param("startRow") Integer startRow, @Param("rows") Integer rows);

    Integer getArticalCountBySearch(@Param("keyword") String keyword);

    void addArticalLookCount(Integer id);

    void addCommentCount(Integer articalID);

    Integer getAriticalCount();

    Integer getCommentCount();

    Integer getLookCount();

    Integer addArtical(Artical artical);

    List<Artical> getArticals(@Param("startRow")Integer startRow, @Param("size")Integer size, @Param("start")Date start,
                              @Param("end") Date end, @Param("title") String title);

    Integer getAriticalCountByCriteria(@Param("start")Date start, @Param("end")Date end, @Param("title")String title);

    Artical getArticalById(Integer id);

    Integer editArtical(Artical artical);

    Integer delArticalById(Integer id);

    Integer editSwitch(@Param("articalId") Integer articalId, @Param("val") Boolean val, @Param("name") String name);

    void addTagArtical(@Param("articalId")Integer articalId, @Param("tags")List<Tag> tags);
}
