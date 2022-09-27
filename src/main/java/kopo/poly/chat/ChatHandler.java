package kopo.poly.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.Chat2DTO;
import kopo.poly.dto.PapagoDTO;
import kopo.poly.service.impl.PapagoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.*;

@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
    @Autowired
    private PapagoService PapagoService;
    private static Set<WebSocketSession> clients = Collections.synchronizedSet(new LinkedHashSet<>());

    public static Map<String, String> roomInfo = Collections.synchronizedMap(new LinkedHashMap<>());

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception{
        log.info(this.getClass().getName() + "afterConnectionEstablished Start");
        String roomName = CmmUtil.nvl((String) session.getAttributes().get("roomName"));
        String userName = CmmUtil.nvl((String) session.getAttributes().get("userName"));
        String roomNameHash = CmmUtil.nvl((String) session.getAttributes().get("roomNameHash"));

        log.info("roomName : "  + roomName);
        log.info("userName : " + userName);
        log.info("roomNameHash : " + roomNameHash);

        clients.forEach(s -> {

            if(roomNameHash.equals(s.getAttributes().get("roomNameHash"))){
                try {
                    Chat2DTO cDTO = new Chat2DTO();
                    cDTO.setName("관리자");
                    cDTO.setMsg(userName + "님이 " + roomName + " 채팅방에 입장하였습니다");
                    cDTO.setDate(DateUtil.getDateTime("yyyy-MM-dd hh:mm:ss"));

                    String json = new ObjectMapper().writeValueAsString(cDTO);
                    log.info("json : " + json );

                    TextMessage chatMsg = new TextMessage(json);
                    s.sendMessage(chatMsg);

                    cDTO = null;
                } catch (IOException e){
                    log.info("Error : " + e);
                }
            }
        });

        if (!clients.contains(session)){
            clients.add(session);
            roomInfo.put(roomName, roomNameHash);
            log.info(roomName, roomNameHash);
            log.info("session open : " + session);
        }

        log.info(this.getClass().getName() + " .afterConnectionEstablished End!");

    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws  Exception{

        log.info(this.getClass().getName() + ".handleTextMessage Start!");

        String roomName = CmmUtil.nvl((String) session.getAttributes().get("roomName"));
        String userName = CmmUtil.nvl((String) session.getAttributes().get("userName"));
        String roomNameHash = CmmUtil.nvl((String) session.getAttributes().get("roomNameHash"));

        log.info("roomName : "  + roomName);
        log.info("userName : " + userName);
        log.info("roomNameHash : " + roomNameHash);

        String msg = CmmUtil.nvl(message.getPayload());
        log.info("msg : " + msg);

        Chat2DTO cDTO = new ObjectMapper().readValue(msg, Chat2DTO.class);

        cDTO.setDate(DateUtil.getDateTime("yyyy-MM-dd hh:mm:ss"));

        String sendMsg = CmmUtil.nvl(cDTO.getMsg());
        log.info("sendMsg : " + sendMsg);

        PapagoDTO pDTO = new PapagoDTO();
        pDTO.setText(sendMsg);

        PapagoDTO rDTO = PapagoService.translate(pDTO);
        if(rDTO == null){
            rDTO = new PapagoDTO();
        }

        pDTO = null;

        String translatedText = CmmUtil.nvl(rDTO.getTranslatedText());
        String scrLangType = CmmUtil.nvl(rDTO.getScrLangType());
        String tarLangType = CmmUtil.nvl(rDTO.getTarLangType());
        log.info("translatedText : " + translatedText);
        log.info("scrLangType : " + scrLangType);
        log.info("tarLangType : "+ tarLangType);

        sendMsg = "(원문)" + sendMsg;

        if(tarLangType.equals("en")){
            sendMsg += "=> (영어 영작) " + translatedText;
        }else if(tarLangType.equals("ko")){
            sendMsg += "=> (한국어 번역) " + translatedText;
        }
        cDTO.setMsg(sendMsg);

        String json = new ObjectMapper().writeValueAsString(cDTO);
        log.info("json : " + json);

        clients.forEach(s -> {

            if (roomNameHash.equals(s.getAttributes().get("roomNameHash"))) {
                try {
                    TextMessage chatMsg = new TextMessage(json);
                    s.sendMessage(chatMsg);
                } catch (IOException e) {
                    log.info("Error : " + e);
                }
            }
        });

        log.info(this.getClass().getName() + ".handleTextMessage End!");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
        log.info(this.getClass().getName()+ "afterConnectClosed Start");
        String roomName = CmmUtil.nvl((String) session.getAttributes().get("roomName"));
        String userName = CmmUtil.nvl((String) session.getAttributes().get("userName"));
        String roomNameHash = CmmUtil.nvl((String) session.getAttributes().get("roomNameHash"));

        log.info("roomName : "  + roomName);
        log.info("userName : " + userName);
        log.info("roomNameHash : " + roomNameHash);

        clients.remove(session);
        clients.forEach(s -> {

            if(roomNameHash.equals(s.getAttributes().get("roomNameHash"))){
                try {
                    Chat2DTO cDTO = new Chat2DTO();
                    cDTO.setName("관리자");
                    cDTO.setMsg(userName + "님이 " + roomName + " 채팅방에 퇴장하였습니다");
                    cDTO.setDate(DateUtil.getDateTime("yyyy-MM-dd hh:mm:ss"));

                    String json = new ObjectMapper().writeValueAsString(cDTO);
                    log.info("json : " + json );

                    TextMessage chatMsg = new TextMessage(json);
                    s.sendMessage(chatMsg);

                    cDTO = null;
                } catch (IOException e){
                    log.info("Error : " + e);
                }
            }
        });
        log.info(this.getClass().getName()+ "afterConnectClosed End!");
    }
}

