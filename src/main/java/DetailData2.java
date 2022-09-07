/*
import kopo.poly.dto.apiDTO;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class DetailData2 {
    public static int INDENT_FACTOR = 4;
    public static void main(String args[]) throws MalformedURLException,
            IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL("https://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst?serviceKey=ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D&LAWD_CD&numOfRows=1&pageNo=1&regId=11A00101").openConnection();
        conn.connect();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
        StringBuffer st = new StringBuffer();
        String line;
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }

        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
        System.out.println(jsonPrettyPrintString);


        String json =(jsonPrettyPrintString);

        JSONObject json2Object = new JSONObject(json);
        JSONObject object = (JSONObject) json2Object.get("response");
        JSONObject Array1 = (JSONObject) object.get("body");
        JSONObject Array2 = (JSONObject) Array1.get("items");
        JSONArray Array3 = (JSONArray) Array2.get("item");

        System.out.println("Object to String : " + json2Object.get("response").toString());
        System.out.println("body : " + object.get("body"));
        System.out.println("Array1 : " + Array1.get("items"));
        System.out.println("Array2 : " + Array2.get("item"));
        System.out.println("Array3 : " + Array3.get(0));
        for(int i = 0; i <= Array3.length()-1; i++) {
            JSONObject apiobj = (JSONObject) Array3.get(i);
            String region_code = String.valueOf((Integer) apiobj.get("지역코드"));
            String Dong = (String)apiobj.get("법정동");
            String Jiburn = (String)apiobj.get("지번");
            String Apartment_Name = (String)apiobj.get("아파트");
            int Deal_Amount = (Integer)apiobj.get("거래금액");
            List<apiDTO> aList = new ArrayList<>();

            apiDTO aDTO = new apiDTO();
            aDTO.setRegional_Code(region_code);
            aDTO.setDong(Dong);
            aDTO.setJiburn(Jiburn);
            aDTO.setApartment_Name(Apartment_Name);
            aDTO.setDeal_Amount(String.valueOf(Deal_Amount));

            aList.add(aDTO);
            aDTO = null;

        }
    }

}

*/
