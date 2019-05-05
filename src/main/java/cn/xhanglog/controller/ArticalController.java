package cn.xhanglog.controller;

import cn.xhanglog.entity.*;
import cn.xhanglog.service.*;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 文章Controller层
 * @Author: Xhang
 */
@Controller
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
    @RequestMapping("/artical/info/{id}")
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
        return "views/foreground/info";
    }

    /**
     * 根据标签名称获取对应的文章
     *
     * @param tagName
     * @param model
     * @return
     */
    @RequestMapping("/artical/tag/{tagName}")
    public String getArticalListByTagName(@PathVariable("tagName") String tagName, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer rows, Model model) {
        Tag tag = tagService.getTagByName(tagName);
        Page<Artical> articalList = articalService.getArticalListByTagId(tag.getTagId(), page, rows);
        model.addAttribute("navState", 1);
        model.addAttribute("tag", tag);
        model.addAttribute("page", articalList);
        return "views/foreground/list";
    }

    /**
     * 根据选择的菜单获取文章列表
     * @param menuName
     * @param page
     * @param rows
     * @param model
     * @return
     */
    @RequestMapping("/artical/menu/{menuName}")
    public String getArticalListByMenuId(@PathVariable("menuName") String menuName, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer rows, Model model) {
        Menu menu = menuService.getMenuByName(menuName);
        Page<Artical> articalList = articalService.getArticalListByMenuId(menu.getMenuId(), page, rows);
        model.addAttribute("navState", 2);
        model.addAttribute("page", articalList);
        model.addAttribute("menu", menu);
        if (menu.getLookView() == 1) {
            return "views/foreground/list";
        } else {
            return "views/foreground/share";
        }
    }

    /**
     * 根据关键词获取文章
     * @param keyword
     * @param page
     * @param rows
     * @param model
     * @return
     */
    @RequestMapping(value = "/artical/search")
    public String getArticalsBySearch(String keyword, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer rows, Model model) {
        Page<Artical> articalList = articalService.getArticalsBySearch(keyword, page, rows);
        model.addAttribute("keyword", keyword);
        model.addAttribute("navState", 3);
        model.addAttribute("page", articalList);
        return "views/foreground/list";
    }

    /**
     * 添加文章
     * @param artical
     * @param request
     * @return
     */
    @RequestMapping("/admin/artical/add")
    @ResponseBody
    public Map<String,Object> addArtical(@RequestBody Artical artical, HttpServletRequest request){
        Map<String,Object> res = new HashMap<>();
        SysUser user = (SysUser) request.getSession().getAttribute("user");
        Integer status = 0;//添加文章的状态
        if(user != null){
            artical.setUser(user);
            Date date = new Date();
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            Timestamp dt = Timestamp.valueOf(nowTime);//把时间转换
            artical.setUpdateTime(dt);
            //当没有封面图片时，默认为null
            if(artical.getCoverImage().equals("")){
                artical.setCoverImage(null);
            }

            List<Tag> tagList = tagService.getTagList();
            String keywords = artical.getKeywords();
            String[] tags = keywords.split(",");
            List<Tag> addTag = new ArrayList<>();

            //获取到关键字，将数据库没有的关键字存到数据库中
            for(String tagName : tags){
                Integer state = 0;
                for (Tag tag : tagList ){
                    if (tag.getTagName().equals(tagName)){
                        state = 1;
                        break;
                    }
                }
                if (state == 0) {
                    Tag ta = new Tag();
                    ta.setTagCreateTime(dt);
                    ta.setTagUpdateTime(dt);
                    ta.setTagName(tagName);
                    //没有的放入集合
                    addTag.add(ta);
                }
            }
            //批量添加
            if(addTag.size() !=0){
                tagService.addTagList(addTag);
            }

            //添加文章标签对应信息
            List<Tag> tags1 = new ArrayList<>();
            for(String tagName : tags){
                Tag tag = tagService.getTagByName(tagName);
                tags1.add(tag);
            }

            //文章id不等于NULL表示是修改文章
            if(artical.getArticalId() == null){
                artical.setCreateTime(dt);
                artical.setUpdateTime(dt);
                artical.setLookCount(0);
                artical.setCommentCount(0);
                status = articalService.addArtical(artical,tags1);
            }else {
                try {
                    String creTime = artical.getCondition();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date parse = sdf.parse(creTime);
                    artical.setCreateTime(parse);
                    status = articalService.editArtical(artical);
                    if(status == 1){
                        status = 2;
                    }
                } catch (ParseException e) {
                    res.put("msg","修改文章失败!");
                    res.put("code",1);
                    e.printStackTrace();
                }
            }

            if(status == 1 ){
                res.put("msg","添加文章成功!");
                res.put("code",0);
            }else if(status == 2){
                res.put("msg","修改文章成功!");
                res.put("code",0);
            } else{
                res.put("msg","添加文章失败!");
                res.put("code",1);
            }
        }else{
            res.put("msg","未登录，不能添加文章!");
            res.put("code",1);
        }
        return res;
    }

    @RequestMapping("/admin/artical/getArticals")
    @ResponseBody
    public Page<Artical> getArticals(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer size,String dateTodate, String title){
        Page<Artical> rs = new Page<>();
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
            List<Artical> articals = articalService.getArticals(page,size,start,end,title);
            Integer ariticalCount = articalService.getAriticalCountByCriteria(start,end,title);
            rs.setRows(articals);
            rs.setTotal(ariticalCount);
            rs.setCode(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    @RequestMapping("/admin/artical/getArticalInfo")
    public String getArticalInfo(Model model,HttpServletRequest request){
        String id = request.getParameter("id");
        Artical artical = articalService.getArticalById(Integer.parseInt(id));
        String info = artical.getEditorValue();
        String s = info.replaceAll("\r|\n", "");
        artical.setEditorValue(s);
        model.addAttribute("artical",artical);
        return "views/background/writeBlog";
    }

    @RequestMapping("/admin/artical/delArticalById")
    @ResponseBody
    public Map<String,Integer> delArticalById(Integer articalId){
        Map<String,Integer> res = new HashMap<>();
        Integer result = articalService.delArticalById(articalId);
        if (result == 1){
            res.put("code",1);
        }else {
            res.put("code",0);
        }
        return res;
    }

    @RequestMapping("/admin/artical/editSwitch")
    @ResponseBody
    public Map<String,Integer> editSwitch(Integer articalId,Boolean val,String name){
        Map<String,Integer> res = new HashMap<>();
        if(name.equals("comment")){
            name = "is_comment";
        }
        Integer result = articalService.editSwitch(articalId,val,name);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }
}