<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
    <head>
        <meta content="text/html"; charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>예약하기 | 법률서비스 101</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

        <link href="/resource/css//headers.css" rel="stylesheet">
        <link href="/resource/css/sidebars.css" rel="stylesheet">
        <link href="/resource/css/footer.css" rel="stylesheet">
        <link href="/resource/css/common.css" rel="stylesheet">

        <link href="/resource/css/booking.css" rel="stylesheet">
        <script src="/resource/js/booking.js" charset="UTF-8"></script>

        <!-- <script type="text/javascript">
            const myModal = document.getElementById('myModal')
            const myInput = document.getElementById('myInput')

            myModal.addEventListener('shown.bs.modal', () => {
              myInput.focus()
            })
        </> -->

    </head>

    <body>
      <!-- header -->


      <!-- sidebar -->


        <!-- main -->
        <div class="container" style="width: 800px;">
            <div class="position-relative mt-5 m-5 mx-auto w-75" id="progressBar">
                <div class="progress" style="height: 1px;">
                  <div class="progress-bar" role="progressbar" aria-label="Progress" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill" style="width: 2rem; height:2rem;">1</button>
                <button type="button" class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-secondary rounded-pill" style="width: 2rem; height:2rem;">2</button>
                <button type="button" class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill" style="width: 2rem; height:2rem;">3</button>
            </div>

            <!-- calendar  -->
            <h3 class="text-center mb-5">${lawyerInfo.lawyerName} 변호사와 상담예약</h3>
            <div id="reservation">
              <div class="date-table">
                <p class="fs-5 fw-bold">날짜선택</p>
                        <table class="Calendar">
                            <thead>
                                <tr>
                                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                                    <td colspan="5">
                                        <span id="calYear"></span>년
                                        <span id="calMonth"></span>월
                                    </td>
                                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                                </tr>
                                <tr>
                                    <td>일</td>
                                    <td>월</td>
                                    <td>화</td>
                                    <td>수</td>
                                    <td>목</td>
                                    <td>금</td>
                                    <td>토</td>
                                </tr>
                            </thead>
                            <tbody>
                            <form>
                                <input type="hidden" name="bookingDate">
                                <input type="hidden" name="bookingTime">
                            </form>
                            </tbody>
                        </table>
                </div>
                <p class="fs-5 fw-bold">시간 선택</p>
                <ul class="times ps-0">

                </ul>
              </div>
            </div>

            <div class="text-end my-3">
              <a href="" class="link-primary text-decoration-underline" id="question" data-bs-toggle="modal" data-bs-target="#exampleModal">혹시 해외에서 이용 중이신가요?</a>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">이용하지마세요</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-custom">확인</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- info -->
            <div class="accordion" id="accordionPanelsStayOpenExample">
                <div class="accordion-item bg-body-tertiary">
                  <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                      변호사 정보
                    </button>
                  </h2>
                  <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                    <div class="accordion-body">
                      <table class="table table-borderless">
                          <tr>
                            <td>변호사</td>
                            <td><strong>${lawyerInfo.lawyerName}</strong></td>
                          </tr>
                          <tr>
                            <td>법률사무소/법무법인</td>
                            <td><strong>${lawyerInfo.companyVo.companyName}</strong></td>
                          </tr>
                          <tr>
                            <td>주소</td>
                            <td><strong>${lawyerInfo.companyVo.companyAddress}</strong></td>
                          </tr>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="accordion-item bg-body-tertiary">
                  <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                      상담 정보
                    </button>
                  </h2>
                  <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                    <div class="accordion-body">
                      <strong>1. 법률 서비스는 <span style="background : #ffe900">방문 상담</span>을 기본 원칙으로 법적 서비스가 제공 됩니다.</strong><br><br>
                      <strong>2. 예약 시 작성한 상담글을 변호사가 사전검토합니다.</strong><br>
                      &emsp;상담예약 및 작성한 상담내용은 <span style="background : #ffe900">‘변호사의 비밀유지’</span>에 의해 비밀보호됩니다.<br><br>
                      <strong>3. 법률 서비스 101에서 지정한 1회 법적 자문 비용은 50,000원으로, 모든 변호사의 상담료는 동일합니다.<br></strong><br>
                      &emsp;변호사의 법률 자문 이후 계약서 검토, 자문, 소송 등 추가적인 법률 서비스는 추가 상담료가 발생할 수 있습니다.<br>
                      &emsp;추가적인 법률 서비스는 담당 변호사와 진행되고, 추가 자문 제공 및 상담료에 있어,  <span style="background : #ffe900">법률 서비스101 측 과는 무관 </span>합니다.<br>
                    </div>
                  </div>
                </div>
                <div class="accordion-item bg-body-tertiary">
                  <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                      예약확인 및 환불 규정
                    </button>
                  </h2>
                  <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                    <div class="accordion-body">
                      예약 날짜는 마이페이지에서 확인 할 수 있습니다.<br>
                      변호사 사정으로 상담을 하지 못한 경우, 법률서비스101 고객센터에 연락 주시면 100% 환불해드립니다. <br>
                      의뢰인 사정으로 상담을 하지 못한 경우 또는 상담이 이루어진 경우에는 환불해드리지 않습니다. <br>
                    </div>
                  </div>
                </div>
                <div class="text-end mt-4">
                    <form method="post">
                        <button type="button" class="btn btn-custom" onclick="history.back()">뒤로</button>
                        <button type="submit" class="btn btn-custom" id="goCounselbtn" >상담 내용 작성하기</button>
                        <input type="hidden" name="bookingDate">
                        <input type="hidden" name="bookingTime">
                    </form>/
                </div>
            </div>
        </div>

        <!-- footer -->



    <script>
        window.onload = function() {
           showCalendar();
        }
    </script>
    </body>
</html>