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
public class LinkController {

    @Autowired
    private LinkService linkService;

    @RequestMapping("/link/getLinks")
    public String getPreLinks(Model model){
        List<Link> links = linkService.getPreLinks();
        model.addAttribute("links",links);
        return "views/foreground/link";
    }

    @RequestMapping("/admin/link/getLinks")
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

    @RequestMapping("/admin/link/editSwitch")
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

    @RequestMapping("/admin/link/getLinkInfo")
    public String getLinkInfo(Integer linkId, Model model){
        Link link = linkService.getLinkInfo(linkId);
        model.addAttribute("link",link);
        return "views/background/link_add_edit";
    }

    @RequestMapping("/admin/link/addOrEdit")
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

    @RequestMapping("/link/add")
    @ResponseBody
    public Map<String,Integer> add(HttpServletRequest request){
        Link link = new Link();
        Map<String,Integer> res = new HashMap<>();
        Integer result = 0;
        Date date = new Date();
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp dt = Timestamp.valueOf(nowTime);//把时间转换

        String linkName = request.getParameter("linkName");
        String linkUrl = request.getParameter("linkUrl");
        String linkOwnerNickname = request.getParameter("linkOwnerNickname");
        String linkOwnerContact = request.getParameter("linkOwnerContact");
        String linkDescription = request.getParameter("linkDescription");

        link.setLinkName(linkName);
        link.setLinkUrl(linkUrl);
        link.setLinkOwnerNickname(linkOwnerNickname);
        link.setLinkOwnerContact(linkOwnerContact);
        link.setLinkDescription(linkDescription);
        link.setLinkUpdateTime(dt);
        link.setLinkCreateTime(dt);
        link.setShowIndex(false);
        link.setLinkStatus(true);
        result = linkService.addLink(link);
        if(result == 1 ){
            res.put("code",202);
        } else{
            res.put("code",204);
        }
        return res;
    }

    @RequestMapping("/admin/link/delLinkById")
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
