package cn.xhanglog.dao;

import cn.xhanglog.entity.Link;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface LinkMapper {
    List<Link> getShowIndexLinkList();

    Integer getLinkCount();
}
