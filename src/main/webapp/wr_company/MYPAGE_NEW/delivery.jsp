<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/delivery.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/deliveryModal.js?ver=2.5"></script>

</head>
<body>

	<div class="content">




		<h2>配送リスト</h2>

		<table border="1">
			<thead>
				<tr>
					<th>注文番号</th>
					<th>商品名</th>
					<th>注文量</th>
					<th>価格</th>
					<th>受取人</th>
					<th>住所</th>
					<th>配送状態</th>
					<th>注文日</th>
					<th>削除</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${sellerOrders }">
					<tr>
						<td><a class="openModalBtn" data-number="${order.o_no}"
							style="cursor: pointer;">${order.o_orderNum }</a></td>
						<td>${order.i_name }</td>
						<td>${order.o_quantity }</td>
						<td>${order.o_totalprice }</td>
						<td>${order.o_name }</td>
						<td>${order.o_addr }</td>
						<td class="status">${order.o_status }</td>
						<td>${order.o_date }</td>
						<td class="orderDeleteBtn" onclick="deleteOrder('${order.o_no}')">X</td>
					</tr>
				</c:forEach>
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
					<td class="label">商品名</td>
					<td class="value" id="i_name"></td>
				</tr>
				<tr>
					<td class="label">カテゴリ</td>
					<td class="value" id="i_category">ふつう</td>
				</tr>

				<tr>
					<td class="label">数量</td>
					<td class="value" id="o_quantity">2</td>
				</tr>
				<tr>
					<td class="label">個別価格</td>
					<td class="value" id="i_price">￥1,000</td>
				</tr>
				<tr>
					<td class="label">賞味期限</td>
					<td class="value" id="i_ed">2023-12-31</td>
				</tr>
				<!-- 다른 주문 정보 항목들 추가 -->
			</table>
		</section>

		<section class="customer-details">
			<h2>注文請書</h2>
			<table class="customer-info">
				<tr>
					<td class="label">受取人</td>
					<td class="value" id="o_name"></td>
				</tr>
				<tr>
					<td class="label">電話番号</td>
					<td class="value" id="o_tel"></td>
				</tr>
				<tr>
					<td class="label">到着時間</td>
					<td class="value" id="o_arrival"></td>
				</tr>
				<tr>
					<td class="label">住所</td>
					<td class="value" id="o_addr"></td>
				</tr>
				<tr>
					<td class="label">注文日</td>
					<td class="value" id="o_date"></td>
				</tr>
				<tr>
					<td class="label">配送情報</td>
					<td class="value" id="o_statusEnd" style="display: none;">配送完了</td>
					<td class="value" id="o_status" style="display: none;"><select class="select_button" id="status">
							<option value="status0">注文完了</option>
							<option value="status1">発送完了</option>
							<option value="status2">配送完了</option>
					</select></td>
					<td id="statusConfirm" style="display: none;"></td>
				</tr>

			</table>
		</section>


		<button class="modify" id="modify" onclick="updateStatusOrder();" style="display: none;">修正</button>

	</div>
	<br>
	<button id="closeModalBtn">X</button>
	</dialog>
</body>
</html>