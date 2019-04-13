package cn.xhanglog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: Xhang
 *
 * 控制界面跳转
 */
@Controller
public class PageController {

    /**
     * 关于我界面跳转
     * @return
     */
    @RequestMapping("/about.html")
    public String showAbout(){
        return "views/foreground/about";
    }

    /**
     * 后台登录界面跳转
     * @return
     */
    @RequestMapping("/login.html")
    public String showLogin(){
        return "views/background/index";
    }

    /**
     * 修改密码界面
     * @return
     */
    @RequestMapping("/admin/editPsd.html")
    public String editPsd(){
        return "views/background/member-password";
    }

    /**
     * 写文章界面
     * @return
     */
    @RequestMapping("/admin/writeBlog.html")
    public String writeBlog(){
        return "views/background/writeBlog";
    }

    /**
     * 文章列表展示
     * @return
     */
    @RequestMapping("/admin/articalList.html")
    public String articalList(){
        return "views/background/articalList";
    }

    /**
     * 会员列表展示
     * @return
     */
    @RequestMapping("/admin/memberList.html")
    public String memberList(){
        return "views/background/memberList";
    }

    /**
     * 管理员列表展示
     * @return
     */
    @RequestMapping("/admin/adminList.html")
    public String adminList(){
        return "views/background/adminList";
    }

    /**
     * 菜单列表展示
     * @return
     */
    @RequestMapping("/admin/menuList.html")
    public String menuList(){
        return "views/background/menuList";
    }

    /**
     * 标签列表
     * @return
     */
    @RequestMapping("/admin/tagList.html")
    public String tagList(){
        return "views/background/tagList";
    }

    /**
     * 友链列表
     * @return
     */
    @RequestMapping("/admin/linkList.html")
    public String linkList(){
        return "views/background/linkList";
    }

    /**
     * 评论列表
     * @return
     */
    @RequestMapping("/admin/commentList.html")
    public String commentList(){
        return "views/background/commentList";
    }

    /**
     * 添加管理员界面
     * @return
     */
    @RequestMapping("/admin/showAddAdmin.html")
    public String showAddAdmin(){
        return "views/background/admin_add";
    }

    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/admin/index.html")
    public String showIndex(){
        return "views/background/home";
    }

    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/admin/welcome.html")
    public String welcome(){
        return "views/background/welcome";
    }

    /**
     * 添加友链界面
     * @return
     */
    @RequestMapping("/admin/link_add_edit.html")
    public String link_add_edit(){
        return "views/background/link_add_edit";
    }

    /**
     * 添加友链界面
     * @return
     */
    @RequestMapping("/admin/menu_add_edit.html")
    public String menu_add_edit(){
        return "views/background/menu_add_edit";
    }

    /**
     * 添加友链界面
     * @return
     */
    @RequestMapping("/admin/tag_add_edit.html")
    public String tag_add_edit(){
        return "views/background/tag_add_edit";
    }
}
