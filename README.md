# 법률서비스101

### 🤔아이디어 선정 동기

살면서 겪는 사소하거나 큰 분쟁들을 맞닥드릴 때, 우리는 어떻게 대처하고 있을까?  
익명 사이트에 제보 아니면 지인을 통한 변호사 소개? 
이런 방식을 통한 분쟁 해결을 오히려 상황을 악화시키거나 사건의 해결을 어렵게할 수 있다.  
그 때문에 더 정확하고 전문적인 법률 서비스가 필요하다고 느꼈고, 의뢰인에게 친화적이고 다가가기 쉬운 법률 서비스를 제공하는 웹 사이트를 개발하기로 하였다.

### 🚩목표
수십개의 리뷰를 보유한 변호인에게 도움을 받을수 있는 지식IN 서비스와 무료상담으로 빠르고 쉽게 나에게 알맞은 변호사를 찾을수 있는 웹 애플리케이션 개발

### ✏️요구사항
| NO | 요구사항명 | 요구사항 상세설명 | 비고 |
| --- | --- | --- | --- |
| 1 | 로그인 | - 의뢰인, 변호사 로그인 분리 <br> - 로그인은 아이디와 비밀번호를 입력하도록 함 <br> - 의뢰인 로그인 선택시 SNS 로그인 활성화 <br> - 로그인에 실패하는 경우 실패 메시지 표시 <br> - 로그인 성공 시 홈 화면으로 이동 |  |
| 2 | SNS 로그인 | - 의뢰인은 카카오, 네이버를 이용한 회원가입 및 로그인이 가능하도록 함 | - 카카오, 네이버 로그인 |
| 3 | 아이디 찾기 | - 아이디는 가입한 이메일을 입력하여 이메일 인증을 통해 찾을수 있도록 함 |  |
| 4 | 비밀번호 찾기 | - 비밀번호는 가입한 이메일과 아이디를 입력하여 이메일 인증을 통해 찾을 수 있도록 함 |  |
| 5 | 회원가입 | <b>[공통]</b> <br> - 의뢰인, 변호사 회원가입 분리 <br> - 의뢰인 회원가입 선택시 SNS 회원가입, 인증정보 입력란 활성화 <br> - 회원가입 완료 시 로그인 창으로 이동 <br> - 아이디는 영문, 숫자 구성 6-10자로 구성 <br> - 아이디는 중복되지 않도록 함 <br> - 비밀번호는 영문, 숫자, 특수문자 포함 8-12자로 구성 <br> - 비밀번호가 일치해야 회원가입이 가능하도록 함 <br><br> <b>[의뢰인]</b> <br> - 의뢰인은 이메일, 아이디, 비밀번호, 비밀번호 재확인, 전화번호를 입력하도록 함 <br> - 올바른 전화번호를 입력해야 인증이 가능하도록 함 <br> - 전화번호 인증을 완료해야 회원가입이 가능하도록 함 <br> - 방문경로, 성별, 출생년도 선택 <br> - 추천인은 입력하지 않아도 회원가입이 가능하도록 함 <br> - 필수 약관에 동의해야 회원가입이 가능하도록 함 <br> - 14세 이상 확인란이 체크되어야 회원가입이 가능하도록 함 <br><br> <b>[변호사]</b> <br> - 변호사는 이메일, 아이디, 비밀번호, 비밀번호 재확인을 입력하도록 함 <br> - 변호사는 인증정보를 입력해야함 <br> - 인증정보는 이름, 소속사, 소속전화번호, 휴대폰번호를 올바르게 입력해야하고 출신시험을 선택해야 회원가입이 가능 <br> - 추천변호사는 이름, ID, 없음 중 선택하여 입력 <br> - 방문경로 선택 <br> - 필수 약관에 동의해야 회원가입이 가능하도록 함 |  |
| 6 | 네비게이션 슬라이드 | - 메뉴 버튼을 클릭하면 네비게이션(사이드바)이 슬라이드 되도록 함 |  |
| 7 | 검색 | <b>[공통]</b> <br> - 키워드를 입력하면 변호사 이름, 분야, 키워드가 포함되어 있는 변호사 정보를 보여줌 <br><br> <b>[상품 목록]</b> <br> - 통합, 변호사 이름, 분야, 3가지 검색 카테고리를 두어 카테고리 클릭시 카테고리에 해당하는 키워드 검색 결과를 보여줌 |  |
| 8 | 카테고리 | - 카테고리를 클릭하면 카테고리를 포함하고 있는 변호사 정보를 보여줌 <br> - 카테고리는 성범죄, 재산범죄, 교통사고/범죄, 형사절차, 폭행/협박, 명예훼손/모욕, 기타 형사범죄, 부동산/임대차, 금전/계약 문제, 민사절차, 기타 민사문제, 가족, 회사, 의료/세금/행정, IT/지식재산/금융 으로 구성|  |
| 9 | 네비게이션(사이드바) | - 네비게이션 메뉴는 변호사 찾기, 법률 지식 IN, 오픈채팅, 로그인/회원가입(로그아웃/마이페이지) 목록으로 구성 |  |
| 10 | 상품 목록 | - 변호사 정보 목록을 카드 형식으로 보여주고 해당 카드는 이름, 소속, 자기소개, 소개 태그, 상담 예약 버튼으로 구성 <br> - 상담 예약 버튼 클릭시 결제페이지로 이동 <br> - 상품은 한번에 20개씩만 보여주고 더보기 버튼 클릭시 20개씩 더 보여주도록 함 |  |
| 11 | 상품 상세보기 | - 상세보기는 변호사명, 이력, 만족도, 리뷰, 법률뉴스/영상, 법률 지식 in 답변 목록, 사무실 위치 그리고 변호사 사진과 예약하기 버튼, 즐겨찾기 버튼으로 구성 <br> - 리뷰는 투표를 통해 득표수를 % 로 보여주도록 함 <br> - 사무실 위치는 지도에 정확한 위치를 표시하도록 함 <br> - 상담 예약 버튼 클릭시 결제페이지로 이동 | - 카카오 map api → https://apis.map.kakao.com/web/ |
| 12 | 예약 | - 예약하기 <br> - 네비게이션에서 분야 카테고리, 변호사, 변호사 상담가능 날짜를 보여주도록함 <br> - 변호사 상세보기 페이지에서 해당 변호사의 상담 가능한 시간대를 선택하도록 함 <br> - 변호사와 상담 시간을 선택해야 예약을 할 수 있도록 함 <br> - 예약하기 버튼 클릭시 상담 내용 작성 페이지로 이동  |  |
| 13 | 상담 내용 작성 | - 상담 내용은 이름, 상담 내용으로 구성 <br> - 상담 내용을 반드시 입력해야 등록되도록 함 <br> - 위 사항을 확인하였는지 동의해야 결제를 할 수 있도록 함 <br> - 결제하기 클릭시 결제창 팝업 | - 아임포트 결제 api |
| 14 | 법률 지식 in | - 법률 지식 in은 카테고리, 제목, 내용, 조회수, 작성일, 태그, 변호사 답변으로 구성 <br> - 제목과 내용을 반드시 입력해야 등록되도록 함 <br> - 태그는 5개까지만 등록 가능하도록 함 <br> - 게시글은 수정 및 삭제가 가능하도록 함 <br> - 해당 글에 변호사만이 답글을 달 수 있도록 함 <br> - 답글을 반드시 입력해야 등록되도록 함 <br> - 변호사 답글은 변호사 사진, 변호사 이름, 상담 예약 버튼, 도움됐어요 버튼으로 구성  |  |
| 15 | 관심글 | - 관심글 버튼 클릭시 마이페이지에서 확인할 수 있도록 함 |  |
| 16 | 마이페이지 | <b>[의뢰인]</b> <br> - 내가 작성한 지식 in 글 갯수, 사례 즐겨찾기 갯수, 변호사 즐겨찾기 갯수로 구성 <br> - 숫자 클릭시 해당 목록 페이지로 이동 <br><br> <b>[변호사]</b> <br> - 개인정보 및 이력을 수정할 수 있도록 함 <br> - 현재 예약 현황을 캘린더로 보여줌 |  |
| 17 | 채팅 | - 변호사와 1:1 채팅으로 상담 할 수 있도록 함 |  |

