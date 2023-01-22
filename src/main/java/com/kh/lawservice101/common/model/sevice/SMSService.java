package com.kh.lawservice101.common.model.sevice;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class SMSService {

    @Value("${coolsms.api.key}")
    private String apiKey;

    @Value("${coolsms.api.secret}")
    private String apiSecret;

    @Value("${coolsms.api.fromnumber}")
    private String fromNumber;

    public void certifiedPhoneNumber(String toNumber, int randomNumber) {
        String api_key = apiKey; // API KEY 값
        String api_secret = apiSecret; // API Secret 값
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<>();
        params.put("to",toNumber); // 수신전화번호
        params.put("from", fromNumber); // 발신전화번호
        params.put("type", "SMS");
        params.put("text", "[리뷰 서비스 101] 인증번호 "+randomNumber+" 를 입력하세요.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }
}
