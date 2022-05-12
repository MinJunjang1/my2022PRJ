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
        String adminck = String.valueOf(mDTO.getAdminCk());

        log.info(adminck);
            if(adminck == "0"){
            model.addAttribute("msg", "권한이 없는 사용자입니다");
                return "redirect:/main";
            }
        return "/admin/main";
    }



}
