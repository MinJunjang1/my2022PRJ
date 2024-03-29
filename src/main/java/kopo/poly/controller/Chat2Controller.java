package kopo.poly.controller;

import kopo.poly.chat.ChatHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Set;

@Slf4j
@Controller
@RequestMapping(value = "/chat")
public class Chat2Controller {

    @RequestMapping(value = "intro")
    public String intro(){
        return "/chat/intro";
    }

    @RequestMapping(value = "room")
    public String room(){
        return "/chat/chatroom";
    }

    @RequestMapping(value = "roomList")
    @ResponseBody
    public Set<String> roomList(){

        log.info(this.getClass().getName() + "roomList Start!");
        log.info(this.getClass().getName() + "roomList Ends!");

        return ChatHandler.roomInfo.keySet();
    }
}
