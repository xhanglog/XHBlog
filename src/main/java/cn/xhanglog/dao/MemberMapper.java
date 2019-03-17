package cn.xhanglog.dao;

import cn.xhanglog.entity.Member;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface MemberMapper {
    List<Member> getAllMembers();

    void addMember(Member member);

    Member getMemberById(String openID);
}