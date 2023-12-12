<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/addrDetail.js"></script>
</head>
<body>
	<div>
		<h1>住所</h1>
		<div>
			<input placeholder="ex) 3120061 or 312-0061" id="addr-Zipcode">
			<button id="addr-btnSearch">検索</button>
		</div>
		<input type="hidden" id="address1">
		<input type="hidden" id="address2">
	</div>
	<hr>
	<div id="items"></div>
</body>
</html>