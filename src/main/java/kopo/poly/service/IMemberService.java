package kopo.poly.service;

import kopo.poly.dto.MemberDTO;

import java.util.List;

public interface IMemberService {

    public void userjoin(MemberDTO memberDTO) throws Exception;

	public int idCheck(String user_id) throws Exception;

    public MemberDTO userlogin(MemberDTO memberDTO) throws Exception;


    List<MemberDTO> getuserList() throws Exception;

    MemberDTO userinfo(String user_id) throws Exception;

    MemberDTO serchid(MemberDTO pDTO) throws Exception;

    int emailck(String user_email)throws Exception;

    MemberDTO serchpw(MemberDTO memberDTO) throws Exception;

    void userupdate(MemberDTO pDTO) throws Exception;

    void deleteuser(MemberDTO memberDTO) throws Exception;
}

