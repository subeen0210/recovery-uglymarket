<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="wr_company/MYPAGE_NEW/css/delivery.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/index.css">
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

				</tr>
			</thead>
			<tbody>

				<tr>
					<td><a style="cursor: pointer;" id="openModalBtn">485244</a></td>
					<td>못난이감자</td>
					<td>2</td>
					<td>20000</td>
					<td>神奈川県横浜市</td>
				</tr>


			</tbody>
		</table>

		<br>


	</div>
	<!-- dialog 태그 사용 -->
	<dialog id="myModal">
	<div class="main_modal">

		<section class="order-details">
			<h2>商品情報</h2>
			<table class="order-info">
				<tr>
					<td class="label">農場名</td>
					<td class="value">栃木イチゴ組合</td>
					
				</tr>
				<tr>
					<td class="label">商品名</td>
					<td class="value">可愛いイチゴ</td>
				</tr>
				<tr>
					<td class="label">カテゴリ</td>
					<td class="value">ふつう</td>
				</tr>

				<tr>
					<td class="label">個数</td>
					<td class="value">2</td>
				</tr>
				<tr>
					<td class="label">個別価格</td>
					<td class="value">￥1,000</td>
				</tr>
				<tr>
					<td class="label">賞味期限</td>
					<td class="value">2023-12-31</td>
				</tr>
				<!-- 다른 주문 정보 항목들 추가 -->
			</table>
		</section>

		<section class="customer-details">
			<h2>注文請書</h2>
			<table class="customer-info">
				<tr>
					<td class="label">受取人</td>
					<td class="value">山田太郎</td>
				</tr>
				<tr>
					<td class="label">電話番号</td>
					<td class="value">080-1234-5678</td>
				</tr>
				<tr>
					<td class="label">到着時間</td>
					<td class="value">午前8時～11時</td>
				</tr>
				<tr>
					<td class="label">住所</td>
					<td class="value">神奈川県座間市相模が丘<br>(252-0001)</td>
				</tr>
				<tr>
					<td class="label">注文日</td>
					<td class="value">2023-12-20</td>
				</tr>
				<tr>
					<td class="label">配送情報</td>
					
					<td class="value">
					<select class="select_button" id="status"
						onchange="handleSelectChange(this)">
						<option value="data1">配送準備中</option>
						<option value="data2">発送完了</option>
						<option value="data3">配送完了</option>
						
					</select>
				
					
				
					
				</tr>
				
			</table>
		</section>


<button class="modify" id="modify">修正</button>

	</div>
	<br>
	<button id="closeModalBtn">X</button>
	</dialog>

	<script src="js/deliveryModal.js"></script>
</body>
</html>