package kopo.poly.persistance.mapper;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.chatDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IChatMapper {
    /* 게시판 등록 */
     void insertChat(chatDTO chatDTO);

    int getcTotal(Criteria cri);
    List<chatDTO> getList(int bno);

    List<chatDTO> getcListPaging(Criteria cri);

    List<chatDTO> getcPage(int comet_seq);

    public int deletechat(int comet_seq);

    public int updatechat(chatDTO chatDTO);

    public chatDTO getupdatechat(int comet_seq);

    void updatec(chatDTO cDTO) throws Exception;

    /* 게시판 목록 */


}
