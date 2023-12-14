<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	상품 id 번호를 받아와서 장바구니에 추가.
	상품 선택한 갯수도 받아서 c_number에 추가.
	로그인이 안되어있다면 로그인 창으로 안내
	로그인 세션이 만료했다면 다시 로그인 창으로 안내
	insert into cart values(cart_seq.nextval, u_id, i_no, c_number);
	
	 -->
	<button>장바구니 추가</button>
</body>
</html>