package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.logging.Logger;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
    private static final Logger logger = (Logger) LoggerFactory.getLogger(AdminController.class);

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public void adminmainpage() throws Exception{
        logger.info("과리자페이지 이동");
    }
}
