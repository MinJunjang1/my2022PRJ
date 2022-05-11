package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping(value = "/main")
    public String mainpage() throws Exception {
        return "/admin/main";
    }
    @GetMapping(value = "/userlist")
    public String userlistpage() throws Exception {
        return "/admin/userlist";
    }


}
