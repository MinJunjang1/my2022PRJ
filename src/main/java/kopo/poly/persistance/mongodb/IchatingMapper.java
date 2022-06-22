package kopo.poly.persistance.mongodb;

import kopo.poly.model.ChatMessage;

import java.util.List;

public interface IchatingMapper {





    int insertChat(ChatMessage pDTO, String Key) throws Exception;

    int insertJoin(ChatMessage pDTO, String Key) throws Exception;

    List<ChatMessage> fetchChat(String Key) throws Exception;
}