package cn.xhanglog.service;

import cn.xhanglog.entity.Menu;

import java.util.List;

/**
 * @Author: Xhang
 */
public interface MenuService {
    List<Menu> getAllMenu();

    Menu getMenuByName(String menuName);
}
