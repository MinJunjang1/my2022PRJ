package kopo.poly.model;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ChatMessage {
    private MessageType type;
    private String content; //내용
    private String sender;  //보내는 사람
    private String roomid;
    public String getRoomid() {return roomid;}
    public void setRoomid(String roomid){this.roomid = roomid}

    public MessageType getType() {
        return type;
    }

    public void setType(MessageType type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }
}
