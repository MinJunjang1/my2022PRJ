package kopo.poly.persistance.mapper;

import kopo.poly.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberMapper {
    public int idCheck(String user_id) throws Exception;

     void userjoin(MemberDTO memberDTO) throws Exception;

     void userlogin(MemberDTO memberDTO) throws Exception;
}
