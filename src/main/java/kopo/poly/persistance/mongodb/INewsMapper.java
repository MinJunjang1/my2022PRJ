package kopo.poly.persistance.mongodb;

import kopo.poly.dto.NewsDTO;

import java.util.List;

public interface INewsMapper {

int newscrowl(List<NewsDTO> pList, String colNm);
}
