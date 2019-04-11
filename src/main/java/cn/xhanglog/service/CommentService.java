package cn.xhanglog.service;

import cn.xhanglog.entity.Comment;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
public interface CommentService {
    List<Comment> getCommentsByArticalId(Integer id);

    void addComment(Comment comment);

    List<Comment> getComments(Integer page, Integer size, Date start, Date end, String title);

    Integer getCommentCountByCriteria(Date start, Date end, String title);

    Integer editSwitch(Integer commentId, Boolean val);

    Integer delCommentById(Integer commentId);
}
