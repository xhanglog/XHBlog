package cn.xhanglog.controller;

import cn.xhanglog.entity.Menu;
import cn.xhanglog.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: Xhang
 */
@Controller
@RequestMapping("/menu/")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @RequestMapping("getAllMenu")
    @ResponseBody
    public List<Menu> getAllMenu(){
        return menuService.getAllMenu();
    }

}
