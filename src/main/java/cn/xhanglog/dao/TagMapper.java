package cn.xhanglog.dao;

import cn.xhanglog.entity.Tag;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface TagMapper {
    List<Tag> getTagList();

    Tag getTagByName(String tagName);

    Integer getTagCount();

    List<Tag> getTags(@Param("startRow")Integer startRow, @Param("size")Integer size, @Param("start")Date start,
                      @Param("end") Date end, @Param("tagName") String tagName);

    Integer getTagCountByCriteria(@Param("start")Date start, @Param("end")Date end, @Param("tagName")String tagName);

    Tag getTagById(Integer tagId);

    Integer delTagById(Integer tagId);

    Integer editTagById(Tag tag);

    Integer addTag(Tag tag);

    void addTagList(@Param("list") List<Tag> list);
}
