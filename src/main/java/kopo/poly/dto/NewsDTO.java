package kopo.poly.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@JsonInclude(JsonInclude.Include.NON_DEFAULT)
@Data
public class NewsDTO {
 String newstitle;
 String newsdate;
 String collettime;
 String href;
 int newscnt;
}
