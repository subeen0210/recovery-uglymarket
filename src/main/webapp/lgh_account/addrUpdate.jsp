<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="wr_company/css/kanri.css?ver=1.1">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src="js/addr.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 상세 정보</title>

</head>
<body>
	<div class="main">
		<h1>配送先住所管理</h1>

		<table>
			<thead>
				<tr>
					<th class="a_name">受取人</th>
					<th class="addrNum">郵便番号</th>
					<th class="addr">住所</th>
					<th class="telNum">電話番号</th>
					<th class="delivery_time">到着時間</th>
					<th class="updateAddr">修正</th>
					<th class="delete_table">削除</th>
				</tr>
			</thead>
			<tbody>


				<c:forEach var="addr" items="${address }">
					<tr>
						<td>${addr.a_name }</td>
						<td>${addr.a_postcode }</td>
						<td>${addr.a_addr } ${addr.a_addrDetail }</td>
						<td>${addr.a_tel }</td>
						<td>${addr.a_req }</td>
						<td class="openModalBtn" data-no="${addr.a_no }">修正</td>
						<td class="addrDeleteBtn" onclick="">X</td>
					</tr>
				</c:forEach>




			</tbody>
		</table>

	</div>


	<!-- dialog 태그 사용 -->
	<dialog id="myModal">
	<div class="main_modal">

		<section class="order-details">
			<h2>住所修正</h2>
			<table class="order-info">
				<tr>
					<td class="label">受取人</td>
					<td class="value"><input class="input-style" id="nameInput" name="" /></td>

				</tr>
				<tr>
					<td class="label">電話番号</td>
					<td class="value"><input class="input-style" id="telInput" name="" /></td>
				</tr>
				<tr>
					<td class="label">到着時間</td>
					<td class="value"><select id="deliveryTime" name="deliveryTime">
						<!-- 							option 태그로 각 선택 옵션을 정의 -->
						<option value="午前中(8:00~12:00)">午前中(8:00~12:00)</option>
						<option value="12:00~14:00">12:00~14:00</option>
						<option value="14:00~16:00">14:00~16:00</option>
						<option value="16:00~:18:00">16:00~:18:00</option>
						<option value="18:00~20:00">18:00~20:00</option>
						<option value="19:00~21:00">19:00~21:00</option>
					</select></td>
				</tr>

				<tr>
					<td class="label">郵便番号</td>
					<td class="value"><input class="input-style" name="userAddrN" id="addrNum"
						readonly="readonly" /><button class="btn-style" type="button" id="addr-popup">住所検索</button>
					</td>
				</tr>
				<tr>
					<td class="label">都道府県</td>
					<td class="value"><input class="input-style" name="userAddrP" id="addrPrefecture"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="label">市区町村</td>
					<td class="value"><input class="input-style" name="userAddrC" id="addrCity"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="label">詳細情報</td>
					<td class="value"><input class="input-style" name="userAddrD" id="addrDetail"/>
					</td>
				</tr>
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
						<td class="value" id="r_productname"></td>

					</tr>
					<tr>
						<td class="label">評点</td>
						<td class="value"><input type="text" id="r-grade" name="grade"></td>
					</tr>
					<tr>

						<td style="width: 200px; height: 50px;" class="label">作成日</td>
						<td class="value"><input type="date" id="r-date" name="date"></td>


					</tr>
					<tr>
						<td class="label">内容</td>
						<td class="value"><textarea name="r-story" id="r-story" rows="4" cols="50" placeholder="최대 300자"></textarea></td>
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

	<script type="text/javascript" src="js/userAddrUpdate.js?ver=1.1"></script>


</body>
</html>
