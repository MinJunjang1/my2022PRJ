package kopo.poly.service.impl;

import kopo.poly.model.ChatMessage;
import kopo.poly.persistance.mongodb.IchatingMapper;
import kopo.poly.service.IchatingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
public class chatingService implements IchatingService {
    @Resource(name = "chatingMapper")
    private IchatingMapper chatingMapper;

    @Override
    public int insertChat(ChatMessage pDTO, String Key) throws Exception {
        chatingMapper.insertChat(pDTO, Key);
        return 0;
    }

    @Override
    public int insertJoin(ChatMessage pDTO, String Key) throws Exception {
        chatingMapper.insertJoin(pDTO, Key);
        return 0;
    }

    @Override
    public List<ChatMessage> fetchChat(String Key) throws Exception {

        List<ChatMessage> rList = chatingMapper.fetchChat(Key);
        return rList;
    }
}