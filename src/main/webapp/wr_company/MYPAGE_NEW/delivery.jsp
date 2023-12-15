<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="css/seller_register3.css">
<link rel="stylesheet" href="css/header.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>배송 관리</h2>
	<div class="content">
		



		<h2>배송 리스트</h2>

		<table border="1">
			<thead>
				<tr>
					<th>상품이름</th>
					<th>주문량</th>
					<th>제품가격</th>
					<th>주소</th>
					<th>詳細</th>
					<th>削除</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>못난이감자</td>
					<td>2</td>
					<td>20000</td>
					<td>神奈川県横浜市</td>
					<td><a href="editAddress.jsp?id=1">詳細</a></td>
					<td><a href="deleteAddress.jsp?id=1">削除</a></td>
				</tr>
				<tr>
					<td>예쁜딸기</td>
					<td>1</td>
					<td>30000</td>
					<td>東京都千代田区外神田2丁目</td>
					<td><a href="editAddress.jsp?id=1">詳細</a></td>
					<td><a href="deleteAddress.jsp?id=1">削除</a></td>
				</tr>
				<tr>
					<td>당근</td>
					<td>3</td>
					<td>18000</td>
					<td>愛知県名古屋市栄町</td>
					<td><a href="editAddress.jsp?id=1">詳細</a></td>
					<td><a href="deleteAddress.jsp?id=1">削除</a></td>
				</tr>


			</tbody>
		</table>

		<br>


	</div>
</body>
</html>