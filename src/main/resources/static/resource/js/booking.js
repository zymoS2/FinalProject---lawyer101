$(function() {
    const date = new Date();
    const calendarYear = date.getFullYear(); // 달력 연도
    const calendarMonth = date.getMonth() + 1; // 달력 월
    const calendarToday = date.getDate(); // 달력 일

    const monthLastDate = new Date(calendarYear, calendarMonth, 0); 
    const calendarMonthLastDate = monthLastDate.getDate(); // 달력 월의 마지막 일
    const prevMonthLastDate = new Date(calendarYear, calendarMonth - 1, 0); // 달력 이전 월의 마지막 일
    const nextMonthStartDate = new Date(calendarYear, calendarMonth, 1); // 달력 다음 월의 시작 일
    const calendarMonthTodayDay = date.getDay(); // 달력 현재 요일

    // 주간 배열
    let arWeek = ["", "", "", "", "", "", ""];

    let weekYear = calendarYear;
    let weekMonth = calendarMonth;
    let weekDay = calendarToday;

    // 현재 요일부터 주간 배열에 날짜를 추가
    for (let index = calendarMonthTodayDay; index < 7; index++) {
        arWeek[index] = weekYear +"-" + weekMonth + "-" + weekDay;
        weekDay++;

        // 날짜가 현재 월의 마지막 일보다 크면 다음 월의 1일로 변경
        if (weekDay > calendarMonthLastDate) {
            weekYear = nextMonthStartDate.getFullYear();
            weekMonth = nextMonthStartDate.getMonth() + 1;
            weekDay = 1;
        }
    }

    weekYear = calendarYear;
    weekMonth = calendarMonth;
    weekDay = calendarToday;

    // 현재 요일부터 꺼꾸로 주간 배열에 날짜를 추가
    for (let index = calendarMonthTodayDay - 1; index >= 0; index--) {
        weekDay--;
        // 날짜가 현재 월의 1일이면 작으면 이전 월의 마지막 일로 변경
        if (weekDay == 0) {
            weekYear = prevMonthLastDate.getFullYear();
            weekMonth = prevMonthLastDate.getMonth() + 1;
            weekDay = prevMonthLastDate;
        }
        arWeek[index] = weekYear +"-" + weekMonth + "-" + weekDay;
    }

    // 오늘
    const today = new Date();

    // 달력 요일
    const calendarDays = ["일", "월", "화", "수", "목", "금", "토",];

    for (let index = 0; index < 7; index++) {
        const arWeekDate = arWeek[index].split("-");
        const year = arWeekDate[0];
        const month = arWeekDate[1] < 10 ? "0" + arWeekDate[1] : arWeekDate[1];
        const day = arWeekDate[2] < 10 ? "0" + arWeekDate[2] : arWeekDate[2];
        const html = $('<div class="days-data" data-date='+ year + '-' + month + '-' + day + '>' +
                            '<span class="day d-block fs-4 fw-bold rounded-circle">' + day +'</span>' +
                            '<span class="name d-block">' + (index === calendarMonthTodayDay ? "오늘" : calendarDays[index] + "요일") + '</span>' +
                        '</div>');

        $('.days').append(html);
    }
})

$(document).on('click', '.days-data', function() {
    $('.days-data').each(function(index, item) {
        $(item).removeClass('active');
    })
    $(this).addClass('active');
})
