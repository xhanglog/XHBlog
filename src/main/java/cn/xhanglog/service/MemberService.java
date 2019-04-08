package cn.xhanglog.service;

import cn.xhanglog.entity.Member;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
public interface MemberService {
    /**
     * 添加会员
     * @param member
     */
    void addMember(Member member);

    /**
     * 根据ID获取会员信息
     * @param openID
     * @return
     */
    Member getMemberById(String openID);

    /**
     * 获取会员总数
     * @return
     */
    Integer getMemberCount();

    List<Member> getMembers(Integer page, Integer size, Date start, Date end, String title);

    Integer getMemberCountByCriteria(Date start, Date end, String title);

    Integer editSwitch(String memberId, Boolean val);

    Integer delMemberById(String memberId);
}
