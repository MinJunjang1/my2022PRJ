package kopo.poly.controller;

import com.sun.org.apache.xml.internal.serializer.AttributesImplSerializer;
import kopo.poly.dto.MemberDTO;
import kopo.poly.dto.api2DTO;
import kopo.poly.service.IMemberService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.weatherapi;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 *
 * slf4j는 스프링 프레임워크에서 로그 처리하는 인터페이스 기술이며,
 * 로그처리 기술인 log4j와 logback과 인터페이스 역할 수행함
 * 스프링 프레임워크는 기본으로 logback을 채택해서 로그 처리함
 * */
@Slf4j
@Controller
public class MemberController {
    @Resource(name = "MemberService")
    private IMemberService memberService;
    @Autowired
    private JavaMailSender mailSender;
    private AttributesImplSerializer medel;

    /**
     * GetMapping은 GET방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * PostMapping은 POST방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * GetMapping(value = "index") =>  GET방식을 통해 접속되는 URL이 index인 경우 아래 함수를 실행함
     */
    //회원가입
    @RequestMapping(value="/join1", method=RequestMethod.POST)
    public String joinPOST(HttpServletRequest request) throws Exception{

        String user_id = CmmUtil.nvl(request.getParameter("userid"));
        String user_pw = CmmUtil.nvl(request.getParameter("memberPw"));
        String user_email = CmmUtil.nvl(request.getParameter("memberMail"));
        String user_addr1 = CmmUtil.nvl(request.getParameter("memberAddr1"));
        String user_addr2 = CmmUtil.nvl(request.getParameter("memberAddr2"));
        String user_addr3 = CmmUtil.nvl(request.getParameter("memberAddr3"));


        MemberDTO pDTO = new MemberDTO();

        pDTO.setUser_id(user_id);
        pDTO.setUser_pw(user_pw);
        pDTO.setUser_email(user_email);
        pDTO.setUser_addr1(user_addr1);
        pDTO.setUser_addr2(user_addr2);
        pDTO.setUser_addr3(user_addr3);

        /*
         * 게시글 등록하기위한 비즈니스 로직을 호출
         */
        memberService.userjoin(pDTO);



        // 회원가입 서비스 실행



        return "redirect:/login";

    }

    @RequestMapping(value="/update1", method=RequestMethod.POST)
    public String updatePOST(HttpServletRequest request, HttpSession session, Model model) throws Exception{


        String user_id = CmmUtil.nvl(request.getParameter("userid"));
        String user_pw = CmmUtil.nvl(request.getParameter("memberPw"));
        String user_addr1 = CmmUtil.nvl(request.getParameter("memberAddr1"));
        String user_addr2 = CmmUtil.nvl(request.getParameter("memberAddr2"));
        String user_addr3 = CmmUtil.nvl(request.getParameter("memberAddr3"));

        MemberDTO pDTO = new MemberDTO();
        pDTO.setUser_id(user_id);
        pDTO.setUser_pw(user_pw);
        pDTO.setUser_addr1(user_addr1);
        pDTO.setUser_addr2(user_addr2);
        pDTO.setUser_addr3(user_addr3);

        /*
         * 게시글 등록하기위한 비즈니스 로직을 호출
         */
        memberService.userupdate(pDTO);



        // 회원가입 서비스 실행
        session.invalidate();//로그인해제


        return "/index";

    }

    //getMapping 값 겹치지않기
    @GetMapping(value = "/join")
    public String joinpage() throws Exception {
    return "/member/join";
     }



    @GetMapping(value = "/update")
    public String updatepage( Model model, HttpServletRequest request) throws Exception {
       String user_id = CmmUtil.nvl(request.getParameter("user_id"));

        model.addAttribute("dto", memberService.userinfo(user_id));
        return "/member/update";
    }

    @GetMapping(value = "/header")
    public String headerpage() throws Exception {
        return "/member/header";
    }
    @GetMapping(value = "/login")
    public String loginpage() throws Exception {
        return "/member/login";
    }
    @GetMapping(value = "/serch")
    public String searchpage() throws Exception {
        return "/member/serch";
    }
    @GetMapping(value = "/join1")
    public String joinpage1() throws Exception {
        return "/member/join1";
    }
    @GetMapping(value = "/join2")
        public String apiweather(HttpServletRequest request, Model model) throws Exception{


        return "/member/join2";
    }
    @GetMapping(value = "/main")
    public String mainpage(HttpServletRequest request, Model model) throws Exception {
        List<api2DTO> a2List = weatherapi.main();
        log.info(String.valueOf(a2List.get(0)));
        model.addAttribute("a2List", a2List);
        return "/member/main";
    }
    @GetMapping(value = "/main1")
    public String mainpage1() throws Exception {

        return "/member/main1";
    }
/*    @GetMapping(value = "/map")
    public String Mappage( Model model, HttpServletRequest request) throws Exception {
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));

        model.addAttribute("dto", memberService.userinfo(user_id));
        return "/map";
    }*/
    @GetMapping(value = "/info")
    public String userinfo(String user_id, Model model, HttpServletRequest request) throws Exception {
        //테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동

       user_id = CmmUtil.nvl(request.getParameter("user_id"));

       model.addAttribute("dto", memberService.userinfo(user_id));
        return "/member/info";
    }

