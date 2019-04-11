package cn.xhanglog.service;

import cn.xhanglog.entity.Menu;

import java.util.List;

/**
 * @Author: Xhang
 */
public interface MenuService {
    List<Menu> getAllMenu(Integer st);

    Menu getMenuByName(String menuName);

    Integer getMenuCount();

    Integer editSwitch(Integer menuId, Boolean val);

    Integer delMenuById(Integer menuId);

    Menu getMenuInfo(Integer menuId);

    Integer addMenu(Menu menu);

    Integer editMenu(Menu menu);
}
