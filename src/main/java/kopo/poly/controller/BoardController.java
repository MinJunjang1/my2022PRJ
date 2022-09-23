package kopo.poly.controller;

import kopo.poly.dto.*;
import kopo.poly.service.impl.BoardService;
import kopo.poly.service.impl.ChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class BoardController {


        @Autowired
        private BoardService BoardService;
    @Autowired
    private ChatService ChatService;



        /* 게시판 목록 페이지 접속(페이징 적용) */
        @GetMapping("/board/list")
        public void boardListGET(Model model, Criteria cri) {


            model.addAttribute("list", BoardService.getListPaging(cri));

            int total = BoardService.getTotal(cri);
            model.addAttribute("total",BoardService.getTotal(cri));
            PageMakerDTO pageMake = new PageMakerDTO(cri, total);

            model.addAttribute("pageMaker", pageMake);

        } @GetMapping("/admin/boardlist")
    public String boardList2GET(Model model, Criteria cri, HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, HttpSession session) {


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



        }

        /* 게시판 등록 */
        @PostMapping("/board/enroll1")
        public String boardEnrollPOST(BoardDTO board, RedirectAttributes rttr) {


            BoardService.enroll(board);



            rttr.addFlashAttribute("result", "enrol success");

            return "redirect:/board/list";

        }

        /* 게시판 조회 */

        @GetMapping("/board/get")
        public void boardGetPageGET(int bno, Model model, Criteria cri, chatDTO chatDTO) {

            model.addAttribute("pageInfo", BoardService.getPage(bno));

            model.addAttribute("cri", cri);

            model.addAttribute("clist", ChatService.getList(bno));




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
    @GetMapping("/admin/modify")
    public void boardMo2difyGET(int bno, Model model, Criteria cri) {

        model.addAttribute("pageInfo", BoardService.getPage(bno));

        model.addAttribute("cri", cri);

    }
        /* 페이지 수정 */
        @PostMapping("/board/modify1")
        public String boardModifyPOST(BoardDTO board, RedirectAttributes rttr,Model model,MemberDTO memberDTO,HttpSession session, HttpServletRequest request) {

            BoardService.modify(board);

            rttr.addFlashAttribute("result", "modify success");



            MemberDTO mDTO = (MemberDTO) session.getAttribute("memberDTO");
            int adminck = Integer.valueOf(mDTO.getAdminCk());
            if(adminck==0){
                System.out.println(request.getAttribute("msg"));
                return "redirect:/board/list";
            }

            return "redirect:/admin/boardlist";
        }

    @PostMapping("/admin/modify2")
    public String adminboardModifyPOST(BoardDTO board, RedirectAttributes rttr) {

        BoardService.modify(board);

        rttr.addFlashAttribute("result", "modify success");

        return "redirect:/admin/boardlist";

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
    public String writechat(chatDTO chatDTO,RedirectAttributes rttr,HttpServletRequest request) throws Exception {
        ChatService.insertChat(chatDTO);
        rttr.addFlashAttribute("result", "chat success");
        return "/board/list";
    }
    @GetMapping("/board/chatlist")
    public void chatListGET(Model model, Criteria cri, int comet_seq) {

        int total = ChatService.getTotal(cri);
        model.addAttribute("total", ChatService.getTotal(cri));
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        model.addAttribute("pageInfo", ChatService.getPage(comet_seq));

        model.addAttribute("cri", cri);

        model.addAttribute("pageMaker", pageMake);
        model.addAttribute("clist", ChatService.getListPaging(cri));
    }
@ResponseBody
@PostMapping("/board/deletechat")
    public void deletechat(chatDTO chatDTO){
            ChatService.deletechat(chatDTO);
}



    }
