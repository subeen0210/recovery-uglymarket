<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="wr_company/css/order.css">

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 상세 정보</title>

</head>
<body>
	<div class="main">
		<h1>注文詳細情報</h1>

		<table>
			<thead>
				<tr>
					<th class="order_number">注文番号</th>
					<th class="product_name">商品名</th>
					<th class="price">数量/価格</th>
					<th class="total_price">総価格</th>
					<th class="pickup_status">配送状態</th>
					<th class="date">注文日</th>
					<th class="review_create">作成</th>
					<th class="delete_table">削除</th>
				</tr>
			</thead>
			<tbody>


				<c:forEach var="order" items="${userOrders }">
					<tr>
						<td><a class="openModalBtn" data-number="${order.o_no}"
							style="cursor: pointer;">${order.o_orderNum }</a></td>
						<td>${order.i_name }</td>
						<td>${order.o_quantity }/${order.i_price }</td>
						<td>${order.o_totalprice }</td>
						<td>${order.o_status }</td>
						<td>${order.o_date }</td>
						<td><button class="openModalBtn2">作成</button>
						<td><a>削除</a></td>
					</tr>
				</c:forEach>




			</tbody>
		</table>

	</div>


	<!-- dialog 태그 사용 -->
	<dialog id="myModal">
	<div class="main_modal">

		<section class="order-details">
			<h2>商品情報</h2>
			<table class="order-info">
				<tr>
					<td class="label">農場名</td>
					<td class="value" id="f_name"></td>

				</tr>
				<tr>
					<td class="label">商品名</td>
					<td class="value" id="i_name"></td>
				</tr>
				<tr>
					<td class="label">カテゴリ</td>
					<td class="value" id="i_category"></td>
				</tr>

				<tr>
					<td class="label">数量</td>
					<td class="value" id="o_quantity"></td>
				</tr>
				<tr>
					<td class="label">個別価格</td>
					<td class="value" id="i_price"></td>
				</tr>
				<tr>
					<td class="label">賞味期限</td>
					<td class="value" id="i_ed"></td>
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
					<td class="value" id="o_addr">
					</td>
				</tr>
				<tr>
					<td class="label">注文日</td>
					<td class="value" id="o_date"></td>
				</tr>
				<!-- 다른 고객 정보 항목들 추가 -->
			</table>
		</section>




	</div>
	<br>
	<button id="closeModalBtn" style="width: 30px; height: 30px;border:none;">X</button>
	</dialog>


	<!-- 2번째 modal 창 -->

	<dialog id="myModal2">

	<div class="main_modal">
		<form id="myForm" action="" method="post">
			<section class="order-details">
				<h2>後記作成</h2>
				<table class="order-info">
					<tr>
						<td class="label">商品名</td>
						<td class="value">可愛いイチゴ</td>

					</tr>
					<tr>
						<td class="label">評点</td>
						<td class="value"><input type="text" id="grade" name="grade"></td>
					</tr>
					<tr>
						

						<td style="width: 200px; height: 50px;" class="label">作成日
						
						</td>
						<td class="value"><input type="date" id="date" name="date"></td>

					</tr>
					<tr>
						<td class="label">内容</td>
						<td class="value"><textarea rows="4" cols="50">이곳에 텍스트를 입력하세요.</textarea></td>
					</tr>

				</table>
				<button type="button" id="myButton"
					onclick="submitForm('buttonIdValue')">作成</button>
			</section>
		</form>
	</div>
	<br>
	<button class="closeBtn2" id="closeModalBtn2">X</button>
	</dialog>

	<script type="text/javascript" src="js/orderDetail.js"></script>


</body>
</html>
