package cn.xhanglog.controller;

import cn.xhanglog.entity.Tag;
import cn.xhanglog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author: Xhang
 */
@Controller
public class TagController {
    @Autowired
    private TagService tagService;

    @RequestMapping("/getAlltag")
    public String getAllTag(Model model){
        List<Tag> tagList = tagService.getTagList();
        model.addAttribute("tags",tagList);
        return "background/tags";
    }
}
