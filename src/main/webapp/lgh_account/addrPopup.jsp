<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/addPopup.css">
<script type="text/javascript" src="../js/addrDetail.js"></script>
</head>
<body>
	<div>
		<div></div>
		<h1 class="search-h">
			住所&ensp;<img class="searh-modal" alt="" src="../img/search-modal.png">
		</h1>
		<div class="search-h2">
			<div>
				<input placeholder="ex) 3120061 or 312-0061" id="addr-Zipcode">
			</div>
			&ensp;
			<div>
				<button class="button btnPush btnBlueGreen" id="addr-btnSearch">検索</button>

			</div>
		</div>
		<input type="hidden" id="address1"> <input type="hidden"
			id="address2">
	</div>
	<hr>
	<br>
	<div id="items"></div>
</body>
</html>