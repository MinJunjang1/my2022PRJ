package kopo.poly.controller;

import com.sun.org.apache.xml.internal.serializer.AttributesImplSerializer;
import kopo.poly.dto.MemberDTO;
import kopo.poly.service.IMemberService;
import kopo.poly.util.CmmUtil;
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

        log.info(user_id);
        log.info(user_pw);
        log.info(user_email);
        log.info(user_addr1);
        log.info(user_addr2);
        log.info(user_addr3);


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

    //getMapping 값 겹치지않기
    @GetMapping(value = "/join")
    public String joinpage() throws Exception {
    return "/member/join";
     }
    @GetMapping(value = "/header")
    public String headerpage() throws Exception {
        return "/member/header";
    }
    @GetMapping(value = "/login")
    public String loginpage() throws Exception {
        return "/member/login";
    }
    @GetMapping(value = "/join1")
    public String joinpage1() throws Exception {
        return "/member/join1";
    }
    @GetMapping(value = "/main")
    public String mainpage() throws Exception {
        return "/member/main";
    }

    @GetMapping(value = "/userlist")
    public String userList(ModelMap model)
            throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".userList start!");

        List<MemberDTO> mList = memberService.getuserList();

        if (mList == null) {
            mList = new ArrayList<>();

        }

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("mList", mList);

        // 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".userList end!");

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

    @RequestMapping(value = "/userlogin.do", method = RequestMethod.POST)
    public String userloginPOST(HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {

        /* logger.info("memberIdChk() 진입"); */


        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String user_pw = CmmUtil.nvl(request.getParameter("user_pw"));


        log.info(user_id);
        log.info(user_pw);


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
            return "/member/login";
        }
        if(member != null){

            model.addAttribute("msg", "로그인되었습니다");
            System.out.println(request.getAttribute("msg"));
        }
        session.setAttribute("memberDTO", member);
        return "redirect:/main";
    }


}
