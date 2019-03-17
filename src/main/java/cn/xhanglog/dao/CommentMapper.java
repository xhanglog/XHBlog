package cn.xhanglog.dao;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface CommentMapper {
    List<Comment> getCommentsByArticalId(Integer id);

    void addComment(Comment comment);

    void updateComment(Comment comment);
}
