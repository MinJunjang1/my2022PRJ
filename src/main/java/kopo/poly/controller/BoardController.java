package kopo.poly.controller;

import kopo.poly.dto.BoardDTO;
import kopo.poly.dto.Criteria;
import kopo.poly.dto.PageMakerDTO;
import kopo.poly.service.impl.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {


        @Autowired
        private BoardService BoardService;

        /* 게시판 목록 페이지 접속 */
	/*
	@GetMapping("/list")
	// => @RequestMapping(value="list", method=RequestMethod.GET)
	public void boardListGET(Model model) {

		log.info("게시판 목록 페이지 진입");

		model.addAttribute("list", BoardService.getList());

	}
	*/

        /* 게시판 목록 페이지 접속(페이징 적용) */
        @GetMapping("/list")
        public void boardListGET(Model model, Criteria cri) {

            log.info("boardListGET");

            log.info("cri : " + cri);

            model.addAttribute("list", BoardService.getListPaging(cri));

            int total = BoardService.getTotal(cri);

            PageMakerDTO pageMake = new PageMakerDTO(cri, total);

            model.addAttribute("pageMaker", pageMake);

        }

        /* 게시판 등록 페이지 접속 */
        @GetMapping("/enroll")
        // => @RequestMapping(value="enroll", method=RequestMethod.GET)
        public void boardEnrollGET() {

            log.info("게시판 등록 페이지 진입");

        }

        /* 게시판 등록 */
        @PostMapping("/enroll1")
        public String boardEnrollPOST(BoardDTO board, RedirectAttributes rttr) {

            log.info("BoardDTO : " + board);

            BoardService.enroll(board);

            log.info("BoardDTO : " + board);

            rttr.addFlashAttribute("result", "enrol success");

            return "redirect:/board/list";

        }

        /* 게시판 조회 */
        @GetMapping("/get")
        public void boardGetPageGET(int bno, Model model, Criteria cri) {

            model.addAttribute("pageInfo", BoardService.getPage(bno));

            model.addAttribute("cri", cri);

        }


        /* 수정 페이지 이동 */
        @GetMapping("/modify")
        public void boardModifyGET(int bno, Model model, Criteria cri) {

            model.addAttribute("pageInfo", BoardService.getPage(bno));

            model.addAttribute("cri", cri);

        }

        /* 페이지 수정 */
        @PostMapping("/modify1")
        public String boardModifyPOST(BoardDTO board, RedirectAttributes rttr) {

            BoardService.modify(board);

            rttr.addFlashAttribute("result", "modify success");

            return "redirect:/board/list";

        }

        /* 페이지 삭제 */
        @PostMapping("/delete")
        public String boardDeletePOST(int bno, RedirectAttributes rttr) {

            BoardService.delete(bno);

            rttr.addFlashAttribute("result", "delete success");

            return "redirect:/board/list";
        }
}
