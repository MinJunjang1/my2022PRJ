package kopo.poly.controller;

import kopo.poly.dto.*;
import kopo.poly.service.IChatService;
import kopo.poly.service.impl.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
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
        @GetMapping("/board/list")
        public void boardListGET(Model model, Criteria cri) {

            log.info("boardListGET");

            log.info("cri : " + cri);

            model.addAttribute("list", BoardService.getListPaging(cri));

            int total = BoardService.getTotal(cri);
            model.addAttribute("total",BoardService.getTotal(cri));
            PageMakerDTO pageMake = new PageMakerDTO(cri, total);

            model.addAttribute("pageMaker", pageMake);

        } @GetMapping("/admin/boardlist")
    public String boardList2GET(Model model, Criteria cri, HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, HttpSession session) {

        log.info("boardListGET");

        log.info("cri : " + cri);

        model.addAttribute("list", BoardService.getListPaging(cri));

        int total = BoardService.getTotal(cri);

        PageMakerDTO pageMake = new PageMakerDTO(cri, total);

        model.addAttribute("pageMaker", pageMake);

        MemberDTO mDTO = (MemberDTO) session.getAttribute("memberDTO");
        int adminck = Integer.valueOf(mDTO.getAdminCk());
        if(adminck==0){
            model.addAttribute("msg", "잘못된 사용자 입니다.");
            System.out.println(request.getAttribute("msg"));
            return "/alert";
        }
        return "/admin/boardlist";

    }

        /* 게시판 등록 페이지 접속 */
        @GetMapping("/board/enroll")
        // => @RequestMapping(value="enroll", method=RequestMethod.GET)
        public void boardEnrollGET() {

            log.info("게시판 등록 페이지 진입");

        }

        /* 게시판 등록 */
        @PostMapping("/board/enroll1")
        public String boardEnrollPOST(BoardDTO board, RedirectAttributes rttr) {

            log.info("BoardDTO : " + board);

            BoardService.enroll(board);

            log.info("BoardDTO : " + board);

            rttr.addFlashAttribute("result", "enrol success");

            return "redirect:/board/list";

        }

        /* 게시판 조회 */
        @GetMapping("/board/get")
        public void boardGetPageGET(int bno, Model model, Criteria cri) {

            model.addAttribute("pageInfo", BoardService.getPage(bno));

            model.addAttribute("cri", cri);

        }
    @GetMapping("/admin/boardget")
    public String boardGetPage2GET(int bno, Model model, Criteria cri, HttpSession session, HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr) {


        model.addAttribute("pageInfo", BoardService.getPage(bno));

        model.addAttribute("cri", cri);

        MemberDTO mDTO = (MemberDTO) session.getAttribute("memberDTO");
        int adminck = Integer.valueOf(mDTO.getAdminCk());
        if(adminck==0){
            model.addAttribute("msg", "잘못된 사용자 입니다.");
            System.out.println(request.getAttribute("msg"));
            return "/alert";
        }
        return "/admin/boardget";
    }

        /* 수정 페이지 이동 */
        @GetMapping("/board/modify")
        public void boardModifyGET(int bno, Model model, Criteria cri) {

            model.addAttribute("pageInfo", BoardService.getPage(bno));

            model.addAttribute("cri", cri);

        }

        /* 페이지 수정 */
        @PostMapping("/board/modify1")
        public String boardModifyPOST(BoardDTO board, RedirectAttributes rttr) {

            BoardService.modify(board);

            rttr.addFlashAttribute("result", "modify success");

            return "redirect:/board/list";

        }

        /* 페이지 삭제 */
        @PostMapping("/board/delete")
        public String boardDeletePOST(int bno, RedirectAttributes rttr) {

            BoardService.delete(bno);

            rttr.addFlashAttribute("result", "delete success");

            return "redirect:/board/list";
        }
    @PostMapping("/admin/boarddelete")
    public String boardDelete2POST(int bno, RedirectAttributes rttr) {

        BoardService.delete(bno);

        rttr.addFlashAttribute("result", "delete success");

        return "redirect:/admin/list";
    }
    @RequestMapping(value="/board/chat", method= RequestMethod.POST)
    public String writechat(chatDTO chatDTO,RedirectAttributes rttr) throws Exception{
        IChatService.insertchat(chatDTO);

        rttr.addFlashAttribute("result", "chat success");


        return "";
}
