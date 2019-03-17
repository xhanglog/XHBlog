package cn.xhanglog.dao;

import cn.xhanglog.entity.SysUser;
import org.springframework.stereotype.Repository;

/**
 * @Author: Xhang
 */
@Repository
public interface SysUserMapper {
    SysUser getUserByid(Integer sysUserId);
}
