package cn.xhanglog.controller;

import cn.xhanglog.entity.Menu;
import cn.xhanglog.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Integer st = 0;//用于判断是否查询所有的菜单
        return menuService.getAllMenu(st);
    }

    @RequestMapping("getMenus")
    @ResponseBody
    public Map<String,Object> getMenus(){
        Map<String,Object> res = new HashMap<>();
        Integer st = 1;
        List<Menu> data = menuService.getAllMenu(st);
        Integer count = menuService.getMenuCount();
        res.put("code",0);
        res.put("data",data);
        res.put("count",count);
        return res;
    }

    @RequestMapping("editSwitch")
    @ResponseBody
    public Map<String,Integer> editSwitch(Integer menuId, Boolean val){
        Map<String,Integer> res = new HashMap<>();
        Integer result = menuService.editSwitch(menuId,val);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("delMenuById")
    @ResponseBody
    public Map<String,Integer> delMenuById(Integer menuId){
        Map<String,Integer> res = new HashMap<>();
        Integer result =  menuService.delMenuById(menuId);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("getMenuInfo")
    public String getLinkInfo(Integer menuId, Model model){
        Menu menu = menuService.getMenuInfo(menuId);
        model.addAttribute("menu",menu);
        return "background/menu_add_edit";
    }

    @RequestMapping("/addOrEdit")
    @ResponseBody
    public Map<String,Object> addOrEdit(@RequestBody Menu menu, HttpServletRequest request){
        Map<String,Object> res = new HashMap<>();
        Integer result = 0;
        Date date = new Date();
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp dt = Timestamp.valueOf(nowTime);//把时间转换
        menu.setMenuUpdateTime(dt);
        if(menu.getMenuId() == null){
            menu.setMenuCreateTime(dt);
            result = menuService.addMenu(menu);
        }else {
            result = menuService.editMenu(menu);
            if(result == 1){
                result = 2;
            }
        }
        if(result == 1 ){
            res.put("msg","添加分类成功!");
            res.put("code",0);
        }else if(result == 2){
            res.put("msg","修改分类成功!");
            res.put("code",0);
        } else{
            res.put("msg","操作失败!");
            res.put("code",1);
        }
        return res;
    }
}
