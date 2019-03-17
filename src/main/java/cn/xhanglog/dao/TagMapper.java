package cn.xhanglog.dao;

import cn.xhanglog.entity.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface TagMapper {
    List<Tag> getTagList();

    Tag getTagByName(String tagName);
}
