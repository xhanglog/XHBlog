package cn.xhanglog.entity;

import java.io.Serializable;

/**
 * 管理员实体
 * @Author: Xhang
 */
public class SysUser implements Serializable {
    private Integer sysUserId;
    private String sysUserName;
    private String sysUserPassword;
    private String sysUserQq;
    private String sysUserEmail;
    private String sysUserDescription;
    private Boolean status;//状态，1为可用


    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName;
    }

    public String getSysUserPassword() {
        return sysUserPassword;
    }

    public void setSysUserPassword(String sysUserPassword) {
        this.sysUserPassword = sysUserPassword;
    }

    public String getSysUserQq() {
        return sysUserQq;
    }

    public void setSysUserQq(String sysUserQq) {
        this.sysUserQq = sysUserQq;
    }

    public String getSysUserEmail() {
        return sysUserEmail;
    }

    public void setSysUserEmail(String sysUserEmail) {
        this.sysUserEmail = sysUserEmail;
    }

    public String getSysUserDescription() {
        return sysUserDescription;
    }

    public void setSysUserDescription(String sysUserDescription) {
        this.sysUserDescription = sysUserDescription;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(Integer sysUserId) {
        this.sysUserId = sysUserId;
    }
}
