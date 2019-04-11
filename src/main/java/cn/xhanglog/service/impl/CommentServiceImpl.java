package cn.xhanglog.service.impl;

import cn.xhanglog.dao.CommentMapper;
import cn.xhanglog.dao.MemberMapper;
import cn.xhanglog.entity.Comment;
import cn.xhanglog.entity.Member;
import cn.xhanglog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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

    @Override
    public List<Comment> getComments(Integer page, Integer size, Date start, Date end, String title) {
        Integer startRow = (page-1) * size;
        List<Comment> commentList = commentMapper.getComments(startRow,size,start,end,title);
        List<Member> members = memberMapper.getAllMembers();
        for (Comment comment : commentList){
            for (Member me : members){
                if(comment.getMemberId().equals(me.getMemberId())){
                    comment.setMemberName(me.getMemberNickname());
                }
            }
        }
        return commentList;
    }

    @Override
    public Integer getCommentCountByCriteria(Date start, Date end, String title) {
        return commentMapper.getCommentCountByCriteria(start,end,title);
    }

    @Override
    public Integer editSwitch(Integer commentId, Boolean val) {
        return commentMapper.editSwitch(commentId,val);
    }

    @Override
    public Integer delCommentById(Integer commentId) {
        return commentMapper.delCommentById(commentId);
    }
}
