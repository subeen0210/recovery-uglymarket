<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<span>${sessionScope.sellerAccount.s_kanji_ln } ${sessionScope.sellerAccount.s_kanji_fn }様</span>
		<button onclick="location.href='SellerLoginC'">logout</button>
		<button onclick="location.href='MypageC?id=${sessionScope.sellerAccount.s_id}'">myPage</button>
	</div>
</body>
</html>