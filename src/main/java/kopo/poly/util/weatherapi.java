package kopo.poly.util;/* Java 1.8 샘플 코드 */


import kopo.poly.dto.api2DTO;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class weatherapi {
    public static List<api2DTO> main() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B10101", "UTF-8")); /*11A00101(백령도), 11B10101 (서울), 11B20201(인천) 등... 별첨 엑셀자료 참조(‘육상’ 구분 값 참고)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
      /*  System.out.println("Response code: " + conn.getResponseCode());*/
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        /*System.out.println(sb.toString());*/

        String jsonweatherapi = sb.toString();

        JSONObject jsonweatherObj = new JSONObject(jsonweatherapi);
        JSONObject Object = (JSONObject)  jsonweatherObj.get("response");
        JSONObject Array1 = (JSONObject) Object.get("body");
        JSONObject Array2 = (JSONObject) Array1.get("items");
        JSONArray Array3 = (JSONArray) Array2.get("item");
        System.out.println(Array3);
        System.out.println(Array3.get(0));
        List<api2DTO> a2List = new ArrayList<>();
        for(int i = 0; i<= Array3.length()-1; i++){
            JSONObject api2obj = (JSONObject) Array3.get(i);
            String announceTime = String.valueOf((long)api2obj.get("announceTime"));
            String numEf =  String.valueOf((Integer) api2obj.get("numEf"));
            String regId = (String) api2obj.get("regId");
            String rnSt =  String.valueOf((Integer) api2obj.get("rnSt"));
            String rnYn =  String.valueOf((Integer) api2obj.get("rnYn"));
            String ta =  (String) api2obj.get("ta");
            String wd1 = (String) api2obj.get("wd1");
            String wd2 = (String) api2obj.get("wd2");
            String wdTnd =  (String) api2obj.get("wdTnd");
            String wf = (String) api2obj.get("wf");
            String wfCd = (String) api2obj.get("wfCd");
            String wsIt =  (String) api2obj.get("wsIt");

    /*        System.out.println(announceTime);
            System.out.println(numEf);
            System.out.println(regId);
            System.out.println(rnSt);
            System.out.println(rnYn);
            System.out.println(ta);
            System.out.println(wd1);
            System.out.println(wd2);
            System.out.println(wdTnd);
            System.out.println(wf);
            System.out.println(wfCd);
            System.out.println(wsIt);*/


            api2DTO a2DTO = new api2DTO();
            a2DTO.setAnnounceTime(announceTime);
            a2DTO.setNumEf(numEf);
            a2DTO.setRegId(regId);
            a2DTO.setRnSt(rnSt);
            a2DTO.setRnyn(rnYn);
            a2DTO.setTa(ta);
            a2DTO.setWd1(wd1);
            a2DTO.setWd2(wd2);
            a2DTO.setWdTnd(wdTnd);
            a2DTO.setWf(wf);
            a2DTO.setWfCd(wfCd);
            a2DTO.setWsIt(wsIt);

            a2List.add(a2DTO);
            a2DTO = null;

        }
        return a2List;
    }
}