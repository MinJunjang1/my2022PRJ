package kopo.poly.service;

import kopo.poly.dto.BoardDTO;
import org.springframework.data.mongodb.core.query.Criteria;

import java.util.List;

public interface IBoardService {


    void enroll(BoardDTO board);

    List<BoardDTO> getList();

    List<BoardDTO> getListPaging(Criteria cri);

    BoardDTO getPage(int bno);

    int modify(BoardDTO board);

    int delete(int bno);

    int getTotal(Criteria cri);
}

