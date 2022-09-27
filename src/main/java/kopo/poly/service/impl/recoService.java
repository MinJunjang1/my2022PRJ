package kopo.poly.service.impl;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.PageDTO;
import kopo.poly.dto.recoDTO;
import kopo.poly.dto.recopageDTO;
import kopo.poly.persistance.mapper.IrecoMapper;
import kopo.poly.service.IrecoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("recoService")
public class recoService implements IrecoService {
    @Autowired
    IrecoMapper recoMapper;

    @Override
    public void recoin(recoDTO recoDTO) throws Exception {
        recoMapper.recoin(recoDTO);
    }

    @Override
    public List<recoDTO> getrecoList(int comet_seq) {

        return recoMapper.getrecoList(comet_seq);
    }

    /* 게시판 목록(페이징 적용) */
    @Override
    public List<recoDTO> getrecoListPaging(Criteria cri) {

        return recoMapper.getrecoListPaging(cri);
    }


    /* 게시판 조회 */
    @Override
    public List<recoDTO> getrecoPage(int reco_seq) {

        return recoMapper.getrecoPage(reco_seq);
    }



    @Override
    public int getrecoTotal(Criteria cri) {

        return recoMapper.getrecoTotal(cri);
    }

    @Override
    public recopageDTO  replyList(Criteria cri){
        recopageDTO dto = new recopageDTO();
        dto.setList(recoMapper.getReplyList(cri));
        dto.setPageInfo(new PageDTO(cri, recoMapper.getReplytotal(cri.getbno())));
        return dto;
    }


}
