package kopo.poly.persistance.mapper;

import kopo.poly.dto.chatDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChatMapper {
    /* 게시판 등록 */
    public void insertchat(chatDTO chatDTO);

    /* 게시판 목록 */


}
