package kopo.poly.service;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.chatDTO;

import java.util.List;

public interface IChatService {


   public void insertChat(chatDTO chatDTO);

    int getcTotal(Criteria cri);
    List<chatDTO> getList(int bno);

    List<chatDTO> getcListPaging(Criteria cri);

    List<chatDTO> getcPage(int comet_seq);

   public int deletechat(chatDTO chatDTO);

   public int updatechat(chatDTO chatDTO);

   public chatDTO getupdatechat(int comet_seq);

    void updatec(chatDTO cDTO) throws Exception;


}

