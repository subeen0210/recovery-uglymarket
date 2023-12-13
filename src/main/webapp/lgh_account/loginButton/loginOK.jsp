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
		<span>${sessionScope.userAccount.u_nicname }様</span>
		<button onclick="location.href='SellerLoginC'">logout</button>
		<button>myPage</button>
		<div>
		<a href="CartAllC"
          ><img class="cart-icon" src="img/semi-cart-icon.png" alt=""
        /></a>
		</div>
	</div>
</body>
</html>