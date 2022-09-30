package kopo.poly.persistance.mapper;

import kopo.poly.dto.Criteria;
import kopo.poly.dto.recoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IrecoMapper {


    public void recoin(recoDTO recoDTO) throws Exception;


    int getrecoTotal(Criteria cri);
    List<recoDTO> getrecoList(int comet_seq);

    List<recoDTO> getrecoListPaging(Criteria cri);

    List<recoDTO> getrecoPage(int reco_seq);

    public List<recoDTO> getReplyList(Criteria cri);

    public int getReplytotal (int bno);

    List<recoDTO> getrecoList2(recoDTO pDTO);
    int deletereco (recoDTO recoDTO);
}
