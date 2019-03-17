package cn.xhanglog.service;

import cn.xhanglog.entity.Member;

/**
 * @Author: Xhang
 */
public interface MemberService {
    void addMember(Member member);

    Member getMemberById(String openID);
}
