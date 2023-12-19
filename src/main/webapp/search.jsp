<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrapper{
	text-align: center;
	width: 250px;
	border: 2px solid red;
}

.search{
	display: inline-flex;
	padding: 5px;
	border-radius: 50px;
	transition: 0.6s;
}

.search:hover {
	background-color: #F2F2F2;
}

.search:hover input {
	max-width: 500px;
}

.search input{
	background: transparent;
	border: 0;
	max-width: 0;
	padding: 0;
	text-indent: 12px;
	color: #A4A4A4;
	font-size: 16px;
	outline: none;
	transition: 0.6s;
}

.search input::placeholder{
	color: #A4A4A4;
}

.search span{
	display: grid;
	place-item: center;
	width: 40px;
	height: 40px;
	background-color: #0B610B;
	border-radius: inherit;
	font-size: 15pt;
	pointer-events: none;
}

#search-icon{
	width: 25px;
	margin: auto;
}
</style>
</head>
<body>

	<div class="wrapper">
	<div class="search">
		<span class="uil uil-search">
		<img id="search-icon" alt="" src="img/search-icon-white.png">
		</span>
		<input placeholder="상품명을 입력하세요." type="text">
	</div>
	</div>


</body>
</html>