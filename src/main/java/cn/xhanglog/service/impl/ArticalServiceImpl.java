package cn.xhanglog.service.impl;

import cn.xhanglog.dao.ArticalMapper;
import cn.xhanglog.entity.Artical;
import cn.xhanglog.service.ArticalService;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class ArticalServiceImpl implements ArticalService {
    @Autowired
    private ArticalMapper articalMapper;

    @Override
    @Cacheable(value = "artical" , key="0")
    public List<Artical> getRecommendedArtical() {
        List<Artical> recommendedArtical = articalMapper.getRecommendedArtical();
        return recommendedArtical;
    }

    @Override
    @Cacheable(value = "artical", key="1")
    public List<Artical> getClickMostArtical() {
        List<Artical> clickMostArtical = articalMapper.getClickMostArtical();
        return clickMostArtical;
    }

    @Override
    @Cacheable(value = "artical", key="2")
    public List<Artical> getCommentMost() {
        return articalMapper.getCommentMost();
    }

    @Override
    public List<Artical> getShowIndexArtical() {
        return articalMapper.getShowIndexArtical();
    }

    @Override
    public Artical getArticalInfoById(Integer id) {
        return articalMapper.getArticalInfoById(id);
    }

    @Override
    public Artical getPreArtical(Integer id) {
        return articalMapper.getPreArtical(id);
    }

    @Override
    public Artical getAfterArtical(Integer id) {
        return articalMapper.getAfterArtical(id);
    }

    @Override
    public Page<Artical> getArticalListByTagId(Integer tagId, Integer page, Integer rows) {
        Page<Artical> re = new Page<>();
        //开始行
        Integer startRow = (page-1) * rows;
        List<Artical> articalList = articalMapper.getArticalListByTagId(tagId, startRow ,rows);
        Integer count = articalMapper.getArticalCountByTagId(tagId);
        re.setPage(page);
        re.setRows(articalList);
        re.setSize(rows);
        re.setTotal(count);
        return re;
    }

    @Override
    public Page<Artical> getArticalListByMenuId(Integer menuId,Integer page, Integer rows) {
        Page<Artical> re = new Page<>();
        //开始行
        Integer startRow = (page-1) * rows;
        List<Artical> articalList = articalMapper.getArticalListByMenuId(menuId, startRow, rows);
        Integer count = articalMapper.getArticalCountByMenuId(menuId);
        re.setPage(page);
        re.setRows(articalList);
        re.setSize(rows);
        re.setTotal(count);
        return re;
    }

    @Override
    public Page<Artical> getArticalsBySearch(String keyword, Integer page, Integer rows) {
        Page<Artical> re = new Page<>();
        //开始行
        Integer startRow = (page-1) * rows;
        List<Artical> articalList = null;
        Integer count = 0;
        if(keyword != null){
            String key = keyword.trim();
            articalList = articalMapper.getArticalsBySearch(key, startRow, rows);
            count = articalMapper.getArticalCountBySearch(key);
        }
        re.setPage(page);
        re.setRows(articalList);
        re.setSize(rows);
        re.setTotal(count);
        return re;
    }

    @Override
    public void addArticalLookCount(Integer id) {
        articalMapper.addArticalLookCount(id);
    }

    @Override
    public void addCommentCount(Integer articalID) {
        articalMapper.addCommentCount(articalID);
    }

    @Override
    public Integer getAriticalCount() {
        return articalMapper.getAriticalCount();
    }

    @Override
    public Integer getCommentCount() {
        return articalMapper.getCommentCount();
    }

    @Override
    public Integer getLookCount() {
        return articalMapper.getLookCount();
    }

    @Override
    public Integer addArtical(Artical artical) {
        return articalMapper.addArtical(artical);
    }

    @Override
    public List<Artical> getArticals(Integer page, Integer size, Date start, Date end, String title) {
        Integer startRow = (page-1) * size;
        return articalMapper.getArticals(startRow,size,start,end,title);
    }

    @Override
    public Integer getAriticalCountByCriteria(Date start, Date end, String title) {
        return articalMapper.getAriticalCountByCriteria(start,end,title);
    }

    @Override
    public Artical getArticalById(Integer parseInt) {
        return articalMapper.getArticalById(parseInt);
    }

    @Override
    public Integer editArtical(Artical artical) {
        return articalMapper.editArtical(artical);
    }

    @Override
    public Integer delArticalById(Integer id) {
        return articalMapper.delArticalById(id);
    }

    @Override
    public Integer editSwitch(Integer articalId, Boolean val, String name) {
        return articalMapper.editSwitch(articalId,val,name);
    }

}
