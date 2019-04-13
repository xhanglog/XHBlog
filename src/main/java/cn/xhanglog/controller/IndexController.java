package cn.xhanglog.controller;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页Controller层
 * @Author: Xhang
 */
@Controller
public class IndexController {

    @Autowired
    private ArticalService articalService;
    @Autowired
    private LinkService linkService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private TagService tagService;

    @RequestMapping(value = {"/","","/index.html"})
    public String showIndex(Model model){
        List<Artical>  articalList= articalService.getShowIndexArtical();
        model.addAttribute("articalList",articalList);
        return "views/foreground/index";
    }


    /**
     * 后台首页初始化数据
     * @return
     */
    @RequestMapping("/admin/initHome")
    @ResponseBody
    public List<Map<String,Object>> initAdminHome(){
        List<Map<String,Object>> list = new ArrayList<>();
        Map<String,Object> info1 = new HashMap<>();
        Map<String,Object> info2 = new HashMap<>();
        Map<String,Object> info3 = new HashMap<>();
        Map<String,Object> info4 = new HashMap<>();
        Map<String,Object> info5 = new HashMap<>();
        Map<String,Object> info6 = new HashMap<>();
        Integer articalCount = articalService.getAriticalCount();
        Integer commentCount = articalService.getCommentCount();
        Integer lookCount = articalService.getLookCount();
        Integer linkCount = linkService.getLinkCount();
        Integer memberCount = memberService.getMemberCount();
        Integer tagCount = tagService.getTagCount();

        info1.put("name","文章数");
        info1.put("count",articalCount);
        info2.put("name","会员数");
        info2.put("count",memberCount);
        info3.put("name","评论数");
        info3.put("count",commentCount);
        info4.put("name","访问数");
        info4.put("count",lookCount);
        info5.put("name","友链数");
        info5.put("count",linkCount);
        info6.put("name","标签数");
        info6.put("count",tagCount);

        list.add(info1);
        list.add(info2);
        list.add(info3);
        list.add(info4);
        list.add(info5);
        list.add(info6);
        return list;
    }
}
