<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

<link rel="stylesheet" href="wr_company/css/myPage.css">
<link rel="stylesheet" href="wr_company/css/header.css">
<link rel="stylesheet" href="wr_company/css/kanri.css">
<link rel="stylesheet" href="wr_company/css/reviewList.css">
<link rel="stylesheet" href="wr_company/css/order.css">
<link rel="stylesheet" href="wr_company/css/regUser.css">
<link rel="stylesheet" href="wr_company/css/modal.css">


<head>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script src="wr_company/js/mypage.js"></script><!--바닥 JSP호출 JS -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
	<div class="mypage_container"> <!-- 메인 페이지 -->
		<div class="mypage_title">
			<img src="img/semi-logo-title.png"><BR><p>マイページへようこそ</p>
		</div>

		<div class="mypage_contents1_box">
		
			<div class="mypage_contents1_info_box">
			
				
					
				
				<div class="info_container">
				<div class="myinfo_box"> <!-- 나의 로그인 정보 -->
					<div class="myinfo_box_photo"><img src=""></div>
					<div class="myinfo_box_item">
						<div class="myinfo_box_items"><h3>${sessionScope.userAccount.u_nicname}様</h3></div>
						<div class="myinfo_box_items2">${sessionScope.userAccount.u_id}</div>
						<div class="myinfo_box_items3">${sessionScope.userAccount.u_email}</div>
					</div>
					</div>
					<div class="mypage_contents2_box">
    					<c:forEach var="productId" items="${recentProductIds}">
        					<div class="mypage_contents2_box_item">
            					<img src="itemFolder/${productId}.jpg" alt="Product Image">
        					</div>
   						 </c:forEach>
					</div>
				</div>
</div>
			</div>
			<div class="menu_container">
				<div class="mypage_contents1_menu"> <!--오른쪽 메뉴 버튼 -->
					<div class="mypage_contents1_menu_boxs" id="kanri">
						<p>配送住所管理</p>
					</div>
					<div class="mypage_contents1_menu_boxs" id="review">
						<p>後期</p>
					</div>

					<div class="mypage_contents1_menu_boxs" id="order">
						<p>注文内訳</p>
					</div>

				
				
					<div class="mypage_contents1_menu_boxs" id="cart">
						<p>マイカートー</p>
					</div>
					<div class="mypage_contents1_menu_boxs" id="user_modify">
						<p>申請情報</p>
					</div>
					
					
				</div>
				
			</div>
			
		</div>
	
		<div class="mypage_centents3_box" id="mypage_centents3_box"></div>
　　　　                           　<!--바닥 JSP가 표시되는 박스 부분  -->

	
</body>
</html>