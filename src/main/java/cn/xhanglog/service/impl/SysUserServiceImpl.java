package cn.xhanglog.service.impl;

import cn.xhanglog.dao.SysUserMapper;
import cn.xhanglog.entity.SysUser;
import cn.xhanglog.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;
    @Override
    public SysUser getUserByid(Integer sysUserId) {
        return sysUserMapper.getUserByid(sysUserId);
    }
}
