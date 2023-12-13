<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/shopMain.js"></script>
<link rel="stylesheet" href="css/shopMain.css">
<title>Insert title here</title>
</head>
<body>

	<div class="shop-item-kwj">
		<div class="shop-menu">
			<span data-filter="all" class="active">
				<div class="menu1">ALL</div>
			</span> 
			<span data-filter="1">
				<div class="menu2">アグリー</div>
			</span> 
			<span data-filter="2">
				<div class="menu2">ふつう</div> 
			</span>
		</div>
	</div>


	<div class="menu_list">
		<ul id="itemContainer">
			<c:forEach var="item" items="${items}" varStatus="status">
				<div class="shop-item" data-category="${item.i_category}">
					<div>
						<img alt="" src=""> <span
							onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_img}</span>
					</div>
					<div>
						<c:choose>
							<c:when test="${item.i_category ==1}">
								<div class="category" data-filter="1">
									<div id="category-back1"></div>
									<span id="category-text">못난이</span>
								</div>
							</c:when>
							<c:when test="${item.i_category ==2}">
								<div class="category" data-filter="2">
									<div id="category-back2"></div>
									<span id="category-text">일반</span>
								</div>
							</c:when>
						</c:choose>
					</div>
					<div>
						<span onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_name}</span>
					</div>
					<div>
						<span onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_price}</span>
					</div>
				</div>
			</c:forEach>
		</ul>

		<div id="pagination">
			<!-- 페이지 번호를 나타낼 곳 -->
		</div>

	</div>


</body>
</html>