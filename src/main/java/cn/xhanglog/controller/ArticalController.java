package cn.xhanglog.controller;

import cn.xhanglog.entity.*;
import cn.xhanglog.service.*;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 文章Controller层
 * @Author: Xhang
 */
@Controller
@RequestMapping("/artical")
public class ArticalController {

    @Autowired
    private ArticalService articalService;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private TagService tagService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private CommentService commentService;

    /**
     * 根据文章Id获取文章详情及评论详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/info/{id}")
    public String getArticalInfoById(@PathVariable("id") Integer id, Model model) {
        Artical artical = articalService.getArticalInfoById(id);
        SysUser user = sysUserService.getUserByid(artical.getUser().getSysUserId());
        artical.setUser(user);
        Artical preArtical = articalService.getPreArtical(id);
        Artical afterArtical = articalService.getAfterArtical(id);
        List<Comment> commentList = commentService.getCommentsByArticalId(id);
        articalService.addArticalLookCount(id);

        model.addAttribute("commentList", commentList);
        model.addAttribute("preArtical", preArtical);
        model.addAttribute("afterArtical", afterArtical);
        model.addAttribute("artical", artical);
        return "foreground/info";
    }

    /**
     * 根据标签名称获取对应的文章
     *
     * @param tagName
     * @param model
     * @return
     */
    @RequestMapping("/tag/{tagName}")
    public String getArticalListByTagName(@PathVariable("tagName") String tagName, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer rows, Model model) {
        Tag tag = tagService.getTagByName(tagName);
        Page<Artical> articalList = articalService.getArticalListByTagId(tag.getTagId(), page, rows);
        model.addAttribute("navState", 1);
        model.addAttribute("tag", tag);
        model.addAttribute("page", articalList);
        return "foreground/list";
    }

    @RequestMapping("/menu/{menuName}")
    public String getArticalListByMenuId(@PathVariable("menuName") String menuName, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer rows, Model model) {
        Menu menu = menuService.getMenuByName(menuName);
        Page<Artical> articalList = articalService.getArticalListByMenuId(menu.getMenuId(), page, rows);
        model.addAttribute("navState", 2);
        model.addAttribute("page", articalList);
        model.addAttribute("menu", menu);
        if (menu.getLookView() == 1) {
            return "foreground/list";
        } else {
            return "foreground/share";
        }
    }

    @RequestMapping(value = "/search")
    public String getArticalsBySearch(String keyword, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer rows, Model model) {
        Page<Artical> articalList = articalService.getArticalsBySearch(keyword, page, rows);
        model.addAttribute("keyword", keyword);
        model.addAttribute("navState", 3);
        model.addAttribute("page", articalList);
        return "foreground/list";
    }

}
