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
					<th class="date">주문날짜</th>
					<th class="delete_table">削除</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a id="openModalBtn">56465</a></td>
					<td>可愛いイチゴ</td>
					<td>2/1000</td>
					<td>2000</td>
					<td>注文完了</td>
					<td>2023-12-30</td>
					<td><a id="" href="#">削除</a></td>
				</tr>



			</tbody>
		</table>

	</div>


	<!-- dialog 태그 사용 -->
	<dialog id="myModal">
	<div class="main_modal">

		<div class="table-wrapper">
			<div class="column-item">
				<div class="left">商品名</div>
			</div>
			<div class="column-item">
				<div class="right">可愛いイチゴ</div>
			</div>

			<div class="column-item">
				<div class="left">カテゴリー</div>
			</div>
			<div class="column-item">
				<div class="right">ふつう</div>
			</div>
			<div class="column-item">
				<div class="left">賞味期限</div>
			</div>
			<div class="column-item">
				<div class="right">2023－12－31</div>
			</div>
			<div class="column-item">
				<div class="left">価格</div>
			</div>
			<div class="column-item">
				<div class="right">2000</div>
			</div>


		</div>

		<br><br>
		<div class="table-wrapper">
			<div class="column-item2">
				<div class="left">受取人.</div>
			</div>
			<div class="column-item2">
				<div class="right">山田太郎</div>
			</div>

			<div class="column-item2">
				<div class="left">電話番号</div>
			</div>
			<div class="column-item2">
				<div class="right">080-1234-5678</div>
			</div>

			<div class="column-item2">
				<div class="left">到着時間</div>
			</div>
			<div class="column-item2">
				<div class="right">8時 ~ 12時</div>
			</div>

			<div class="column-item2">
				<div class="left">住所</div>
			</div>
			<div class="column-item2">
				<div class="right">神奈川県座間市相模が丘（252-0001）</div>
			</div>
			<div class="column-item2">
				<div class="left">注文日時</div>
			</div>
			<div class="column-item2">
				<div class="right">2023-12-26</div>
			</div>
			<div class="column-item2">
				<div class="left">配送状態</div>
			</div>
			<div class="column-item2">
				<div class="right">注文完了</div>
			</div>
			<div class="column-item2">
				<div class="left">住所</div>
			</div>
			<div class="column-item2">
				<div class="right">神奈川県座間市相模が丘</div>
			</div>

		</div>


	</div>
	<br>
	<button id="closeModalBtn" style="width: 100px; height: 50px;">閉じる</button>
	</dialog>

	<script src="js/orderModal.js"></script>
</body>
</html>
