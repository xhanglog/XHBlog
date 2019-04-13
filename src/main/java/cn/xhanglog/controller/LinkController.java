package cn.xhanglog.controller;

import cn.xhanglog.entity.Link;
import cn.xhanglog.service.LinkService;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
@RequestMapping("/admin/link")
public class LinkController {

    @Autowired
    private LinkService linkService;

    @RequestMapping("/getLinks")
    @ResponseBody
    public Page<Link> getLinks(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String title){
        Page<Link> rs = new Page<>();
        List<Link> links = linkService.getLinks(page,size,title);
        Integer linkCount = linkService.getLinkCountByCriteria(title);
        rs.setRows(links);
        rs.setTotal(linkCount);
        rs.setCode(0);
        return rs;
    }

    @RequestMapping("/editSwitch")
    @ResponseBody
    public Map<String,Integer> editSwitch(Integer linkId, Boolean val, String name){
        Map<String,Integer> res = new HashMap<>();
        if(name.equals("linkStatus")){
            name = "link_status";
        }
        Integer result = linkService.editSwitch(linkId,val,name);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/getLinkInfo")
    public String getLinkInfo(Integer linkId, Model model){
        Link link = linkService.getLinkInfo(linkId);
        model.addAttribute("link",link);
        return "views/background/link_add_edit";
    }

    @RequestMapping("/addOrEdit")
    @ResponseBody
    public Map<String,Object> addOrEdit(@RequestBody Link link, HttpServletRequest request){
        Map<String,Object> res = new HashMap<>();
        Integer status = 0;
        Date date = new Date();
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp dt = Timestamp.valueOf(nowTime);//把时间转换
        link.setLinkUpdateTime(dt);
        if(link.getId() == null){
            link.setLinkCreateTime(dt);
            status = linkService.addLink(link);
        }else {
            status = linkService.editLink(link);
            if(status == 1){
                status = 2;
            }
        }
        if(status == 1 ){
            res.put("msg","添加友链成功!");
            res.put("code",0);
        }else if(status == 2){
            res.put("msg","修改友链成功!");
            res.put("code",0);
        } else{
            res.put("msg","添加友链失败!");
            res.put("code",1);
        }
        return res;
    }

    @RequestMapping("/delLinkById")
    @ResponseBody
    public Map<String,Integer> delLinkById(Integer linkId){
        Map<String,Integer> res = new HashMap<>();
        Integer result =  linkService.delLinkById(linkId);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }
}
