package kopo.poly.controller;

import kopo.poly.dto.PapagoDTO;
import kopo.poly.service.IPapagoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 *
 * slf4j는 스프링 프레임워크에서 로그 처리하는 인터페이스 기술이며,
 * 로그처리 기술인 log4j와 logback과 인터페이스 역할 수행함
 * 스프링 프레임워크는 기본으로 logback을 채택해서 로그 처리함
 * */
@Slf4j
@RequestMapping(value = "papago")
@RestController
public class PapagoController {
    @Resource(name="PapagoService")
    private IPapagoService papagoService;

    @GetMapping(value = "detectLangs")
    public PapagoDTO detectLangs(HttpServletRequest request) throws Exception{
        log.info(this.getClass().getName() +"detectLangs Start");
        String text = CmmUtil.nvl(request.getParameter("text"));
        log.info("text : " + text  );

        PapagoDTO pDTO = new PapagoDTO();
        pDTO.setText(text);

        PapagoDTO rDTO = papagoService.detectLangs(pDTO);

        if(rDTO == null){
            rDTO = new PapagoDTO();
        }
        log.info(this.getClass().getName() + "detectLangs Ends");

        return rDTO;
    }

    @GetMapping(value = "translate")
    public PapagoDTO translate(HttpServletRequest request) throws Exception{
        log.info(this.getClass().getName() + "translate Start!");

        String text = CmmUtil.nvl(request.getParameter("text"));
        log.info("text : " + text);

        PapagoDTO pDTO = new PapagoDTO();
        pDTO.setText(text);

        PapagoDTO rDTO = papagoService.translate(pDTO);

        if(rDTO == null){
            rDTO = new PapagoDTO();
        }
        log.info( this.getClass().getName() + "translate End!");

        return rDTO;
    }

}
