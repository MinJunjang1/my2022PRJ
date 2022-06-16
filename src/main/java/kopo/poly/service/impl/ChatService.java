package kopo.poly.service.impl;

import kopo.poly.dto.chatDTO;
import kopo.poly.service.IChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
@Slf4j

@Service("ChatService")
    public class ChatService implements IChatService {

    @Override
    public void insertchat(chatDTO chatDTO) {
        ChatMapper.insertchat(chatDTO);
    }



}
