package kopo.poly.controller;

import kopo.poly.dto.*;
import kopo.poly.service.impl.BoardService;
import kopo.poly.service.impl.ChatService;
import kopo.poly.service.impl.recoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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

    @Autowired
    private recoService recoService;



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
    @GetMapping("/board/chatlist")
    public void chatListGET(Model model, Criteria cri, int comet_seq ,int bno) {

        model.addAttribute("clist", ChatService.getList(bno));
        if(ChatService.getList(bno) == null){
            model.addAttribute("clist", ChatService.getcListPaging(cri));
            int total = ChatService.getcTotal(cri);
            System.out.println(total);

            model.addAttribute("total", ChatService.getcTotal(cri));

            System.out.println(total);
            PageMakerDTO pageMake = new PageMakerDTO(cri, total);
            model.addAttribute("pageInfo", ChatService.getcPage(comet_seq));

            model.addAttribute("cri", cri);

            model.addAttribute("pageMaker", pageMake);

        }





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
        public void boardGetPageGET(int bno, Model model, Criteria cri, chatDTO chatDTO,recoDTO pDTO) {


            model.addAttribute("pageInfo", BoardService.getPage(bno));

            model.addAttribute("cri", cri);

            model.addAttribute("clist", ChatService.getList(bno));



            int total = ChatService.getcTotal(cri);
            System.out.println(total);
            System.out.println("bno +++++++++++++" + bno);
            model.addAttribute("total", ChatService.getcTotal(cri));

            System.out.println(total);

            model.addAttribute("clist", ChatService.getcListPaging(cri));

            PageMakerDTO pageMake = new PageMakerDTO(cri, total);
       /*     model.addAttribute("pageInfo", ChatService.getcPage(bno));

            model.addAttribute("cri", cri);*/

            model.addAttribute("pageMaker", pageMake);



/////////////////////////////////////대댓글

            model.addAttribute("rlist", recoService.getrecoList2(pDTO));






        }

        @GetMapping(value ="/boarder/get", produces =  MediaType.APPLICATION_JSON_UTF8_VALUE)
        public recopageDTO replyListPost(Criteria cri){
            return recoService.replyList(cri);
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




    @GetMapping("/board/recolist")
    public void recoListGET(Model model, Criteria cri, int reco_seq) {

        int total = recoService.getrecoTotal(cri);
        model.addAttribute("total", recoService.getrecoTotal(cri));
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        model.addAttribute("recopageInfo", recoService.getrecoPage(reco_seq));

        model.addAttribute("cri", cri);

        model.addAttribute("pageMaker", pageMake);
        model.addAttribute("rlist", recoService.getrecoListPaging(cri));
    }




    @PostMapping("/board/deletereco")
    public String deletereco(recoDTO recoDTO, HttpServletRequest request, HttpSession session, Model model){
        String recomet_seq = CmmUtil.nvl(request.getParameter("recomet_seq"));
            String bno = CmmUtil.nvl(request.getParameter("bno"));

            recoDTO reco = new recoDTO();
        log.info(recomet_seq);
        log.info(bno);
        reco.setRecomet_seq(Integer.parseInt(recomet_seq));
        reco.setBno(Integer.parseInt(bno));

                recoService.deletereco(recoDTO);

        return "redirect:/board/get?pageNum=1&amount=10&keyword=&type=&bno=" + bno;
    }



    @ResponseBody
@PostMapping("/board/deletechat")
    public void deletechat(chatDTO chatDTO){
            ChatService.deletechat(chatDTO);
}

@PostMapping("/chatupdate")
    public void chatupdatepost(chatDTO chatDTO){
            ChatService.updatechat(chatDTO);
}
    @RequestMapping(value="/board/updatec", method=RequestMethod.POST)
    public String updatecPOST(HttpServletRequest request, HttpSession session, Model model) throws Exception{


        String comet_seq = CmmUtil.nvl(request.getParameter("comet_seq"));
        String bno = CmmUtil.nvl(request.getParameter("bno"));
        String writer = CmmUtil.nvl(request.getParameter("writer"));
        String comet_content = CmmUtil.nvl(request.getParameter("comet_content"));
        chatDTO cDTO = new chatDTO();
        cDTO.setComet_seq(Integer.parseInt(comet_seq));
        cDTO.setBno(Integer.parseInt(bno));
        cDTO.setWriter(writer);
        cDTO.setComet_content(comet_content);

        /*
         * 게시글 등록하기위한 비즈니스 로직을 호출
         */ChatService.updatec(cDTO);



        return "redirect:/board/get?pageNum=1&amount=10&keyword=&type=&bno=" + bno;
        }


    @RequestMapping(value="/board/recoin", method=RequestMethod.POST)
    public String recoin(HttpServletRequest request, HttpSession session, Model model) throws Exception{


        String comet_seq = CmmUtil.nvl(request.getParameter("comet_seq"));
        String bno = CmmUtil.nvl(request.getParameter("bno"));
        String recowriter = CmmUtil.nvl(request.getParameter("recowriter"));
        String reco_content = CmmUtil.nvl(request.getParameter("reco_content"));

        log.info(comet_seq);
        log.info(bno);
        log.info(recowriter);
        log.info(reco_content);


        recoDTO recoDTO = new recoDTO();

        recoDTO.setComet_seq(Integer.parseInt(comet_seq));
        recoDTO.setBno(Integer.parseInt(bno));
        recoDTO.setRecowriter(recowriter);
        recoDTO.setReco_content(reco_content);

        /*
         * 게시글 등록하기위한 비즈니스 로직을 호출
         */
        recoService.recoin(recoDTO);

        return "redirect:/board/get?pageNum=1&amount=10&keyword=&type=&bno=" + bno;
    }



    }

