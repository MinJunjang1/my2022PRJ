package kopo.poly.service;

import kopo.poly.dto.MemberDTO;

import java.util.List;

public interface IMemberService {

    public void userjoin(MemberDTO memberDTO) throws Exception;

	public int idCheck(String user_id) throws Exception;

    public MemberDTO userlogin(MemberDTO memberDTO) throws Exception;


    List<MemberDTO> getuserList() throws Exception;
}

