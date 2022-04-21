package kopo.poly.service.impl;

import kopo.poly.dto.MemberDTO;
import kopo.poly.persistance.mapper.IMemberMapper;
import kopo.poly.service.IMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("MemberService")
public class MemberService implements IMemberService {

    @Autowired
    IMemberMapper memberMapper;

    @Override
    public void userjoin(MemberDTO memberDTO) throws Exception {
       memberMapper.userjoin(memberDTO);
    }
}
