package cn.xhanglog.dao;

import cn.xhanglog.entity.Link;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface LinkMapper {
    List<Link> getShowIndexLinkList();

    Integer getLinkCount();

    List<Link> getLinks(@Param("startRow") Integer startRow, @Param("size") Integer size, @Param("linkName") String linkName);

    Integer getLinkCountByCriteria(@Param("linkName") String linkName);

    Integer editSwitch(@Param("linkId") Integer linkId,@Param("val") Boolean val,@Param("name") String name);

    Link getLinkInfo(Integer linkId);

    Integer addLink(Link link);

    Integer editLink(Link link);

    Integer delLinkById(Integer linkId);
}
