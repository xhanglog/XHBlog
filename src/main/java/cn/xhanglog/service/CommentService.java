package cn.xhanglog.service;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.entity.Comment;

import java.util.List;

/**
 * @Author: Xhang
 */
public interface CommentService {
    List<Comment> getCommentsByArticalId(Integer id);

    void addComment(Comment comment);
}
