package cn.xhanglog.service.impl;

import cn.xhanglog.dao.MenuMapper;
import cn.xhanglog.entity.Menu;
import cn.xhanglog.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;
    @Override
    public List<Menu> getAllMenu() {
        List<Menu> menuList = menuMapper.getAllMenu();
        return menuList;
    }

    @Override
    public Menu getMenuByName(String menuName) {
        return menuMapper.getMenuByName(menuName);
    }
}
