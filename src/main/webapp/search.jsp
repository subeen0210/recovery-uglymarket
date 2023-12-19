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
	width: 230px;
	border: 2px solid red;
}

.search{
	display: inline-flex;
	padding: 5px;
	border-radius: 50px;
	transition: 0.4s;
}

.search:hover {
	background-color: rgba(255, 255, 255, 0.15);
}

.search:hover input {
	max-width: 180px;
}

.search input{
	background: transparent;
	border: 0;
	max-width: 0;
	padding: 0;
	text-indent: 12px;
	color: #D8D8D8;
	font-size: 22px;
	outline: none;
	transition: 0.4s;
}

.search input::placeholder{
	color: #D8D8D8;
}

.search span{
	display: grid;
	place-item: center;
	width: 50px;
	height: 50px;
	background-color: #0B610B;
	border-radius: inherit;
	font-size: 15pt;
	pointer-events: none;
}
</style>
</head>
<body>

	<div class="wrapper">
	<div class="search">
		<span class="uil uil-search">
		</span>
		<input placeholder="Search" type="text">
	</div>
	</div>


</body>
</html>