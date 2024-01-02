<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="wr_company/css/kanri.css?ver=1.2">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src="js/addr.js?ver=1.1"></script>
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
						<td>${addr.a_addr }${addr.a_addrDetail }</td>
						<td>${addr.a_tel }</td>
						<td>${addr.a_req }</td>
						<td class="openModalBtn" data-no="${addr.a_no }">修正</td>
						<td class="addrDeleteBtn" onclick="deleteAddr('${addr.a_no }')">X</td>
					</tr>
				</c:forEach>




			</tbody>
		</table>
		<a id="openRegAddrBtn">新しい住所を追加</a>
	</div>


	<!-- dialog 태그 사용 -->
	<dialog id="myModal">
	<form action="updateAddrC" method="post" onsubmit="return updateCheck();">
		<div class="main_modal">

			<section class="order-details">
				<h2>住所修正</h2>
				<table class="order-info">
					<tr>
						<td class="label">受取人</td>
						<td class="value"><input class="input-style" id="nameInput"
							name="a_name" /></td>

					</tr>
					<tr>
						<td class="label">電話番号</td>
						<td class="value"><input class="input-style" id="telInput"
							name="a_tel" /></td>
					</tr>
					<tr>
						<td class="label">到着時間</td>
						<td class="value"><select id="deliveryTime"
							name="deliveryTime">
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
						<td class="value"><input class="input-style" name="userAddrN"
							id="addrNum" readonly="readonly" />
						<button class="btn-style" type="button" id="addr-popup">住所検索</button>
						</td>
					</tr>
					<tr>
						<td class="label">都道府県</td>
						<td class="value"><input class="input-style" name="userAddrP"
							id="addrPrefecture" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="label">市区町村</td>
						<td class="value"><input class="input-style" name="userAddrC"
							id="addrCity" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="label">詳細情報</td>
						<td class="value"><input class="input-style" name="userAddrD"
							id="addrDetail" /></td>
					</tr>
				</table>
				<button name="a_no" id="formUpBtn" style="width: 100px; height: 40px;">修正</button>
			</section>

		</div>
		<br>
		<button id="closeModalBtn" type="button"
			style="width: 30px; height: 30px; border: none;">X</button>
	</form>
	</dialog>


	<!-- 2번째 modal 창 -->

	<dialog id="myModal2">
	<form action="regAddrC" method="post" onsubmit="return regCheck();">
		<div class="main_modal">

			<section class="order-details">
				<h2>住所修正</h2>
				<table class="order-info">
					<tr>
						<td class="label">受取人</td>
						<td class="value value2"><input class="input-style"
							name="a_name" /></td>

					</tr>
					<tr>
						<td class="label">電話番号</td>
						<td class="value value2">
						<input class="input-style" name="a_tel1" style="width: 24%"/>
						- <input class="input-style" name="a_tel2" style="width: 24%"/>
						- <input class="input-style" name="a_tel3" style="width: 24%"/>
						</td>
					</tr>
					<tr>
						<td class="label">到着時間</td>
						<td class="value value2"><select 
							name="deliveryTime">
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
						<td class="value value2"><input class="input-style" name="userAddrN"
							id="addrNum2" readonly="readonly" />
						<button class="btn-style" type="button" id="addr-popup2">住所検索</button>
						</td>
					</tr>
					<tr>
						<td class="label">都道府県</td>
						<td class="value value2"><input class="input-style" name="userAddrP"
							id="addrPrefecture2" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="label">市区町村</td>
						<td class="value value2"><input class="input-style" name="userAddrC"
							id="addrCity2" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="label">詳細情報</td>
						<td class="value value2"><input class="input-style" name="userAddrD"/></td>
					</tr>
				</table>
				<button name="a_no" style="width: 100px; height: 40px;">修正</button>
			</section>

		</div>
		<br>
		<button id="closeModalBtn2" type="button"
			style="width: 30px; height: 30px; border: none;">X</button>
	</form>
	</dialog>

	<script type="text/javascript" src="js/userAddrUpdate.js?ver=1.2"></script>


</body>
</html>
