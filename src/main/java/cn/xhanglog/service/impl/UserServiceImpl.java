package cn.xhanglog.service.impl;

import cn.xhanglog.dao.SysUserMapper;
import cn.xhanglog.entity.Member;
import cn.xhanglog.entity.SysUser;
import cn.xhanglog.service.UserService;
import cn.xhanglog.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private SysUserMapper sysUserMapper;
    @Override
    public Map<String,Object> getUserByName(SysUser user, HttpServletRequest request) {
        Map<String,Object> res = new HashMap<>();
        List<SysUser> sysUsers = sysUserMapper.getUserByName(user.getSysUserName());
        if(sysUsers.size() != 0){
            for (SysUser sysUser : sysUsers){
                String s = MD5Util.md5(user.getSysUserPassword(), user.getSysUserName() + user.getSysUserPassword());
                if(sysUser.getSysUserPassword().equals(s)){
                    /*将用户放入session域中*/
                    request.getSession().setAttribute("pass",user.getSysUserPassword());
                    request.getSession().setAttribute("user",sysUser);
                    res.put("code",0);
                }else{
                    res.put("code",1);
                    res.put("msg","密码输入错误!");
                }
            }
        }else {
            res.put("code",1);
            res.put("msg","用户不存在!");
        }
        return res;
    }

    @Override
    public Integer editSwitch(Integer sysUserId, Boolean val) {
        return sysUserMapper.editSwitch(sysUserId,val);
    }

    @Override
    public List<Member> getSysUsers(Integer page, Integer size) {
        Integer startRow = (page-1) * size;
        return sysUserMapper.getSysUsers(startRow,size);
    }

    @Override
    public Integer getSysUsersCount() {
        return sysUserMapper.getSysUsersCount();
    }

    @Override
    public Integer delSysUserById(Integer sysUserId) {
        return sysUserMapper.delSysUserById(sysUserId);
    }

    @Override
    public Integer addSysUser(SysUser user) {
        return sysUserMapper.addSysUser(user);
    }

    @Override
    public Integer editPsd(SysUser user) {
        return sysUserMapper.editPsd(user);
    }
}
