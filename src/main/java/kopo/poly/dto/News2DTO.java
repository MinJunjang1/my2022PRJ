package kopo.poly.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@JsonInclude(JsonInclude.Include.NON_DEFAULT)
@Data
public class News2DTO {
 String title;
 String summary;
 String imgsrc;
 String content;
 int news2cnt;
}
