package kopo.poly.util;


import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

public class dalor {
        public static void main(String[] args) {
            final String inflearnUrl = "https://land.naver.com/news/expertColumn.naver";
            Connection conn = Jsoup.connect(inflearnUrl);

            try {
                Document document = conn.get();
                Elements imageUrlElements = document.getElementsByClass("title");

                for (Element element : imageUrlElements) {
                    System.out.println(element);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
}
