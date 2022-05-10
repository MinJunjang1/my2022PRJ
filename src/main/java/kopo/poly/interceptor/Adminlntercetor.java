package kopo.poly.interceptor;

import kopo.poly.dto.MemberDTO;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Adminlntercetor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();

        MemberDTO memberDTO = (kopo.poly.dto.MemberDTO) session.getAttribute("member");

        if (memberDTO == null || memberDTO.getAdminCk() == 0) {    // 관리자 계정 아닌 경우

            response.sendRedirect("/main");    // 메인페이지로 리다이렉트

            return false;

        }

        return true;
    }
}

