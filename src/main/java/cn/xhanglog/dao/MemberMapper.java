package cn.xhanglog.dao;

import cn.xhanglog.entity.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
@Repository
public interface MemberMapper {
    List<Member> getAllMembers();

    void addMember(Member member);

    Member getMemberById(String openID);

    Integer getMemberCount();

    List<Member> getMembers(@Param("startRow")Integer startRow, @Param("size")Integer size, @Param("start")Date start,
                            @Param("end") Date end, @Param("name") String name);

    Integer getMemberCountByCriteria(@Param("start")Date start, @Param("end")Date end, @Param("name")String name);

    Integer editSwitch(@Param("memberId") String memberId,@Param("val") Boolean val);

    Integer delMemberId(String memberId);
}