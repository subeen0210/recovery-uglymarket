<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="js/regOrder.js?ver=1.2"></script>
<link rel="stylesheet" href="wj/css/Qna.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="main-wrapper">
		<h1>よくある質問</h1>
		<br>
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details class="demo-details-juqery-accordion">
				<summary>注文方法が知りたいです</summary>
				<p>
					アグリーマーケットはアプリから注文できます。<br>アプリはApp StoreまたはGoogle
					PlayStoreからダウンロードできます。<br>ご希望の商品を選択した後、注文決済してください。
				</p>
			</details>
		</div>
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details class="demo-details-juqery-accordion">
				<summary>アグリーマーケットは初めてですが、品質はどうですか？</summary>
				<p>ブサイクな農産物は農場から直接配送され新鮮です。</p>
			</details>
		</div>
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details class="demo-details-juqery-accordion">
				<summary>アグリーマーケットにはどんな製品がありますか？</summary>
				<p>
					アグリーマーケットでは、果物や野菜など、<br>さまざまなアグリー農産物と一般農産物の両方を購入できます。
				</p>
			</details>
		</div>
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details class="demo-details-juqery-accordion">
				<summary>アグリーマーケットの会員登録はどうすればいいですか？</summary>
				<p>
					アグリーマーケットの会員登録は、<br>携帯電話番号認証後すぐに登録できます。
				</p>
			</details>
		</div>
		<div class="detail-wrap">
			<img class="icon" src="img/free-icon-arrow-down.png" alt="" />
			<details class="demo-details-juqery-accordion">
				<summary>普通配送にはどのくらいかかりますか？</summary>
				<p>
					アグリーマーケットへの配送は注文後1~2日以内に完了します。 <br>
					ご注文後ずっと配送が来ない場合は、下記のカスタマーセンターまでご連絡いただければ、<br> すぐにご確認いたします。
				</p>
			</details>
		</div>
	</div>
</body>
<script>
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
						const $_this_details_open = $_this_details.attr("open"); // <details> 요소가 열려 있는지 여부를 확인
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
							$_this_details_p.stop().slideUp(300, function() {
								$_this_details.prop("open", false); // <details> 요소 open 이 아닐때 슬라이드 다시 업
							});
						}
					});
</script>
</html>