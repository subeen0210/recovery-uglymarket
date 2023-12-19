<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="pagination/pagination.js"></script>
<script type="text/javascript" src="pagination/pagination.min.js"></script>
<link rel="stylesheet" href="pagination/pagination.css">
<link rel="stylesheet" href="css/shopMain.css">

<script type="text/javascript" src="js/shopMain.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="shop-item-kwj">
		<div class="shop-menu">
			<span data-filter="all">
				<div class="filter" val='all'>ALL</div>
			</span> 
			<span data-filter="1">
				<div class="filter" val='ugly'>アグリー</div>
			</span> 
			<span data-filter="2">
				<div class="filter" val='normal'>普通</div> 
			</span>
		</div>
	</div>
	
	<div>
<!-- 2023.12.16일 코드 변경 , 3칸으로 정리하기 시작 by S.B. Choi-->
	<div class="menu_list"> <!-- division1 -->
		
<div id="data-container"></div>
<div id="pagination-container"></div>

		
		<div class="itemContainer">  <!-- division2 -->
		
		
		
		
		
		
		
		
		
		
		
		
		<c:forEach varStatus="status" var="item" items="${items }">
			<c:if test="${status.index % 3 == 0}">
                <div class="div-tbl-row">
            </c:if>
				<div class="shop-item" data-category="${item.i_category}">  <!-- division3 -->
					<div class="item-size">
						<img onclick="location.href='ShopDetailC?no=${item.i_no}'"
							class="item-img" alt="" src="itemFolder/${item.i_img }">
					</div>
					<div>  <!-- division4 -->
						<c:choose>
							<c:when test="${item.i_category ==1}">
								<div class="category" data-filter="1">
									<div class="category-back1"></div>
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
					<div class="text">
						<span onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_name}</span>
					</div>
					<div class="text">
						<span onclick="location.href='ShopDetailC?no=${item.i_no}'">${item.i_price}</span>
					</div>
			</div>
		
				<c:if test="${status.index % 3 == 2 or status.last}">
		</div>
				</c:if>
				<c:if test="${status.index + 1 == fn:length(items) and (status.index + 1) % 3 != 0}">
	</div> <!-- 마지막 줄을 닫아줌 -->
 				</c:if>
		</c:forEach>
<!-- 2023.12.16일 코드 변경 , 3칸으로 정리하기 끝 -->



		<div id="pagination">
			<!-- 페이지 번호를 나타낼 곳 -->
		</div>

	</div>
	
</body>
</html>