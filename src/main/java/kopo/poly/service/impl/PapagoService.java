package kopo.poly.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.PapagoDTO;
import kopo.poly.service.IPapagoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.NetworkUtil;
import org.springframework.beans.factory.annotation.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service("PapagoService")
public class PapagoService implements IPapagoService {

    @Value("${naver.papago.clientId}")
    private String clientId;

    @Value("${naver.papago.clientSecret}")
    private String clientSecret;

    private Map<String, String > setNaverInfo(){
        Map<String, String> requestHeader = new HashMap<>();
        requestHeader.put("X-Naver-Client-Id", clientId);
        requestHeader.put("X-Naver-Client-Secret", clientSecret);

        log.info("clientId", clientId);
        log.info("clientSecret", clientSecret);

        return requestHeader;
    }

    @Override
    public PapagoDTO detectLangs(PapagoDTO pDTO) throws Exception {
        log.info(this.getClass().getName()+ "detectLangs Start");
        String text = CmmUtil.nvl(pDTO.getText());

        String param = "query=" + URLEncoder.encode(text, "UTF-8");

        String json = NetworkUtil.post(IPapagoService.detectLangsApiURL, this.setNaverInfo(), param);

        log.info("json : " + json);

        PapagoDTO rDTO = new ObjectMapper().readValue(json,PapagoDTO.class);
        rDTO.setText(text);
        log.info(this.getClass().getName()+"detectLangs Start");

        return rDTO;
    }
}
