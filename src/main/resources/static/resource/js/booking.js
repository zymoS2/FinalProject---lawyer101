        let bookingTimeVal = "";

        let thisMonth = new Date(); //이번 달 (페이지 로드시 보여줌)
        let today = new Date() ;//오늘 시간

        function showCalendar(){
            let firstDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth(),1);
            let lastDate = new Date(thisMonth.getFullYear(), thisMonth.getMonth()+1, 0);


            document.getElementById("calYear").innerText = thisMonth.getFullYear();
            document.getElementById("calMonth").innerText = thisMonth.getMonth() + 1;

            let tbody_Calendar = document.querySelector(".Calendar > tbody");


            while (tbody_Calendar.rows.length > 0) {                        // 이전 달 출력결과가 남아있는 경우 초기화
               tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가

            for (let j = 0; j < firstDate.getDay(); j++) {      // 일요일 이후 요일이 올 경우, 그 빈 칸 수 만큼.
              let nowColumn = nowRow.insertCell();                 // 빈칸 추가
          }

            for (let calDay = firstDate; calDay <= lastDate; calDay.setDate(calDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복
               let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
               nowColumn.innerText = plusZero(calDay.getDate());      // 추가한 열에 날짜 입력

               if (calDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
                   nowColumn.style.color = "#DC143C";
               }
               if (calDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
                   nowColumn.style.color = "#0000CD";
                   nowRow = tbody_Calendar.insertRow();    // 새로운 행 바꿈
               }

               if (calDay < today) {                       // 지난날인 경우
                   nowColumn.className = "pastDay";
               } else if (calDay.getFullYear() == today.getFullYear() && calDay.getMonth() == today.getMonth() && calDay.getDate() == today.getDate()) { // 오늘인 경우
                   nowColumn.className = "today";

                   let nowDt = dateFormat(calDay);
                   console.log(nowDt);

                   nowColumn.onclick = function () { choiceDate(this,nowDt); }

               } else {                                      // 미래인 경우
                   nowColumn.className = "futureDay";
                   let nowDt = dateFormat(calDay);
                   console.log(nowDt);

                 nowColumn.onclick = function () { choiceDate(this,nowDt); }
               }
            }
        }
        // 날짜 선택
        function choiceDate(nowColumn,nowDt) {
            if (document.getElementsByClassName("selectThatDay")[0]) {                              // 기존에 선택한 날짜가 있으면
                document.getElementsByClassName("selectThatDay")[0].classList.remove("selectThatDay");  // 해당 날짜의 class 제거
            }
            nowColumn.classList.add("selectThatDay");           // 선택된 날짜에 class 추가


            $(document).on('click', '.selectThatDay', function() {
                 $("input[name='bookingDate']").val(nowDt);

            })

           //예약된 목록 비활성화 하기 위한 처리.
            $.ajax({
                url: "/booking/getTimeByDate",
                method: "POST",
                dataType:"json",
                data: {"selectDate": nowDt},
                success: function (data) {
                        let html ="";
                        data.forEach(element => {



                        if( element < 12 ) {
                          html += "<li class='time d-inline-block bg-body-tertiary text-center p-3 me-2' value='"+element+"'>"
                               + "<small class='d-block'>오전</small>"
                               + "<small class='d-block'>" + element + ":00</small>"
                               + "</li>"
                        } else {
                          html += "<li class='time d-inline-block bg-body-tertiary text-center p-3 me-2' value='"+element+"'>"
                                  + "<small class='d-block'>오후</small>"
                                  + "<small class='d-block'>" + element + ":00</small>"
                                  + "</li>"
                        }
                    })

                    $(".times").replaceWith("<div class='times'>"+html+"</div>")
                    //$('.times').append(html);

                },
                error : function(){
                    console.log("통신 실패!");
                }
            })

        }

        // 이전달 버튼 클릭
        function prevCalendar() {
            thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() - 1, thisMonth.getDate());   // 현재 달을 1 감소
            showCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            thisMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1, thisMonth.getDate());   // 현재 달을 1 증가
            showCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function plusZero(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }

        function dateFormat(calDay) {
             let dateYear = calDay.getFullYear() ;
             let dateMonth = calDay.getMonth()+1;
             let dateDay = calDay.getDate();
             let nowDt = "";

             if(dateMonth<10) {
                nowDt += dateYear + "-0" + dateMonth;
             } else {
                nowDt += dateYear + "-" + dateMonth;
             }

             if(dateDay<10) {
                nowDt += "-0" + dateDay;
             } else {
                nowDt += "-" + dateDay;
             }

           return nowDt;
        }

         $(document).on('click','.time',function(){
             $('.time').each(function(index, item) {
                 $(item).removeClass('active');
             })
                var time = $(this).attr('value');
                    console.log(time);
                bookingTimeVal = $("input[name='bookingTime']").val(time);
                $(this).addClass('active');

                if (bookingTimeVal !== '') {
                      $('#goCounselbtn').removeAttr("disabled");
                }else {
                      $('#goCounselbtn').attr('disabled', 'disabled');
                }
         });

         $(document).ready(function() {
                         $('#goCounselbtn').attr('disabled', 'disabled');

          });