package cn.xhanglog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章实体
 * @author Xhang
 */
public class Artical implements Serializable {
    private Integer articalId;//编号
    private String title;//标题
    private String coverImage;//封面图片
    private String summary;//内容
    private String content;//内容
    private String keywords;//关键字  以逗号隔开
    private Boolean status;// 文章状态，1为显示
    private Boolean comment;//是否允许评论
    private Boolean recommended;//是否推荐
    private Integer lookCount;//查看次数
    private Integer commentCount;//查看次数
    private Date createTime;//发布时间
    private Date updateTime;//更新时间

    private Menu menu;//文章所属菜单
    private SysUser user;//文章所有者

    public Integer getId() {
        return articalId;
    }

    public void setId(Integer articalId) {
        this.articalId = articalId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getComment() {
        return comment;
    }

    public void setComment(Boolean comment) {
        this.comment = comment;
    }

    public Boolean getRecommended() {
        return recommended;
    }

    public void setRecommended(Boolean recommended) {
        this.recommended = recommended;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public Integer getLookCount() {
        return lookCount;
    }

    public void setLookCount(Integer lookCount) {
        this.lookCount = lookCount;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
}
