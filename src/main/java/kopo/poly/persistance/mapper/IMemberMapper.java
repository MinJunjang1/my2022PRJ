package kopo.poly.persistance.mapper;

import kopo.poly.dto.MemberDTO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMemberMapper {
    public int idCheck(String user_id) throws Exception;

     void userjoin(MemberDTO memberDTO) throws Exception;

     MemberDTO userlogin(MemberDTO memberDTO) throws Exception;

    List<MemberDTO> getuserList() throws Exception;

    MemberDTO userinfo(String user_id) throws Exception;
}
