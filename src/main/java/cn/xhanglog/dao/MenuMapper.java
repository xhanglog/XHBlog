package cn.xhanglog.dao;

import cn.xhanglog.entity.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface MenuMapper {
    List<Menu> getAllMenu(@Param("st") Integer st);

    Menu getMenuByName(String menuName);

    Integer getMenuCount();

    Integer editSwitch(@Param("menuId") Integer menuId, @Param("val") Boolean val);

    Integer delMenuById(Integer menuId);

    Menu getMenuInfo(Integer menuId);

    Integer addMenu(Menu menu);

    Integer editMenu(Menu menu);
}