    @GetMapping(value = "/userlist")
    public String userList(ModelMap model)
            throws Exception {

        List<MemberDTO> mList = memberService.getuserList();

        if (mList == null) {
            mList = new ArrayList<>();

        }

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("mList", mList);

        // 함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/notice/NoticeList.jsp)
        return "/admin/userlist";

    }

    @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
    @ResponseBody
    public String memberIdChkPOST(String user_id) throws Exception{

        /* logger.info("memberIdChk() 진입"); */



        int result = memberService.idCheck(user_id);



        if(result != 0) {

            return "fail";	// 중복 아이디가 존재

        } else {

            return "success";	// 중복 아이디 x

        }

    } // memberIdChkPOST() 종료
    @RequestMapping(value = "/logout", method=RequestMethod.GET)
    public String logoutmain(HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login";
    }

    /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{

        /* 뷰(View)로부터 넘어온 데이터 확인 */


        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;


        /* 이메일 보내기 */
        String setFrom = "1820100293@gspace.kopo.ac.kr";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "인증 번호는 " + checkNum + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);

        }catch(Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);

        return num;

    }
    @RequestMapping(value = "/idserch", method = RequestMethod.POST)
    public String idserchPost(HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, Model model)throws Exception{
        String user_email = CmmUtil.nvl(request.getParameter("user_email"));
        MemberDTO pDTO = new MemberDTO();
        pDTO.setUser_email(user_email);
        HttpSession session = request.getSession();
        MemberDTO member = memberService.serchid(pDTO);
        session.setAttribute("memberDTO", member);
        if(member == null){

            model.addAttribute("msg", "이메일이 없습니다");
            System.out.println(request.getAttribute("msg"));
            return "/idpwalert";
        }
        if(member != null){

            model.addAttribute("msg", "아이디는 : " + member.getUser_id() + " 입니다");
            System.out.println(request.getAttribute("msg"));
            return "/idpwalert";
        }
        return "/member/serch";
    }
    @RequestMapping(value = "/pwserch", method = RequestMethod.POST)
    public String pwserchPost(HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, Model model)throws Exception{
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        MemberDTO pDTO = new MemberDTO();
        pDTO.setUser_id(user_id);
        HttpSession session = request.getSession();
        MemberDTO member = memberService.serchpw(pDTO);
        session.setAttribute("memberDTO", member);
        if(member == null){

            model.addAttribute("msg", "등록된 아이디가 없습니다");
            System.out.println(request.getAttribute("msg"));
            return "/idpwalert";
        }
        if(member != null){

            model.addAttribute("msg", "비밀번호는 : " + member.getUser_pw() + " 입니다");
            System.out.println(request.getAttribute("msg"));
            return "/idpwalert";
        }
        return "/member/serch";
    }
    @RequestMapping(value = "/userlogin.do", method = RequestMethod.POST)
    public String userloginPOST(HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {

        /* logger.info("memberIdChk() 진입"); */


        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String user_pw = CmmUtil.nvl(request.getParameter("user_pw"));



        MemberDTO pDTO = new MemberDTO();

        pDTO.setUser_id(user_id);
        pDTO.setUser_pw(user_pw);



        /*
         * 게시글 등록하기위한 비즈니스 로직을 호출
         */
        HttpSession session = request.getSession();
        MemberDTO member = memberService.userlogin(pDTO);
        if(member == null){

            model.addAttribute("msg", "아이디나 비밀번호가 잘못되었습니다");
            System.out.println(request.getAttribute("msg"));
            return "/alertlogin";
        }
        session.setAttribute("memberDTO", member);

        return "redirect:/main?" + (user_id);
    }
    @RequestMapping(value="/deleteuser")
    public String deleteuser(MemberDTO memberDTO, HttpSession session, RedirectAttributes rttr) throws Exception{
        memberService.deleteuser(memberDTO);
        session.invalidate();
        rttr.addFlashAttribute("msg", "삭제되었습니다");
        return "/alert";
    }
    @RequestMapping(value = "/emailck", method = RequestMethod.POST)
    @ResponseBody
    public String emailckPOST(String user_email) throws Exception{

        /* logger.info("memberIdChk() 진입"); */



        int result = memberService.emailck(user_email);



        if(result != 0) {

            return "fail";	// 중복 아이디가 존재

        } else {

            return "success";	// 중복 아이디 x

        }

    }



}
