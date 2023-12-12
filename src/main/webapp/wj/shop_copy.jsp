<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/shopMain.js"></script>
<link rel="stylesheet" href="wj/css/shop.css">
</head>
<body>
	<div class="shop-item">
		<div class="shop-menu">
			<div class="menu1">
				<a class="a-menu"><span>ALL</span></a>
			</div>
			<div class="menu2">
				<span>アグリー</span>
			</div>
			<div class="menu2">
				<span>ふつう</span>
			</div>
		</div>
	</div>
	<c:forEach var="item" items="${items }">

		<div>
			<c:choose>
				<c:when test="${item.i_category ==1}">
					<div class="page-menu1">
						<div id="category-back1"></div>
						<span id="category-text">アグリ</span>
					</div>
				</c:when>
				<c:when test="${item.i_category ==2}">
					<div class="page-menu2">
						<div id="category-back2"></div>
						<span id="category-text">ふつう</span>
					</div>
				</c:when>
			</c:choose>
		</div>
		<!--  <div class="shop-page">-->

		<div class="page-menu1">
			<div class="page-list">
				<div class="page-img">
					<img alt="" src="location.href='ShopDetailC?no=${item.i_no}'">${item.i_img }>
				</div>

				<div class="category-back1">
					<span id="category-text">アグリ</span>
				</div>
				<br /> <span class="span-style"
					onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_name }</span>
				<br /> <span class="span-style"
					onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_price }</span>
			</div>
			</div>
			<br />
			<div class="page-menu2">
				<div class="page-list">
				<div class="page-img"></div>
				<br />
				<div class="category-back2">
					<span id="category-text">ふつう</span>
				</div>
				<br /> 
				<span class="span-style" onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_name }</span> <br /> 
					<span class="span-style" onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_price }</span> <br /> <br /> <br />
			</div>
			</div>

		
	</c:forEach>
	<div class="item-text-detail">
		<a href="">もっと見る</a>
	</div>
</body>
</html>
