package kopo.poly.persistance.mongodb.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import kopo.poly.model.ChatMessage;
import kopo.poly.model.MessageType;
import kopo.poly.persistance.mongodb.AbstractMongoDBComon;
import kopo.poly.persistance.mongodb.IchatingMapper;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.bson.Document;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Slf4j
@Component("chatingMapper")
public class chatingMapper extends AbstractMongoDBComon implements IchatingMapper {

    @Override
    public int insertChat(ChatMessage pDTO, String Key) throws Exception {
        log.info(Key);
        int res = 0;

        if (pDTO == null) {
            pDTO = new ChatMessage();
        }

        // 데이터를 저장할 컬렉션 생성
        super.createCollection(Key, "collectTime");

        // 저장할 컬렉션 객체 생성
        MongoCollection<Document> col = mongodb.getCollection(Key);

        // 레코드 한개씩 저장하기
        col.insertOne(new Document(new ObjectMapper().convertValue(pDTO, Map.class)));

        res = 1;



        return res;
    }

    @Override
    public int insertJoin(ChatMessage pDTO, String Key) throws Exception {

        int res = 0;

        if (pDTO == null) {
            pDTO = new ChatMessage();
        }

        // 데이터를 저장할 컬렉션 생성
        super.createCollection(Key, "collectTime");

        // 저장할 컬렉션 객체 생성
        MongoCollection<Document> col = mongodb.getCollection(Key);

        // 레코드 한개씩 저장하기
        col.insertOne(new Document(new ObjectMapper().convertValue(pDTO, Map.class)));

        res = 1;



        return res;
    }

    @Override
    public List<ChatMessage> fetchChat(String Key) throws Exception {

        List<ChatMessage> rList = new ArrayList<>();

        MongoCollection<Document> col = mongodb.getCollection(Key);


        Document projection = new Document();
        projection.append("type", "$type");
        projection.append("sender", "$sender");
        projection.append("content", "$content");
        FindIterable<Document> rs = col.find(new Document()).projection(projection);
        for (Document doc : rs) {
            if (doc == null) {
                doc = new Document();

            }

            // 조회 잘되나 출력해 봄
            String type = CmmUtil.nvl(doc.getString("type"));
            String sender = CmmUtil.nvl(doc.getString("sender"));
            String content = CmmUtil.nvl(doc.getString("content"));


            ChatMessage rDTO = new ChatMessage();
            rDTO.setType(MessageType.valueOf(type));
            rDTO.setContent(content);
            rDTO.setSender(sender);

            // 레코드 결과를 List에 저장하기
            rList.add(rDTO);

        }

        return rList;
    }
}