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

			<div class="seller_id">オタクの農場</div>
		</div>

		<h1>マイページ</h1>
		<div class="main_menu_container">
			<div class="main_menu_control">
				<div class="main_menu">
					<a onclick="showJSP('register')">商品管理</a>
				</div>
				<div class="main_menu">
					<a onclick="showJSP('delivery')">配送管理</a>
				</div>
				<div class="main_menu">
					<a onclick="showJSP('stock')">在庫管理</a>
				</div>

				<div class="main_menu">
					<a onclick="showJSP('mypage')">農場情報管理</a>
				</div>

			</div>
		</div>
		<div class="sub_control">

			<div class="subview">
				<div class="jsp_view"></div>
			</div>

		</div>
	</div>

</body>
</html>