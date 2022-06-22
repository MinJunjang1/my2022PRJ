package kopo.poly.controller;

import kopo.poly.model.ChatMessage;
import kopo.poly.service.IchatingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
@Slf4j
@Controller
public class ChatController {


        @Autowired
        private IchatingService chatingService;

        @Autowired
        SimpMessagingTemplate simpMessagingTemplate;



        @MessageMapping("/chat.sendMessage")
        @SendTo("/topic/public")
        public void sendMessage(@Payload ChatMessage chatMessage) throws Exception {
            String key = "note";
            ChatMessage pDTO = new ChatMessage();


            pDTO.setContent(chatMessage.getContent());
            pDTO.setSender(chatMessage.getSender());
            pDTO.setType(chatMessage.getType());


            chatingService.insertChat(pDTO, key);

            simpMessagingTemplate.convertAndSend("/topic/"+key,
                    chatMessage);


        }

        @MessageMapping("/chat.addUser")
        @SendTo("/topic/public")
        public void addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) throws Exception {
            headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
            String key = "note";
            List<ChatMessage> rList = chatingService.fetchChat(key);
            for (int i = 0; i < rList.size(); i++) {
                chatMessage = rList.get(i);
                simpMessagingTemplate.convertAndSend("/topic/"+key,
                        chatMessage);
            }

        }


    @GetMapping(value = "/index1")
    public String chatpage() throws Exception {
        return "/index1";
    }

}
