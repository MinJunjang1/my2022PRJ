package kopo.poly.persistance.mapper;

import kopo.poly.dto.BoardDTO;
import kopo.poly.dto.Criteria;
import kopo.poly.dto.chatDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IBoardMapper {
    /* 게시판 등록 */
    public void enroll(BoardDTO board);

    /* 게시판 목록 */
    public List<BoardDTO> getList();

    /* 게시판 목록(페이징 적용) */
    public List<BoardDTO> getListPaging(Criteria cri);

    /* 게시판 조회 */
    public BoardDTO getPage(int bno);

    /* 게시판 수정 */
    public int modify(BoardDTO board);

    /* 게시판 삭제 */
    public int delete(int bno);

    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);

    List<chatDTO> getcometList(chatDTO pDTO);

}
