package com.kh.lawservice101.refund.model.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.URL;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class RefundServiceImpl implements RefundService {


    @Override
    public String getToken() throws IOException {
        HttpsURLConnection conn = null;

        URL url = new URL("https://api.iamport.kr/users/getToken");

        conn = (HttpsURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setDoOutput(true);
        JsonObject json = new JsonObject();

        json.addProperty("imp_key", "1548401157108344");
        json.addProperty("imp_secret", "A8uzxb0JZbSQqovNButHMUZMqmaWzxX95AVFKlFCK8sywCPFtM5JNEjl4Tr2xGj6wyuZVxyeWExDAsNA");

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

        bw.write(json.toString());
        bw.flush();
        bw.close();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

        Gson gson = new Gson();

        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

        System.out.println(response);

        String token = gson.fromJson(response, Map.class).get("access_token").toString();

        br.close();
        conn.disconnect();

        return token;
    }

    @Override
    public void paymentCancle(String access_token, String merchanUid, String impUid,  int productPrice) throws IOException {

        System.out.println("결제 취소");
        System.out.println("서비스에서 access_token : "+ access_token);
        System.out.println("서비스에서 impUid : "+impUid);

        //검증...?
        //payment 테이블에 있는건지 확인하는 메서드 만들기!
        //1.payment DB에 결제 내역 확인하고
        //2.환불 하면 -> DB에서 결제 상태를 바꾸고
        //3. 예약/상담 목록 지우는거.
        //4. 돈은?


        HttpsURLConnection conn = null;
        URL url = new URL("https://api.iamport.kr/payments/cancel");

        conn = (HttpsURLConnection) url.openConnection();

        conn.setRequestMethod("POST");

        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", access_token);

        conn.setDoOutput(true);

        JsonObject json = new JsonObject();

        json.addProperty("impUid", impUid);
        json.addProperty("merchanUid", merchanUid);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

        bw.write(json.toString());
        bw.flush();
        bw.close();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

        br.close();
        conn.disconnect();
    }







}
