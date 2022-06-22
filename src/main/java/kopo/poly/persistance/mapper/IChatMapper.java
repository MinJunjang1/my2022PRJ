package kopo.poly.persistance.mapper;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.chatDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IChatMapper {
    /* 게시판 등록 */
     void insertChat(chatDTO chatDTO);

    int getTotal(Criteria cri);
    List<chatDTO> getList(int bno);

    List<chatDTO> getListPaging(Criteria cri);

    List<chatDTO> getPage(int comet_seq);

    public int deletechat(int comet_seq);

    /* 게시판 목록 */


}
