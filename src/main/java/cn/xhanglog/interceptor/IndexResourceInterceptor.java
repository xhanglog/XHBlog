package cn.xhanglog.interceptor;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.entity.Link;
import cn.xhanglog.entity.Menu;
import cn.xhanglog.entity.Tag;
import cn.xhanglog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.context.request.WebRequestInterceptor;

import java.util.List;

/**
 * 菜单栏和侧边栏项目的准备
 *
 * @Author: Xhang
 */
public class IndexResourceInterceptor implements WebRequestInterceptor {

    @Autowired
    private MenuService menuService;
    @Autowired
    private TagService tagService;
    @Autowired
    private LinkService linkService;
    @Autowired
    private ArticalService articalService;
    @Autowired
    private CommentService commentService;

    @Override
    public void preHandle(WebRequest request) throws Exception {

        /*获取菜单列表*/
        List<Menu> menuList = menuService.getAllMenu();
        for (Menu menu : menuList) {
            menu.setMenuLeaval(0);
            for (Menu Submenu : menuList) {
                if (menu.getMenuId() == Submenu.getPid()) {
                    menu.setMenuLeaval(1);
                    break;
                }
            }
        }
        /*获取标签云*/
        List<Tag> tagList = tagService.getTagList();
        /*获取友情链接*/
        List<Link> linkList = linkService.getShowIndexLinkList();
        /*获取推荐*/
        List<Artical> recommendedArtical = articalService.getRecommendedArtical();
        List<Artical> clickMost = articalService.getClickMostArtical();
        List<Artical> commentMost = articalService.getCommentMost();

        request.setAttribute("menuList", menuList, WebRequest.SCOPE_REQUEST);
        request.setAttribute("tagList", tagList, WebRequest.SCOPE_REQUEST);
        request.setAttribute("linkList", linkList, WebRequest.SCOPE_REQUEST);
        request.setAttribute("recommendedArtical", recommendedArtical, WebRequest.SCOPE_REQUEST);
        request.setAttribute("clickMost", clickMost, WebRequest.SCOPE_REQUEST);
        request.setAttribute("commentMost", commentMost, WebRequest.SCOPE_REQUEST);

    }

    @Override
    public void postHandle(WebRequest request, ModelMap model) throws Exception {

    }

    @Override
    public void afterCompletion(WebRequest request, Exception ex) throws Exception {

    }
}
