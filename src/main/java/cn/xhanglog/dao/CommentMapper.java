package cn.xhanglog.dao;

import cn.xhanglog.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface CommentMapper {
    List<Comment> getCommentsByArticalId(Integer id);

    void addComment(Comment comment);

    void updateComment(Comment comment);

    List<Comment> getComments(@Param("startRow")Integer startRow, @Param("size")Integer size, @Param("start")Date start,
                              @Param("end") Date end, @Param("title") String title);

    Integer getCommentCountByCriteria(@Param("start")Date start, @Param("end")Date end, @Param("title")String title);

    Integer editSwitch(@Param("commentId") Integer commentId, @Param("val") Boolean val);

    Integer delCommentById(Integer commentId);
}
