<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h3>shopMain</h3>
		
		<c:forEach var="item" items="${sessionScope.items }">
			<div class="shop-item">
			<div>
				${sessionScope.i_img }<img alt="" src="">
			</div>
			<div>
				<span>${item.i_name }</span>
			</div>
			<div>
				<span>${item.i_price }</span>
			</div>
			</div>
		</c:forEach>
		
</body>
</html>