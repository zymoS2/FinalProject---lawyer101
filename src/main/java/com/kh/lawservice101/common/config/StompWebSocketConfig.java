package com.kh.lawservice101.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // stomp 접속 주소 url "/stomp/chat"
        registry.addEndpoint("/stomp/chat") // 연결될 엔드포인트, WebSocket 또는 SockJS Client가 웹소켓 핸드셰이크 커넥션을 생성할 경로
                .withSockJS(); // SocketJs 를 연결
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        // 메시지를 발행하는 요청 url, 메시지를 보낼 때, @Controller 객체의 @MessageMapping 메서드로 라우팅
        registry.setApplicationDestinationPrefixes("/pub");

        // 메시지를 구독하는 요청 url, 메시지를 받을 때
        // 내장된 메세지 브로커를 사용해 Client에게 Subscriptions, Broadcasting 기능을 제공
        registry.enableSimpleBroker("/sub");

    }
}