### 💡주요 기능
- ✅ 1:1 채팅
- ✅ 결제 및 환불
- ✅ SNS 로그인
- ✅ 변호사 및 지식IN 목록
- ✅ 도움됐어요
- ✅ 이메일로 아이디 및 비밀번호 찾기

### ✔️ERD
<img src=/ERD/lawservice101_ERD.png>

### 🔨사용기술
<div style="display: flex; align-items: center; margin-bottom: 12px;">
<strong style="display: inline-block; margin-right: 6px;">Frontend: </strong> 
<img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=HTML5&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS3&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/JAVASCRIPT-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/jQUERY-0769AD?style=for-the-badge&logo=jQuery&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/BOOTSTRAP-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white" style="display: inline-block; margin-right: 6px;">
</div>

<div style="display: flex; align-items: center; margin-bottom: 12px;">
<strong style="display: inline-block; margin-right: 6px;">Backend: </strong> 
<img src="https://img.shields.io/badge/JAVA-5283a3?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyBzdHlsZT0iY29sb3I6IHdoaXRlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzODQgNTEyIj48IS0tISBGb250IEF3ZXNvbWUgRnJlZSA2LjEuMSBieSBAZm9udGF3ZXNvbWUgLSBodHRwczovL2ZvbnRhd2Vzb21lLmNvbSBMaWNlbnNlIC0gaHR0cHM6Ly9mb250YXdlc29tZS5jb20vbGljZW5zZS9mcmVlIChJY29uczogQ0MgQlkgNC4wLCBGb250czogU0lMIE9GTCAxLjEsIENvZGU6IE1JVCBMaWNlbnNlKSBDb3B5cmlnaHQgMjAyMiBGb250aWNvbnMsIEluYy4gLS0+PHBhdGggZD0iTTI3Ny43NCAzMTIuOWM5LjgtNi43IDIzLjQtMTIuNSAyMy40LTEyLjVzLTM4LjcgNy03Ny4yIDEwLjJjLTQ3LjEgMy45LTk3LjcgNC43LTEyMy4xIDEuMy02MC4xLTggMzMtMzAuMSAzMy0zMC4xcy0zNi4xLTIuNC04MC42IDE5Yy01Mi41IDI1LjQgMTMwIDM3IDIyNC41IDEyLjF6bS04NS40LTMyLjFjLTE5LTQyLjctODMuMS04MC4yIDAtMTQ1LjhDMjk2IDUzLjIgMjQyLjg0IDAgMjQyLjg0IDBjMjEuNSA4NC41LTc1LjYgMTEwLjEtMTEwLjcgMTYyLjYtMjMuOSAzNS45IDExLjcgNzQuNCA2MC4yIDExOC4yem0xMTQuNi0xNzYuMmMuMSAwLTE3NS4yIDQzLjgtOTEuNSAxNDAuMiAyNC43IDI4LjQtNi41IDU0LTYuNSA1NHM2Mi43LTMyLjQgMzMuOS03Mi45Yy0yNi45LTM3LjgtNDcuNS01Ni42IDY0LjEtMTIxLjN6bS02LjEgMjcwLjVhMTIuMTkgMTIuMTkgMCAwIDEtMiAyLjZjMTI4LjMtMzMuNyA4MS4xLTExOC45IDE5LjgtOTcuM2ExNy4zMyAxNy4zMyAwIDAgMC04LjIgNi4zIDcwLjQ1IDcwLjQ1IDAgMCAxIDExLTNjMzEtNi41IDc1LjUgNDEuNS0yMC42IDkxLjR6TTM0OCA0MzcuNHMxNC41IDExLjktMTUuOSAyMS4yYy01Ny45IDE3LjUtMjQwLjggMjIuOC0yOTEuNi43LTE4LjMtNy45IDE2LTE5IDI2LjgtMjEuMyAxMS4yLTIuNCAxNy43LTIgMTcuNy0yLTIwLjMtMTQuMy0xMzEuMyAyOC4xLTU2LjQgNDAuMkMyMzIuODQgNTA5LjQgNDAxIDQ2MS4zIDM0OCA0MzcuNHpNMTI0LjQ0IDM5NmMtNzguNyAyMiA0Ny45IDY3LjQgMTQ4LjEgMjQuNWExODUuODkgMTg1Ljg5IDAgMCAxLTI4LjItMTMuOGMtNDQuNyA4LjUtNjUuNCA5LjEtMTA2IDQuNS0zMy41LTMuOC0xMy45LTE1LjItMTMuOS0xNS4yem0xNzkuOCA5Ny4yYy03OC43IDE0LjgtMTc1LjggMTMuMS0yMzMuMyAzLjYgMC0uMSAxMS44IDkuNyA3Mi40IDEzLjYgOTIuMiA1LjkgMjMzLjgtMy4zIDIzNy4xLTQ2LjkgMCAwLTYuNCAxNi41LTc2LjIgMjkuN3pNMjYwLjY0IDM1M2MtNTkuMiAxMS40LTkzLjUgMTEuMS0xMzYuOCA2LjYtMzMuNS0zLjUtMTEuNi0xOS43LTExLjYtMTkuNy04Ni44IDI4LjggNDguMiA2MS40IDE2OS41IDI1LjlhNjAuMzcgNjAuMzcgMCAwIDEtMjEuMS0xMi44eiIgZmlsbD0id2hpdGUiPjwvcGF0aD48L3N2Zz4=&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/SPRING-6DB33F?style=for-the-badge&logo=Spring&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/JSP-000000?style=for-the-badge&logo=&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/MYBATIS-1e1818?style=for-the-badge&logo=&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/GRADLE-02303A?style=for-the-badge&logo=Gradle&logoColor=white" style="display: inline-block; margin-right: 6px;">
</div>

