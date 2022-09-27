package kopo.poly.service.impl;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.chatDTO;
import kopo.poly.persistance.mapper.IChatMapper;
import kopo.poly.service.IChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j

@Service("ChatService")
    public class ChatService implements IChatService {
    @Autowired
    IChatMapper Chatmapper;

    @Override
    public void insertChat(chatDTO chatDTO) {
       Chatmapper.insertChat(chatDTO);
    }
    @Override
    public List<chatDTO> getList(int bno) {

        return Chatmapper.getList(bno);
    }

    /* 게시판 목록(페이징 적용) */
    @Override
    public List<chatDTO> getcListPaging(Criteria cri) {

        return Chatmapper.getcListPaging(cri);
    }


    /* 게시판 조회 */
    @Override
    public List<chatDTO> getcPage(int comet_seq) {

        return Chatmapper.getcPage(comet_seq);
    }



    @Override
    public int getcTotal(Criteria cri) {

        return Chatmapper.getcTotal(cri);
    }
    @Override
    public int deletechat(chatDTO chatDTO){
        int result = Chatmapper.deletechat(chatDTO.getComet_seq());
        return result;
    }

    @Override
    public int updatechat(chatDTO chatDTO) {
        return 0;
    }

    @Override
    public chatDTO getupdatechat(int comet_seq) {
        return null;
    }

    @Override
    public void updatec(chatDTO cDTO) throws Exception {
        Chatmapper.updatec(cDTO);
    }

}
