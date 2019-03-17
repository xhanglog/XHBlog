package cn.xhanglog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 菜单实体
 * @Author: Xhang
 */
public class Menu implements Serializable {
    private Integer menuId;//编号
    private Integer pid;//父编号
    private String menuName;//名称
    private Integer menuSort;//排序
    private Boolean available;//是否可用
    private String menuDescription;//描述
    private Date menuCreateTime;//创建时间
    private Date menuUpdateTime;//修改时间
    private Integer lookView;

    private Integer menuLeaval;//菜单的级别

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getMenuSort() {
        return menuSort;
    }

    public void setMenuSort(Integer menuSort) {
        this.menuSort = menuSort;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public String getMenuDescription() {
        return menuDescription;
    }

    public void setMenuDescription(String menuDescription) {
        this.menuDescription = menuDescription;
    }

    public Date getMenuCreateTime() {
        return menuCreateTime;
    }

    public void setMenuCreateTime(Date menuCreateTime) {
        this.menuCreateTime = menuCreateTime;
    }

    public Date getMenuUpdateTime() {
        return menuUpdateTime;
    }

    public void setMenuUpdateTime(Date menuUpdateTime) {
        this.menuUpdateTime = menuUpdateTime;
    }

    public Integer getMenuLeaval() {
        return menuLeaval;
    }

    public void setMenuLeaval(Integer menuLeaval) {
        this.menuLeaval = menuLeaval;
    }

    public Integer getLookView() {
        return lookView;
    }

    public void setLookView(Integer lookView) {
        this.lookView = lookView;
    }
}
