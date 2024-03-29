package kopo.poly.controller;

import kopo.poly.dto.News2DTO;
import kopo.poly.dto.NewsDTO;
import kopo.poly.dto.api2DTO;
import kopo.poly.dto.apiDTO;
import kopo.poly.service.IMapService;
import kopo.poly.service.INewsService;
import kopo.poly.util.DetailData;
import kopo.poly.util.weatherapi;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Resource(name = "NewsService")
    private INewsService newsService;

    /**
     * GetMapping은 GET방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * PostMapping은 POST방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * GetMapping(value = "index") =>  GET방식을 통해 접속되는 URL이 index인 경우 아래 함수를 실행함
     */
    @GetMapping(value = "index")
    public String Index() {
        return "/index";

    }
    @RequestMapping("/test")
    public String replyAjaxTest() {
        return "/test";
    }

    @GetMapping(value = "map")
    public String apimap(HttpServletRequest request, Model model) throws Exception{
        String region_code = request.getParameter("region_code");
        String ym = request.getParameter("ym");

        List<apiDTO> rList = DetailData.main(region_code, ym);
        model.addAttribute("rList", rList);

        return "/map";
    }

    @GetMapping(value = "/weather2")
    public String apiweather(HttpServletRequest request, Model model) throws Exception{

        List<api2DTO> a2List = weatherapi.main();
        log.info(String.valueOf(a2List.get(0)));
        model.addAttribute("a2List", a2List);
        return  "/weather2";
    }
    @GetMapping(value = "/roadmap")
    public String roadmappage(HttpServletRequest request,Model model) throws Exception {
        String Dong = request.getParameter("Dong");
        String Jiburn = request.getParameter("Jiburn");
        String Name = request.getParameter("Name");
        log.info(Dong);
        log.info(Jiburn);
        log.info(Name);
        model.addAttribute("Dong",Dong);
        model.addAttribute("Jiburn",Jiburn);
        model.addAttribute("Name",Name);


        return "/roadmap";
    }
    @ResponseBody
    @GetMapping("/main/newsTitle")
    public List<NewsDTO> newsTitle (Model model)throws Exception{
        List<NewsDTO> pList = newsService.newscrowl();

        return pList;
    }

    @ResponseBody
    @GetMapping("/main/newspage")
    public List<News2DTO> newspage (HttpServletRequest request)throws Exception{
        String href = request.getParameter("href");
        log.info(href);
        List<News2DTO> p2List = newsService.newscrowl2(href);

        return p2List;
    }


}
