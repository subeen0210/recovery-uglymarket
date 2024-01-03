<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="js/regOrder.js?ver=1.1"></script>
<link rel="stylesheet" href="wj/css/order.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<input type="hidden" id="deliveryCheck" value="${addr.a_req }">
	<div id="order-title">注文 / 決済する</div>

	<div class="main-wrapper">
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details  class="demo-details-juqery-accordion">
				<summary>配送先</summary>
				<p>
					<!-- p태그 사용할때는 div적용시 아코디언 효가가 매끄럽게 안먹음 span 사용 -->
					<span id="order-addr-user"> <span class="span-set-position">${addr.a_name }
							<button class="custom-btn">変更</button>
					</span><br /> <br /> <span>${addr.a_tel }</span><br /> <br /> <span>${addr.a_addr }
							${addr.a_addrDetail } (${addr.a_postcode })</span>
					</span><br /> <br /> <br /> <span id="order-addr-times"> <span
						class="addr-times">配送時間帯を設定</span><br /> <br /> <select
						id="deliveryTime" name="deliveryTime">
							<!-- option 태그로 각 선택 옵션을 정의 -->
							<option value="午前中(8:00~12:00)">午前中(8:00~12:00)</option>
							<option value="12:00~14:00">12:00~14:00</option>
							<option value="14:00~16:00">14:00~16:00</option>
							<option value="16:00~:18:00">16:00~:18:00</option>
							<option value="18:00~20:00">18:00~20:00</option>
							<option value="19:00~21:00">19:00~21:00</option>
					</select>
					</span>
				</p>
			</details>
		</div>
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details class="demo-details-juqery-accordion">
				<summary>注文商品</summary>
				<div id="wrap-content"></div>
				<hr>
				<span id="totalPriceAll"><img src="img/en-icon.png"
					style="width: 20px;"><span id="totalPrice"></span></span>
			</details>
		</div>
		<div class="set-btn">
			<button title="Button push blue/green"
				class="button btnPush btnBlueGreen" onclick="regOrder();">決済</button>
		</div>
	</div>
	<!-- 모달 창 (결제 끝났을 때, 이동할 부분)-->
	<dialog id="paymentEndPage">
	<h2 class="dialog-title">決定が完了しました。マイページに移動しますか？</h2><br><br>
	<div class="dialog-set-btn">
	<a class="btnPush2 btn-3d-2" href="UserMypageC">マイページ</a>
	<a class="btnPush3 btn-3d-3" href="HC">ホーム</a>
	</div>
	</dialog>

	<script>
		// 강사님과 함께 풀이했던 내용 정리 완료

		const $_details = $(".demo-details-juqery-accordion"); // 클래스가 "demo-details-juqery-accordion"인 요소를 선택
		const $_summary = $_details.find("summary"); // 선택한 요소 내에서 <summary> 요소를 찾기

		$_summary
				.on(
						"click",
						function(e) {
							// <summary> 요소가 클릭되면 이벤트 핸들러가 실행

							// 이벤트 헨들러
							e.preventDefault(); // 기본 클릭 이벤트 취소

							const $_this = $(this); // 현재 클릭된 <summary> 요소를 저장
							const $_this_details = $_this.parent("details"); // 클릭된 <summary>의 부모인 <details> 요소를 저장
							const $_this_details_p = $_this_details.find("p"); // <details> 내부의 <p> 요소를 저장
							const $_this_details_open = $_this_details
									.attr("open"); // <details> 요소가 열려 있는지 여부를 확인
							if (!$_this_details_open) {
								$_this_details[0].previousElementSibling.style.transform = "rotateZ(0deg)"; // 열려 있지 않은 경우 : 1.화살표 이미지의 각도를 조정하여 열린 상태로 변경 2.<details> 요소를 열고 <p> 요소를 슬라이드 다운
							} else {
								$_this_details[0].previousElementSibling.style.transform = "rotateZ(90deg)"; // 이미 열려 있는 경우 : 1.화살표 이미지의 각도를 조정하여 닫힌 상태로 변경 2.<p> 요소를 슬라이드 업 시키고 <details> 요소를 닫기
							}
							// 이 코드는 <details> 요소를 클릭할 때마다 열고 닫는 아코디언 효과를 적용하며, 화살표 이미지의 회전을 통해 현재 상태를 나타냄
							if (!$_this_details_open) {
								$_this_details.prop("open", true); // <details> 요소 open 했을때 슬라이드 다운
								$_this_details_p.stop().slideDown(600);
							} else {
								$_this_details_p.stop().slideUp(300,
										function() {
											$_this_details.prop("open", false); // <details> 요소 open 이 아닐때 슬라이드 다시 업
										});
							}
						});

	</script>
</body>
</html>
