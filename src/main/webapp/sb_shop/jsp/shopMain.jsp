<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/shopMain.js"></script>
<link rel="stylesheet" href="css/shopMain.css">
<title>Insert title here</title>
</head>
<body>

	<h3>shopMain</h3>
		
<div class="menu_button_area">
    <ul>
        <li><button type="button" data-filter="all" class="active">전체</button></li>
        <li><button type="button" data-filter="1">못난이</button></li>
        <li><button type="button" data-filter="2">일반</button></li>
    </ul>
</div>

<div class="menu_list">
    <ul id="itemContainer">
        <c:forEach var="item" items="${items}" varStatus="status">
            <div class="shop-item" data-category="${item.i_category}">
                <div>
                    <img alt="" src="">
                    <span onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_img}</span>
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
        <!-- 페이지 번호 버튼이 여기에 들어갑니다. -->
    </div>
</div>
			

</body>
</html>