<div style="display: flex; align-items: center; margin-bottom: 12px;">
<strong style="display: inline-block; margin-right: 6px;">Database: </strong> 
<img src="https://img.shields.io/badge/ORACLE-F80000?style=for-the-badge&logo=ORACLE&logoColor=white" style="display: inline-block; margin-right: 6px;">
</div>

### ⚡Advanced Feature
#### STOMP를 이용한 1:1 채팅
WebSocket 프로토콜은 두 가지 유형의 메세지를 정의하고 있지만 그 메세지의 내용까지는 정의하고 있지 않는다.  
STOMP (Simple Text Oriented Messaging Protocol)은 메세징 전송을 효율적으로 하기 위해 탄생한 프로토콜이고, 기본적으로 pub / sub 구조로 되어있어 메세지를 전송하고 메세지를 받아 처리하는 부분이 확실히 정해져 있기 때문에 개발자 입장에서 명확하게 인지하고 개발할 수 있는 이점이 있다. 한 줄로 정의하자면, STOMP 프로토콜은 WebSocket 위에서 동작하는 프로토콜로써 클라이언트와 서버가 전송할 메세지의 유형, 형식, 내용들을 정의하는 매커니즘이다.
또한 STOMP를 이용하면 메세지의 헤더에 값을 줄 수 있어 헤더 값을 기반으로 통신 시 인증 처리를 구현하는 것도 가능하며 STOMP 스펙에 정의한 규칙만 잘 지키면 여러 언어 및 플랫폼 간 메세지를 상호 운영할 수 있다.  
  
