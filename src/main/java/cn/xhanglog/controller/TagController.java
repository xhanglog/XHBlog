package cn.xhanglog.controller;

import cn.xhanglog.entity.Tag;
import cn.xhanglog.service.TagService;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/getTags")
    @ResponseBody
    public Page<Tag> getTags(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String dateTodate, String title){
        Page<Tag> rs = new Page<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String st = "";
        String en = "";
        Date start = null;
        Date end = null;
        if(!dateTodate.equals("")){
            String[] sourceStrArray = dateTodate.split("to");
            st =  sourceStrArray[0];
            en =  sourceStrArray[1];
        }
        try {
            if (!st.equals("") && !en.equals("")){
                start = sdf.parse(st);
                end = sdf.parse(en);
            }
            List<Tag> tags = tagService.getTags(page,size,start,end,title);
            Integer tagCount = tagService.getTagCountByCriteria(start,end,title);
            rs.setRows(tags);
            rs.setTotal(tagCount);
            rs.setCode(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    @RequestMapping("/tag/getTagInfo")
    public String getTagInfo(Integer tagId,Model model){
        Tag tag = tagService.getTagById(tagId);
        model.addAttribute("tag",tag);
        return "background/tag_add_edit";
    }

    @RequestMapping("/tag/delTagById")
    public Map<String,Integer> delTagById(Integer tagId){
        Map<String,Integer> res = new HashMap<>();
        Integer result = tagService.delTagById(tagId);
        if(result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/tag/addOrEdittag")
    @ResponseBody
    public Map<String,Integer> addOrEdittag(@RequestBody Tag tag){
        Map<String,Integer> res = new HashMap<>();
        Date date = new Date();
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp dt = Timestamp.valueOf(nowTime);//把时间转换
        tag.setTagUpdateTime(dt);
        Integer result = 0;
        if(tag.getTagId() != null){
            try {
                String creTime = tag.getCondition();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date parse = sdf.parse(creTime);
                tag.setTagCreateTime(parse);
                result = tagService.editTagById(tag);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else {
            tag.setTagCreateTime(dt);
            result = tagService.addTag(tag);
        }
        if(result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }
}
