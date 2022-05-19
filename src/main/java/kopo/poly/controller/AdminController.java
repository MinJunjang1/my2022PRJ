package kopo.poly.controller;

import kopo.poly.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping(value = "/main")
    public String mainpage(HttpSession session, HttpServletRequest request, MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {
        MemberDTO mDTO = (MemberDTO) session.getAttribute("memberDTO");
        int adminck = Integer.valueOf(mDTO.getAdminCk());

            System.out.println(adminck);
        if(adminck==0){
            model.addAttribute("msg", "잘못된 사용자 입니다.");
            System.out.println(request.getAttribute("msg"));
            return "/alert";
        }
        return "/admin/main";
    }
    @GetMapping(value = "/infolist")
    public String listpage() throws Exception {
        return "/admin/infolist";
    }



}
