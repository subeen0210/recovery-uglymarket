<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/order.css">

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
					<th class="delete_table">削除</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a id="openModalBtn" style="cursor: pointer;">56465</a></td>
					<td>可愛いイチゴ</td>
					<td>2/1000</td>
					<td>2000</td>
					<td>注文完了</td>
					<td>2023-12-30</td>
					<td><a>削除</a></td>
				</tr>



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
					<td class="value">栃木イチゴ組合</td>

				</tr>
				<tr>
					<td class="label">商品名</td>
					<td class="value">可愛いイチゴㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
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
					<td class="value">神奈川県座間市相模が丘<br>(252-0001)
					</td>
				</tr>
				<tr>
					<td class="label">注文日</td>
					<td class="value">2023-12-20</td>
				</tr>
				<tr>
					<td class="label">配送情報</td>
					<td class="value">配達代理店に到着</td>
				</tr>
				<!-- 다른 고객 정보 항목들 추가 -->
			</table>
		</section>




	</div>
	<br>
	<button id="closeModalBtn" style="width: 100px; height: 50px;">X</button>
	</dialog>

	<script src="js/orderModal.js"></script>

</body>
</html>
