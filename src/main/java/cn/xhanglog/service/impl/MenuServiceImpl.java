package cn.xhanglog.service.impl;

import cn.xhanglog.dao.MenuMapper;
import cn.xhanglog.entity.Menu;
import cn.xhanglog.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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
    @Cacheable(value = "menu")
    public List<Menu> getAllMenu(Integer st) {
        List<Menu> menuList = menuMapper.getAllMenu(st);
        return menuList;
    }

    @Override
    public Menu getMenuByName(String menuName) {
        return menuMapper.getMenuByName(menuName);
    }

    @Override
    public Integer getMenuCount() {
        return menuMapper.getMenuCount();
    }

    @Override
    @CacheEvict(value = "menu",allEntries=true)
    public Integer editSwitch(Integer menuId, Boolean val) {
        return menuMapper.editSwitch(menuId,val);
    }

    @Override
    @CacheEvict(value = "menu",allEntries=true)
    public Integer delMenuById(Integer menuId) {
        return menuMapper.delMenuById(menuId);
    }

    @Override
    public Menu getMenuInfo(Integer menuId) {
        return menuMapper.getMenuInfo(menuId);
    }

    @Override
    @CacheEvict(value = "menu",allEntries=true)
    public Integer addMenu(Menu menu) {
        return menuMapper.addMenu(menu);
    }

    @Override
    @CacheEvict(value = "menu",allEntries=true)
    public Integer editMenu(Menu menu) {
        return menuMapper.editMenu(menu);
    }

    @Override
    @CacheEvict(value = "menu",allEntries=true)
    public Integer editInText(Integer menuId, Integer value, String field) {
        return menuMapper.editInText( menuId,value,field);
    }
}
