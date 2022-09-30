package kopo.poly.service;


import kopo.poly.dto.News2DTO;
import kopo.poly.dto.NewsDTO;

import java.util.List;

public interface INewsService {


	List<NewsDTO> newscrowl() throws Exception;
	List<News2DTO> newscrowl2(String newshref) throws Exception;
}

