package cn.xhanglog.dao;

import cn.xhanglog.entity.Member;
import cn.xhanglog.entity.SysUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface SysUserMapper {
    SysUser getUserByid(Integer sysUserId);

    List<SysUser> getUserByName(@Param("userName") String userName);

    Integer editSwitch(@Param("sysUserId") Integer sysUserId, @Param("val") Boolean val);

    List<Member> getSysUsers(@Param("startRow") Integer startRow, @Param("size") Integer size);

    Integer getSysUsersCount();

    Integer delSysUserById(Integer sysUserId);

    Integer addSysUser(SysUser user);
}
