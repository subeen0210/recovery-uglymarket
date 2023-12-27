<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="wr_company/MYPAGE_NEW/css/seller_register.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/header.css">
<script src="js/button.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="content">




		<h2>배송 리스트</h2>

		<table border="1">
			<thead>
				<tr>
					<th>注文番号</th>
					<th>商品名</th>
					<th>注文量</th>
					<th>価格</th>
					<th>住所</th>
					<th>配送状態</th>
					<th>詳細</th>
					<th>削除</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>485244</td>
					<td>못난이감자</td>
					<td>2</td>
					<td>20000</td>
					<td>神奈川県横浜市</td>
					<td>
					<select class="select_button" id="status"
						onchange="handleSelectChange(this)">
						<option value="data1">配送準備中</option>
						<option value="data2">発送完了</option>
						<option value="data3">配送完了</option>
					</select>
					<button class="delete_button" style="display: none;"
						onclick="handleDelete()">Delete</button>
					</td>
					<td><a href="editAddress.jsp?id=1">詳細</a></td>
					<td><a href="deleteAddress.jsp?id=1">削除</a></td>
				</tr>


			</tbody>
		</table>

		<br>


	</div>
</body>
</html>