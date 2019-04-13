package cn.xhanglog.controller;

import cn.xhanglog.entity.Member;
import cn.xhanglog.entity.SysUser;
import cn.xhanglog.service.UserService;
import cn.xhanglog.util.MD5Util;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;
import java.util.List;

/**
 * @Author: Xhang
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/user/login")
    @ResponseBody
    public Map<String,Object> login(@RequestBody SysUser user, HttpServletRequest request){
        Map<String, Object> res = new HashMap<>();
        String validcode = request.getSession().getAttribute("validcode").toString();	//放在session中生成的验证码
        if(user.getCode().equals(validcode)){
            res = userService.getUserByName(user,request);
        }else {
            res.put("code",1);
            res.put("msg","验证码输入错误!");
        }
        return res;
    }

    @RequestMapping("/admin/user/editSwitch")
    @ResponseBody
    public Map<String,Integer> editSwitch(Integer sysUserId,Boolean val){
        Map<String,Integer> res = new HashMap<>();
        Integer result = userService.editSwitch(sysUserId,val);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/admin/user/getSysUsers")
    @ResponseBody
    public Page<Member> getSysUsers(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size){
        Page<Member> rs = new Page<>();
        List<Member> members = userService.getSysUsers(page,size);
        Integer memberCount = userService.getSysUsersCount();
        rs.setRows(members);
        rs.setTotal(memberCount);
        rs.setCode(0);
        return rs;
    }

    @RequestMapping("/admin/user/delSysUserById")
    @ResponseBody
    public Map<String,Integer> delSysUserById(Integer sysUserId){
        Map<String,Integer> res = new HashMap<>();
        Integer result = userService.delSysUserById(sysUserId);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/admin/user/addSysUser")
    @ResponseBody
    public Map<String,Integer> addSysUser(@RequestBody SysUser user){
        Map<String,Integer> res = new HashMap<>();
        user.setStatus(true);
        //使用姓名+密码作为盐值
        String s = MD5Util.md5(user.getSysUserPassword(), user.getSysUserName() + user.getSysUserPassword());
        user.setSysUserPassword(s);
        Integer result = userService.addSysUser(user);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/validcode")
    public void validcode(HttpServletRequest request, HttpServletResponse response){
        //创建一张图片
        //单位:像素
        BufferedImage image =  new BufferedImage(200, 100, BufferedImage.TYPE_INT_RGB);

        //透明的玻璃
        //向画板上画内容之前必须先设置画笔.
        Graphics2D gra = image.createGraphics();
        gra.setColor(Color.WHITE);

        //从哪个坐标开始填充, 后两个参数,矩形区域
        gra.fillRect(0, 0, 200, 100);

        List<Integer> randList = new ArrayList<Integer>();
        Random random =new Random();
        for (int i = 0 ;i<4;i++) {
            randList.add(random.nextInt(10));
        }

        //设置字体
        gra.setFont(new Font("宋体",Font.ITALIC|Font.BOLD,40));
        Color[] colors = new Color[]{Color.RED,Color.BLACK,Color.BLUE,Color.GREEN,Color.ORANGE,Color.GRAY};
        for (int i = 0; i < randList.size(); i++) {
            gra.setColor(colors[random.nextInt(colors.length)]);
            gra.drawString(randList.get(i)+"", i*40, 70+(random.nextInt(21)-10));
        }

        for (int i = 0; i < 2; i++) {
            gra.setColor(colors[random.nextInt(colors.length)]);
            //画横线
            gra.drawLine(0, random.nextInt(101), 200, random.nextInt(101));
        }

        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            ImageIO.write(image, "jpg", outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //工具类
        //把验证码放入到session中
        HttpSession session = request.getSession();
        session.setAttribute("validcode", ""+randList.get(0)+randList.get(1)+randList.get(2)+randList.get(3));
    }

    @RequestMapping("/admin/user/editPsd")
    @ResponseBody
    public Map<String,Integer> editPsd(@RequestBody SysUser user,HttpServletRequest request){
        Map<String,Integer> res = new HashMap<>();
        String s = MD5Util.md5(user.getSysUserPassword(), user.getSysUserName() + user.getSysUserPassword());
        user.setSysUserPassword(s);
        Integer result = userService.editPsd(user);
        if (result == 1){
            SysUser user1 = (SysUser)request.getSession().getAttribute("user");
            user1.setSysUserPassword(user.getSysUserPassword());
            request.getSession().setAttribute("user",user1);
            request.getSession().setAttribute("pass",user.getSysUserPassword());
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }

    @RequestMapping("/admin/user/loginOut")
    public String loginOut(HttpServletRequest request){
        //清除session中的user信息
        request.getSession().invalidate();
        return "redirect:http://www.xhanglog.cn/login.html";
    }
}