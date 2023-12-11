<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/shopMain.css">
<title>Insert title here</title>
</head>
<body>

		<h3>shopMain</h3>
		
		<c:forEach var="item" items="${items }">
			<div class="shop-item">
			<div>
				<img alt="" src="">
				<span>${item.i_img }</span>
			</div>
			<div>
				<c:choose>
					<c:when test="${item.i_category ==1}">
						<div class="category">
							<div id="category-back1"></div>
							<span id="category-text">アグリ</span>
						</div>
					</c:when>
					<c:when test="${item.i_category ==2}">
						<div class="category">
							<div id="category-back2"></div>
							<span id="category-text">ふつう</span>
						</div>
					</c:when>
				</c:choose>
			</div>
			<div>
				<span>${item.i_name }</span>
			</div>
			<div>
				<span>${item.i_price }</span>
			</div>
			</div>
		</c:forEach>
		
		<button>More</button>
		
</body>
</html>