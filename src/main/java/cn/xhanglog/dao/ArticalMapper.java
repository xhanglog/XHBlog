package cn.xhanglog.dao;

import cn.xhanglog.entity.Artical;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
}
