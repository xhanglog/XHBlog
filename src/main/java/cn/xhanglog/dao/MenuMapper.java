package cn.xhanglog.dao;

import cn.xhanglog.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface MenuMapper {
    List<Menu> getAllMenu();

    Menu getMenuByName(String menuName);
}