STOMP는 TCP 또는 WebSocket 같은 양방향 네트워크 프로토콜 기반으로 동작한다. 이름에서 알 수 있듯, STOMP는 Text 지향 프로토콜이나, Message Payload에는 Text or Binary 데이터를 포함 할 수 있다.
위에서 언급한 ****pub / sub란 메세지를 공급하는 주체와 소비하는 주체를 분리해 제공하는 메세징 방법이다. 기본적인 컨셉을 예로 들자면 우체통(Topic)이 있다면 집배원(Publisher)이 신문을 우체통에 배달하는 행위가 있고, 우체통에 신문이 배달되는 것을 기다렸다가 빼서 보는 구독자(Subscriber)의 행위가 있다. 이때 구독자는 다수가 될 수 있다. pub / sub 컨셉을 채팅방에 빗대면 다음과 같다.
- **채팅방 생성**: pub / sub 구현을 위한 Topic이 생성됨
- **채팅방 입장:** Topic 구독
- **채팅방에서 메세지를 송수신**: 해당 Topic으로 메세지를 송신(pub), 메세지를 수신(sub)  

StompWebSocketConfig
```java
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
```
`@EnableWebSocketMessageBroker`: Stomp를 사용하기위해 선언하는 어노테이션  
`setApplicationDestinationPrefixes`: Client에서 SEND 요청을 처리  
`enableSimpleBroker`: 해당 경로로 SimpleBroker를 등록. SimpleBroker는 해당하는 경로를 SUBSCRIBE하는 Client에게 메세지를 전달하는 간단한 작업을 수행  
`enableStompBrokerRelay`: SimpleBroker의 기능과 외부 Message Broker( RabbitMQ, ActiveMQ 등 )에 메세지를 전달하는 기능을 가짐  

