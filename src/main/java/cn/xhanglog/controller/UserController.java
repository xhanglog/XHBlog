package cn.xhanglog.controller;

import cn.xhanglog.entity.Member;
import cn.xhanglog.entity.SysUser;
import cn.xhanglog.service.UserService;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Xhang
 */
@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(@RequestBody SysUser user, HttpServletRequest request){
        Map<String, Object> res = userService.getUserByName(user,request);
        return res;
    }

    @RequestMapping("editSwitch")
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

    @RequestMapping("getSysUsers")
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

    @RequestMapping("delSysUserById")
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

    @RequestMapping("addSysUser")
    @ResponseBody
    public Map<String,Integer> addSysUser(@RequestBody SysUser user){
        Map<String,Integer> res = new HashMap<>();
        user.setStatus(true);
        Integer result = userService.addSysUser(user);
        if (result == 1){
            res.put("code",200);
        }else {
            res.put("code",202);
        }
        return res;
    }
}