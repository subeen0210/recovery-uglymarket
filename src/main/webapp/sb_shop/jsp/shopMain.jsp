<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/shopMain.css">
<script type="text/javascript" src="js/currentItem.js"></script>
<script type="text/javascript" src="js/shopMain.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="shop-item-kwj">
		<div class="shop-menu">
			<span data-filter="all">
				<div class="filter" val='all'>すべて</div>
			</span> 
			<span data-filter="1">
				<div class="filter" val='ugly'>アグリー</div>
			</span> 
			<span data-filter="2">
				<div class="filter" val='normal'>普通</div> 
			</span>
		</div>
	</div>
	
	<!-- <div>

	</div class="menu_list">  -->
		
	<div id="data-container"></div>
<!-- 	<div id="pagination-container"></div> -->

		
	<div class="itemContainer">  
	 	<div id="pagination"></div> 
	</div>
	
</body>
</html>