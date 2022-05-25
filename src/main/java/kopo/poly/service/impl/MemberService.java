package kopo.poly.service.impl;

import kopo.poly.dto.MemberDTO;
import kopo.poly.persistance.mapper.IMemberMapper;
import kopo.poly.service.IMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Slf4j
@Service("MemberService")
public class MemberService implements IMemberService {

    @Autowired
    IMemberMapper memberMapper;

    @Override
    public void userjoin(MemberDTO memberDTO) throws Exception {
       memberMapper.userjoin(memberDTO);
    }

    @Override
    public int idCheck(String user_id) throws Exception {
        return memberMapper.idCheck(user_id);
    }

    @Override
    public MemberDTO userlogin(MemberDTO memberDTO) throws Exception {

        return memberMapper.userlogin(memberDTO);
    }

    @Override
    public List<MemberDTO> getuserList() throws Exception {
        return memberMapper.getuserList();
    }

    @Override
    public MemberDTO userinfo(String user_id) throws Exception {
        return memberMapper.userinfo(user_id);
    }

    @Override
    public MemberDTO serchid(MemberDTO memberDTO) throws Exception {
        return memberMapper.serchid(memberDTO);
    }

    @Override
    public int emailck(String user_email) throws Exception {
        return memberMapper.emailck(user_email);
    }

    @Override
    public MemberDTO serchpw(MemberDTO memberDTO) throws Exception {
        return memberMapper.serchpw(memberDTO);
    }

    @Override
    public void userupdate(MemberDTO memberDTO) throws Exception {
        memberMapper.userupdate(memberDTO);
    }

    @Override
    public void deleteuser(MemberDTO memberDTO) throws Exception {
        memberMapper.deleteuser(memberDTO);
    }

//    @Override
//    public List<NoticeDTO> getNoticeList() throws Exception {
//
//        log.info(this.getClass().getName() + ".getNoticeList start!");
//
//        return noticeMapper.getNoticeList();
//
//    }
}
