package cn.xhanglog.service.impl;

import cn.xhanglog.dao.CommentMapper;
import cn.xhanglog.dao.MemberMapper;
import cn.xhanglog.entity.Artical;
import cn.xhanglog.entity.Comment;
import cn.xhanglog.entity.Member;
import cn.xhanglog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private MemberMapper memberMapper;
    @Override
    public List<Comment> getCommentsByArticalId(Integer id) {
        List<Comment> comments = commentMapper.getCommentsByArticalId(id);
        List<Member> members = memberMapper.getAllMembers();
        for (Comment com : comments){
            for (Member me : members){
                if(com.getMemberId().equals(me.getMemberId())){
                    com.setMemberName(me.getMemberNickname());
                    com.setMemberPic(me.getMemberImage());
                }
            }
        }
        return comments;
    }

    @Override
    public void addComment(Comment comment) {
        Integer zid = comment.getZid();
        commentMapper.addComment(comment);
        if (zid == null){
            commentMapper.updateComment(comment);
        }
    }
}
