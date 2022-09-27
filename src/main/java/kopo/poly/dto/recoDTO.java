package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class recoDTO {

    private int recomet_seq;
    private int comet_seq;
    private int bno;
    private String recowriter;
    private String reco_content;
    private Date recoregdate;
}
