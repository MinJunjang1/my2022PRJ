package kopo.poly.dto;

import java.util.List;

public class recopageDTO {
    List<recoDTO> list;
    PageDTO pageInfo;
    public List<recoDTO> getList() {
        return list;
    }

    public void setList(List<recoDTO> list) {
        this.list = list;
    }

    public PageDTO getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageDTO pageInfo) {
        this.pageInfo = pageInfo;
    }

    @Override
    public String toString() {
        return "ReplyPageDTO [list=" + list + ", pageInfo=" + pageInfo + "]";
    }

}
