package kopo.poly.service;


import kopo.poly.dto.Criteria;
import kopo.poly.dto.recoDTO;
import kopo.poly.dto.recopageDTO;

import java.util.List;

public interface IrecoService {


    public void recoin(recoDTO recoDTO) throws Exception;

    int getrecoTotal(Criteria cri);
    List<recoDTO> getrecoList(int comet_seq);

    List<recoDTO> getrecoListPaging(Criteria cri);

    List<recoDTO> getrecoPage(int reco_seq);

    public recopageDTO replyList(Criteria cri);

}

