<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/mypage.js"></script>
<link rel="stylesheet" href="css/myPage.css">
<link rel="stylesheet" href="css/header.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="myPage_container">
		<div class="seller_id_main">
		
			<div class="seller_id">덕배네 농장</div>
		</div>
		<div class="logo"><img src="img/logo.png"></div>
		<h1>マイページ</h1>
		<div class="main_menu_container">
			<div class="main_menu_control">
				<div class="main_menu">
					<a onclick="showJSP('register')">상품관리</a>
				</div>
				<div class="main_menu">
					<a onclick="showJSP('delivery')">배송관리</a>
				</div>
				<div class="main_menu" onclick="loadInfoModification()">정보수정</div>

			</div>
		</div>
		<div class="sub_control">
			<!--  <div class="sub_menu">
				<div id="register">
					상품등록
				</div>
				<div id="stock">상품관리</div>
				<div id="farm">농장관리</div>
			</div>-->
			<div class="subview">
				<div class="jsp_view"></div>
			</div>

		</div>
	</div>

</body>
</html>