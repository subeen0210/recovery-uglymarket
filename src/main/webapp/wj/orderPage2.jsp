<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="wj/css/order.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <div id="order-title">注文 / 決済する</div>

    <form action="OrderPageC" method="post">
      <div class="main-wrapper">
        <div class="detail-wrap">
          <img class="icon" src="img/free-icon-arrow-down.png" alt="" />
          <details class="demo-details-juqery-accordion">
            <summary>配送先</summary>
            <p>
              <!-- p태그 사용할때는 div적용시 아코디언 효가가 매끄럽게 안먹음 span 사용 -->
              <span id="order-addr-user">
                <span class="span-set-position"
                  >홍길동<button class="custom-btn">수정</button></span
                ><br /><br />
                <span>010&ensp;-&ensp;0000&ensp;-&ensp;0000</span><br /><br />
                <span
                  >서울시&ensp;강남구&ensp;세미빌라&ensp;(1234567)</span
                > </span
              ><br /><br /><br />
              <span id="order-addr-times">
                <span class="addr-times">配送時間帯を設定</span><br /><br />
                <select id="cars" name="cars">
                  <!-- option 태그로 각 선택 옵션을 정의 -->
                  <option value="8">午前中(8:00~12:00)</option>
                  <option value="12">12:00~14:00</option>
                  <option value="14">14:00~16:00</option>
                  <option value="16">16:00~:18:00</option>
                  <option value="18">18:00~20:00</option>
                  <option value="19">19:00~21:00</option>
                </select>
              </span>
            </p>
          </details>
        </div>
        <div class="detail-wrap">
          <img class="icon" src="img/free-icon-arrow-down.png" alt="" />
          <details class="demo-details-juqery-accordion">
            <summary>注文商品</summary>
            <p class="details-farm">
              <span>판매농장</span
              ><span class="order-delivery-status">무료배송</span>
            </p>
            <hr />
            <p id="items">
              <span id="getItems">
                <span class="order-item-imgbox">
                  <img class="img-set-size" src="홍련.PNG" />
                </span>
                <span class="order-item">
                  <span class="order-item-name"
                    >아이템 제목아이템 제목아이템 제목아이템 제목아이템
                    제목아이템 제목아이템 제목아이템 제목아이템 제목아이템
                    제목</span
                  ><br />
                  <span>(어글리)&ensp;못난이농장</span><br /><br />
                  <span>가격 * 수량</span>
                </span>
              </span>
              <br /><br /><br />
              <span id="totalPrice">総額&ensp;:&ensp;20000円</span>
            </p>
          </details>
        </div>
        <div class="set-btn">
          <a
            href=""
            title="Button push blue/green"
            class="button btnPush btnBlueGreen"
            >決済</a
          >
        </div>
      </div>
    </form>
    <script>
      // 강사님과 함께 풀이했던 내용 정리 완료

      const $_details = $(".demo-details-juqery-accordion"); // 클래스가 "demo-details-juqery-accordion"인 요소를 선택
      const $_summary = $_details.find("summary"); // 선택한 요소 내에서 <summary> 요소를 찾기

      $_summary.on("click", function (e) {
        // <summary> 요소가 클릭되면 이벤트 핸들러가 실행

        // 이벤트 헨들러
        e.preventDefault(); // 기본 클릭 이벤트 취소

        const $_this = $(this); // 현재 클릭된 <summary> 요소를 저장
        const $_this_details = $_this.parent("details"); // 클릭된 <summary>의 부모인 <details> 요소를 저장
        const $_this_details_p = $_this_details.find("p"); // <details> 내부의 <p> 요소를 저장
        const $_this_details_open = $_this_details.attr("open"); // <details> 요소가 열려 있는지 여부를 확인
        if (!$_this_details_open) {
          $_this_details[0].previousElementSibling.style.transform =
            "rotateZ(0deg)"; // 열려 있지 않은 경우 : 1.화살표 이미지의 각도를 조정하여 열린 상태로 변경 2.<details> 요소를 열고 <p> 요소를 슬라이드 다운
        } else {
          $_this_details[0].previousElementSibling.style.transform =
            "rotateZ(90deg)"; // 이미 열려 있는 경우 : 1.화살표 이미지의 각도를 조정하여 닫힌 상태로 변경 2.<p> 요소를 슬라이드 업 시키고 <details> 요소를 닫기
        }
        // 이 코드는 <details> 요소를 클릭할 때마다 열고 닫는 아코디언 효과를 적용하며, 화살표 이미지의 회전을 통해 현재 상태를 나타냄
        if (!$_this_details_open) {
          $_this_details.prop("open", true); // <details> 요소 open 했을때 슬라이드 다운
          $_this_details_p.stop().slideDown(600);
        } else {
          $_this_details_p.stop().slideUp(300, function () {
            $_this_details.prop("open", false); // <details> 요소 open 이 아닐때 슬라이드 다시 업
          });
        }
      });
    </script>
  </body>
</html>
