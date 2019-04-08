package cn.xhanglog.service.impl;

import cn.xhanglog.dao.MemberMapper;
import cn.xhanglog.entity.Member;
import cn.xhanglog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void addMember(Member member) {
        memberMapper.addMember(member);
    }

    @Override
    public Member getMemberById(String openID) {
        return memberMapper.getMemberById(openID);
    }

    @Override
    public Integer getMemberCount() {
        return memberMapper.getMemberCount();
    }

    @Override
    public List<Member> getMembers(Integer page, Integer size, Date start, Date end, String name) {
        Integer startRow = (page-1) * size;
        return memberMapper.getMembers(startRow,size,start,end,name);
    }

    @Override
    public Integer getMemberCountByCriteria(Date start, Date end, String title) {
        return memberMapper.getMemberCountByCriteria(start,end,title);
    }

    @Override
    public Integer editSwitch(String memberId, Boolean val) {
        return memberMapper.editSwitch(memberId,val);
    }

    @Override
    public Integer delMemberById(String memberId) {
        return memberMapper.delMemberId(memberId);
    }
}
