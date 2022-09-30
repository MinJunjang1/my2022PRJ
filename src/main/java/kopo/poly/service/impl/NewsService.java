package kopo.poly.service.impl;

import kopo.poly.dto.News2DTO;
import kopo.poly.dto.NewsDTO;
import kopo.poly.service.INewsService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Slf4j
@Service("NewsService")
public class NewsService implements INewsService {


    @Override
    public List<NewsDTO> newscrowl() throws Exception {
        log.info(this.getClass().getName()+"newcrowl Start");
        int res = 0;
        List<NewsDTO> pList = new LinkedList<>();

        String url = "https://land.naver.com/news/expertColumn.naver";

        Document doc = Jsoup.connect(url).get();

        Elements element = doc.select("td.title");

        for (Element newsinfo : element.select("td.title")){
            String href = CmmUtil.nvl(newsinfo.getElementsByAttribute("href").attr("href"));
            String newstitle = CmmUtil.nvl(newsinfo.select("a").text());
            String newsdate = CmmUtil.nvl(newsinfo.select("span.date").text());
            log.info("href = " + href);
            log.info(newstitle);
            log.info(newsdate);

               NewsDTO nDTO = new NewsDTO();
               nDTO.setCollettime(DateUtil.getDateTime("yyyyMMdd"));
               nDTO.setNewstitle(newstitle);
               nDTO.setNewsdate(newsdate);
               nDTO.setHref(href);

               pList.add(nDTO);

        }
        String colNm = "NEWS_" + DateUtil.getDateTime("yyyyMMdd");
        log.info(String.valueOf(pList));
        return pList;
    }

    @Override
    public List<News2DTO> newscrowl2(String newshref) throws Exception {
        log.info(this.getClass().getName()+"newcrowl Start");
        int res = 0;

        List<News2DTO> p2List = new LinkedList<>();

        String url = "https://land.naver.com" + newshref;

        Document doc = Jsoup.connect(url).get();

        Elements element = doc.select("div.view_area");

        for (Element newsinfo2 : element.select("div.view_area")){

            String title = CmmUtil.nvl(newsinfo2.select("h3").text());
            String summary = CmmUtil.nvl(newsinfo2.select("strong").text());
            String imgsrc = CmmUtil.nvl(newsinfo2.getElementsByAttribute("src").attr("src"));
            String contents = CmmUtil.nvl(newsinfo2.select("p").text());

            log.info(title);
            log.info(summary);
            log.info(imgsrc);
            log.info(contents);

            News2DTO n2DTO = new News2DTO();
            n2DTO.setTitle(title);
            n2DTO.setSummary(summary);
            n2DTO.setImgsrc(imgsrc);
            n2DTO.setContent(contents);

            p2List.add(n2DTO);

        }
        String colNm = "NEWS_" + DateUtil.getDateTime("yyyyMMdd");
        log.info(String.valueOf(p2List));
        return p2List;
    }

}
