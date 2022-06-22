package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
public class chatDTO {
    private int comet_seq;
    private int bno;
    private String writer;
    private String comet_content;
    private Date regdate;

}
