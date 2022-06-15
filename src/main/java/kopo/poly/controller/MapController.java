package kopo.poly.controller;

import kopo.poly.dto.apiDTO;
import kopo.poly.service.IMapService;
import kopo.poly.util.DetailData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


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
public class MapController {
    @Resource(name = "MapService")
    private IMapService mapService;

    /**
     * GetMapping은 GET방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * PostMapping은 POST방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * GetMapping(value = "index") =>  GET방식을 통해 접속되는 URL이 index인 경우 아래 함수를 실행함
     */
    @GetMapping(value = "index")
    public String Index() {
        return "/index";

    }

    @GetMapping(value = "map")
    public String apimap(HttpServletRequest request, Model model) throws Exception{
        String region_code = request.getParameter("region_code");
        String ym = request.getParameter("ym");

        List<apiDTO> rList = DetailData.main(region_code, ym);
        model.addAttribute("rList", rList);

        return "/map";
    }

}
