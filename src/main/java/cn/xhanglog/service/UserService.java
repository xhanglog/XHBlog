package cn.xhanglog.service;

import cn.xhanglog.entity.Member;
import cn.xhanglog.entity.SysUser;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @Author: Xhang
 */
public interface UserService {
    Map<String,Object> getUserByName(SysUser user, HttpServletRequest request);

    Integer editSwitch(Integer sysUserId, Boolean val);

    List<Member> getSysUsers(Integer page, Integer size);

    Integer getSysUsersCount();

    Integer delSysUserById(Integer sysUserId);

    Integer addSysUser(SysUser user);

    Integer editPsd(SysUser user);
}