SockJS
```javascript
function connect(roomNum, userNum, userType, userCount) {
    const sockJs = new SockJS("/stomp/chat");

    //1. SockJS를 내부에 들고있는 stomp를 내어줌
    const stomp = Stomp.over(sockJs);

    //2. connection이 맺어지면 실행
    stomp.connect({}, function (){
        console.log("STOMP Connection");

    //3. send(path, header, message)로 메세지를 보낼 수 있음
    stomp.send('/pub/chat/enter', {}, JSON.stringify({chatRoomNum: roomNum, userNum: userNum, userType: userType, userCount: userCount}));

    //4. subscribe(path, callback)으로 메세지를 받을 수 있음
    stomp.subscribe("/sub/chat/room/" + roomNum, function (chat) {
        const content = JSON.parse(chat.body);

        const chatRoomNum = content.chatRoomNum;
        const writer = content.chatWriter;
        const message = content.chatContent;
        const userType = content.userType;
        const userCount = content.userCount;
        const writeTime = content.createdDate;

        let str = "";
        if(userType === "L") {
            str = $("<div class='d-flex flex-row p-3 justify-content-end' id='chat'>" +
                "<div class='mx-1 text-end'>" +
                "<div class='small text-end'>" + writer + " 변호사</div>" +
                "<div style='display: flex'>" +
                "<span class='d-inline-block mx-1 small text-secondary' style='min-width: 16%; margin-top: auto; font-size: 12px;'>" + writeTime + "</span>" +
                "<div class='bg-light mr-2 p-3 d-inline-block text-start' style='max-width: 80%; border-radius: 20px'><span class='fs-6 text-muted text-break'>" + message +"</span></div>" +
                "</div>" +
                "</div>" +
                "<img src='/display?fileName=" + "${chatRoom.chatUserVo.lawyerVo.lawyerImg}" + "' onerror=\"this.src='/resource/img/profile.png'\"; class=\"rounded-circle\" width=\"40\" height=\"40\">" +
                "</div>")
        } else {
            str = $("<div class='d-flex flex-row p-3' id='chat'>" +
                "<img src='/resource/img/profile.png' class='rounded-circle' width='40' height='40'>" +
                "<div class='mx-1'>" +
                "<div class='small'>" + writer + "</div>" +
                "<div style='display: flex'>" +
                "<div class='chat ml-2 p-3 fs-6 d-inline-block text-break' style='max-width: 80%'>" + message + "</div>" +
                "<span class='d-inline-block mx-1 small text-secondary' style='min-width: 16%; margin-top: auto; font-size: 12px;'>" + writeTime + "</span>" +
                "</div>" +
                "</div>" +
                "</div>")
        }
        $(".chat-box").append(str);

        $(".chat-room").each(function (index, item) {
            if ($(item).attr("data-num") == chatRoomNum) {
                $(item).find(".user-count").text(userCount);
            }
        });

        const max = $(".chat-scrollbar").height();
        const height = $(".chat-box").height();
        if (height > max) {
            $(".chat-scrollbar").scrollTop(height);
        }
    });
});
```

### 🔥개선사항
- Spring Security를 적용한 인증/인가 처리
- AOP를 이용한 보안, 예외처리
- 변호사 상담 가능 시간 선택
