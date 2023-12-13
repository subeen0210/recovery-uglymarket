<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/myPage.css">
<link rel="stylesheet" href="css/header.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script src="js/mypage.js"></script><!--바닥 JSP호출 JS -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mypage_container"> <!-- 메인 페이지 -->


		<div class="mypage_title">
			<p>マイページ</p>
		</div>

		<div class="mypage_contents1_box">
			<div class="mypage_contents1_info_box">
				<div class="mypage_contents2_container">
				
					<div class="mypage_contents2_box"> <!--최근 본 상품이 들어가는 박스 -->
					
						<div class="mypage_contents2_box_item"></div>
						<div class="mypage_contents2_box_item"></div>
						<div class="mypage_contents2_box_item"></div>
					<div class="mypage_contents2_more"><a href="">もっと見る</a></div>
					</div>
				</div>
				<div class="myinfo_box"> <!-- 나의 로그인 정보 -->
					<div class="myinfo_box_photo"></div>
					<div class="myinfo_box_item">
						<div class="myinfo_box_items">xxxx님</div>
						<div class="myinfo_box_items">못난이</div>
						<div class="myinfo_box_items">히히히히히히</div>
					</div>


				</div>

			</div>
			<div class="">
				<div class="mypage_contents1_menu"> <!--오른쪽 메뉴 버튼 -->
					<div class="mypage_contents1_menu_boxs">
						<a href="#" id="kanri">配送住所管理</a>
					</div>
					<div class="mypage_contents1_menu_boxs">
						<a href="#" id="review">後期</a>
					</div>

					<div class="mypage_contents1_menu_boxs">
						<a href="#" id="order">注文内訳</a>
					</div>

				</div>
				<div class="mypage_contents1_menu">
					<div class="mypage_contents1_menu_boxs">
						<a href="#" id="cart">マイカートー</a>
					</div>
					<div class="mypage_contents1_menu_boxs">
						<a href="#" id="seller-register">商品管理</a>
					</div>
					<div style='visibility: hidden;' class="mypage_contents1_menu_boxs">
						<a href="#">hidden</a> <!--숨겨진 박스  -->
					</div>
				</div>
			</div>
		</div>
	
		<div class="mypage_centents3_box" id="mypage_centents3_box"></div>
　　　　                           　<!--바닥 JSP가 표시되는 박스 부분  -->































	</div>
</body>
</html>