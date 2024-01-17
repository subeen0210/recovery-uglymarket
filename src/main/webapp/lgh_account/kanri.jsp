

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="wr_company/css/kanri.css?ver=1.2">
<!-- <link rel="stylesheet" href="wr_company/css/modal.css"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>配送住所管理</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src="js/userAddrUpdate.js?ver=1.3"></script>
</head>
<body>
	<div class="main">
		<h1>会員住所管理</h1>

		<h2>配送先住所リスト</h2>

		<table border="1">
			<thead>
				<tr>
					<th>名前</th>
					<th>郵便番号</th>
					<th>住所</th>
					<th>電話番号</th>
					<th>到着希望時間</th>
					<th>基本配送先<th>
					<th>修正</th>
					<th>削除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="addr" items="${address }">
					<tr>
						<td>${addr.a_name }</td>
						<td>${addr.a_postcode }</td>
						<td>${addr.a_addr }&nbsp;&nbsp;${addr.a_addrDetail }</td>
						<td>${addr.a_tel }</td>
						<td>${addr.a_req }</td>
						<td><a class="address_select" style="cursor: pointer;">基本</a></td>
						<td><a class="openModalBtn" style="cursor: pointer;">修正</a></td>
						<td><a href="deleteAddress.jsp?id=1">削除</a></td>
					</tr>
				</c:forEach>



			</tbody>
		</table>

		<br> <a href="lgh_account/addrPopup.jsp">新しい住所追加</a>

	</div>

	<dialog id="myModal" class="modal">
	<div class="modal-content">
		<span class="close" id="closeModalBtn">&times;X</span>

		<form action="postAddC" method="post" enctype="multipart/form-data">
			<div class="reg-content">
				<div class="reg-menu">名前</div>
				<div class="reg-input">
					<input class="input-style" name="" />
				</div>
			</div>
			<div class="reg-content">
				<div class="reg-menu">電話番号</div>
				<div class="reg-input">
					<input class="input-style" name="" />
				</div>
			</div>
			<div class="reg-content">
				<div class="reg-menu">到着時間</div>
				<div class="reg-input">
					<select id="deliveryTime" name="deliveryTime">
						<!-- 							option 태그로 각 선택 옵션을 정의 -->
						<option value="午前中(8:00~12:00)">午前中(8:00~12:00)</option>
						<option value="12:00~14:00">12:00~14:00</option>
						<option value="14:00~16:00">14:00~16:00</option>
						<option value="16:00~:18:00">16:00~:18:00</option>
						<option value="18:00~20:00">18:00~20:00</option>
						<option value="19:00~21:00">19:00~21:00</option>
					</select>
				</div>
			</div>
			<div class="reg-content">
				<div class="reg-name2">郵便番号</div>
				<div class="reg-name3">
					<button class="btn-style" type="button" id="addr-popup">住所検索</button>
					<br />
				</div>
			</div>
			<br />
			<div class="reg-content">
				<div class="reg-menu">郵便番号</div>
				<div class="reg-input">
					<input class="input-style" name="userAddrN" id="addrNum"
						readonly="readonly" />
				</div>
			</div>
			<div class="reg-content">
				<div class="reg-menu">都道府県</div>
				<div class="reg-input">
					<input class="input-style" name="userAddrP" id="addrPrefecture"
						readonly="readonly" />
				</div>
			</div>
			<div class="reg-content">
				<div class="reg-menu">市区町村</div>
				<div class="reg-input">
					<input class="input-style" name="userAddrC" id="addrCity"
						readonly="readonly" />
				</div>
			</div>
			<div class="reg-content">
				<div class="reg-menu">詳細情報</div>
				<div class="reg-input">
					<input class="input-style" name="userAddrD" />
				</div>

			</div>
			<button type="submit">登録</button>
		</form>
	</div>
	</dialog>

</body>
</html>