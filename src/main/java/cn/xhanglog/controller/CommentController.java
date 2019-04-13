package cn.xhanglog.controller;

import cn.xhanglog.entity.Comment;
import cn.xhanglog.service.ArticalService;
import cn.xhanglog.service.CommentService;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        comment.setCommentStatus(true);

        articalService.addCommentCount(id);
        commentService.addComment(comment);
    }

    @RequestMapping("/admin/comment/getComments")
    @ResponseBody
    public Page<Comment> getComments(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String dateTodate, String title){
        Page<Comment> rs = new Page<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String st = "";
        String en = "";
        Date start = null;
        Date end = null;
        if(!dateTodate.equals("")){
            String[] sourceStrArray = dateTodate.split("to");
            st =  sourceStrArray[0];
            en =  sourceStrArray[1];
        }
        try {
            if (!st.equals("") && !en.equals("")){
                start = sdf.parse(st);
                end = sdf.parse(en);
            }
            List<Comment> comments = commentService.getComments(page,size,start,end,title);
            Integer commentCount = commentService.getCommentCountByCriteria(start,end,title);
            rs.setRows(comments);
            rs.setTotal(commentCount);
            rs.setCode(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    @RequestMapping("/admin/comment/editSwitch")
    @ResponseBody
    public Map<String,Integer> editSwitch(Integer commentId, Boolean val){
        Map<String,Integer> res = new HashMap<>();
        Integer result = commentService.editSwitch(commentId,val);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/admin/comment/delCommentById")
    @ResponseBody
    public Map<String,Integer> delCommentById(Integer commentId){
        Map<String,Integer> res = new HashMap<>();
        Integer result =  commentService.delCommentById(commentId);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }
}
