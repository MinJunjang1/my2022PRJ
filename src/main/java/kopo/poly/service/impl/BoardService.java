package kopo.poly.service.impl;

import kopo.poly.dto.BoardDTO;
import kopo.poly.persistance.mapper.IBoardMapper;
import kopo.poly.service.IBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import kopo.poly.dto.Criteria;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
    public class BoardService implements IBoardService {

    @Autowired
    IBoardMapper mapper;
        @Override
        public void enroll(BoardDTO board) {

            mapper.enroll(board);

        }

        /* 게시판 목록 */
        @Override
        public List<BoardDTO> getList() {

            return mapper.getList();
        }

        /* 게시판 목록(페이징 적용) */
        @Override
        public List<BoardDTO> getListPaging(Criteria cri) {

            return mapper.getListPaging(cri);
        }

        /* 게시판 조회 */
        @Override
        public BoardDTO getPage(int bno) {

            return mapper.getPage(bno);
        }

        /* 게시판 수정 */
        @Override
        public int modify(BoardDTO board) {

            return mapper.modify(board);
        }

        /* 게시판 삭제 */
        @Override
        public int delete(int bno) {

            return mapper.delete(bno);
        }

        /* 게시물 총 갯수 */
        @Override
        public int getTotal(Criteria cri) {

            return mapper.getTotal(cri);
        }

    }
