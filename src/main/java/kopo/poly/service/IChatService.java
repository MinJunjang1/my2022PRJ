package kopo.poly.service;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.chatDTO;

import java.util.List;

public interface IChatService {


   public void insertChat(chatDTO chatDTO);

    int getTotal(Criteria cri);
    List<chatDTO> getList(int bno);

    List<chatDTO> getListPaging(Criteria cri);

    List<chatDTO> getPage(int comet_seq);

   public int deletechat(chatDTO chatDTO);

}

