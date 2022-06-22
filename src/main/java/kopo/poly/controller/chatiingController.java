package kopo.poly.controller;


import kopo.poly.model.ChatMessage;
import kopo.poly.service.IchatingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
public class chatiingController {

    @Autowired
    private IchatingService chatingService;

    @Autowired
    SimpMessagingTemplate simpMessagingTemplate;

    @PostMapping("/club/chat")
    public String ClubChat(HttpServletRequest request,Model model) throws Exception{
        String roomname = request.getParameter("cName");
        String username = request.getParameter("uName");
        model.addAttribute("cName", roomname);
        model.addAttribute("uName", username);
        return "/club/chat";
    }

    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload ChatMessage chatMessage) throws Exception {
        ChatMessage pDTO = new ChatMessage();
        pDTO.setRoomid(chatMessage.getRoomid());
        pDTO.setContent(chatMessage.getContent());
        pDTO.setSender(chatMessage.getSender());
        pDTO.setType(chatMessage.getType());
        chatingService.insertChat(pDTO, chatMessage.getRoomid());
        simpMessagingTemplate.convertAndSend("/topic/"+chatMessage.getRoomid(),
                chatMessage);
    }

    @MessageMapping("/chat.addUser")
    public void addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        log.info(chatMessage.getRoomid());
        headerAccessor.getSessionAttributes().put("roomname",chatMessage.getRoomid());
        List<ChatMessage> rList = chatingService.fetchChat(chatMessage.getRoomid());
        for (int i = 0; i < rList.size(); i++) {
            chatMessage = rList.get(i);
            simpMessagingTemplate.convertAndSend("/topic/"+chatMessage.getRoomid(),
                    chatMessage);
        }
    }

}