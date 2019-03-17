package cn.xhanglog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员实体
 * @Author: Xhang
 */
public class Member implements Serializable {
    private String memberId;
    private String memberNickname;//用户昵称
    private String memberImage;//用户头像
    private Boolean sex;//1为男，0为女
    private Boolean comment;//是否允许评论

    public String getMemberNickname() {
        return memberNickname;
    }

    public void setMemberNickname(String memberNickname) {
        this.memberNickname = memberNickname;
    }

    public String getMemberImage() {
        return memberImage;
    }

    public void setMemberImage(String memberImage) {
        this.memberImage = memberImage;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public Boolean getComment() {
        return comment;
    }

    public void setComment(Boolean comment) {
        this.comment = comment;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
}
