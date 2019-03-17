package cn.xhanglog.service.impl;

import cn.xhanglog.dao.MemberMapper;
import cn.xhanglog.entity.Member;
import cn.xhanglog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
