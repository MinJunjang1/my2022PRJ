package kopo.poly.persistance.mongodb.impl;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class NewsMapper {

/*@Override
public int newscrowl(List<NewsDTO> pList, String colNm) throws Exception{
    log.info(this.getClass().getName() + "newsmapper START!");
    int res = 0;
    if(pList == null){
        pList = new LinkedList<>();

    }
    super.createCollection(colNm, "collectTime");

    MongoCollection<Document> col = mongodb.getCollection(colNm);

    List<Document> list = new ArrayList<>();

    pList.stream().forEach(news -> list.add(new Document(new ObjectMapper().convertValue(news, Map.class))));
    col.insertMany(list);
    res = 1;

    return res;
}*/
}
