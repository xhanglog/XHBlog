package cn.xhanglog.controller;

import cn.xhanglog.entity.Comment;
import cn.xhanglog.service.ArticalService;
import cn.xhanglog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @Author: Xhang
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private ArticalService articalService;

    @RequestMapping("/comment/add")
    public void addCooment(HttpServletRequest request){
        Comment comment = new Comment();
        String content = request.getParameter("content");
        String articalID = request.getParameter("articalId");
        String openID = request.getParameter("openID");
        String zid = request.getParameter("zid");
        String commentPid = request.getParameter("commentPid");
        String commentPname = request.getParameter("commentPname");

        Integer id = Integer.parseInt(articalID);
        comment.setArticleId(id);
        comment.setMemberId(openID);

        if ("".equals(zid)){
            comment.setZid(null);
        }else {
            comment.setZid(Integer.parseInt(zid));
        }
        if ("".equals(commentPid)){
            comment.setCommentPid(0);
        }else {
            comment.setCommentPid(Integer.parseInt(commentPid));
        }

        comment.setCommentContent(content);
        comment.setCommentCreateTime(new Date());
        comment.setCommentPname(commentPname);
        comment.setCommentStatus(1);

        articalService.addCommentCount(id);
        commentService.addComment(comment);
    }
}
