package cn.xhanglog.controller;

import cn.xhanglog.entity.Artical;
import cn.xhanglog.service.ArticalService;
import cn.xhanglog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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

    @RequestMapping(value = {"/","/index.html"})
    public String showIndex(Model model){
        List<Artical>  articalList= articalService.getShowIndexArtical();
        model.addAttribute("articalList",articalList);
        return "foreground/index";
    }

    @RequestMapping("/about.html")
    public String showAbout(){
        return "foreground/about";
    }
}
