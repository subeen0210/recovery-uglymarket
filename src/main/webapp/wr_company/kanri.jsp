<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="wr_company/css/kanri.css">
<link rel="stylesheet" href="wr_company/css/modal.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송 주소 관리</title>
<script>

	var modal = document.getElementById('myModal');
	var btn = document.getElementById('openModalBtn');
	var span = document.getElementsByClassName('close')[0];

	btn.onclick = function() {
		modal.style.display = 'block';
	}

	span.onclick = function() {
		modal.style.display = 'none';
	}

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = 'none';
		}
	}

</script>
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
					<th>携帯電話</th>
					<th>修正</th>
					<th>削除</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>小田さくら</td>
					<td>252-0001</td>
					<td>神奈川県座間市相模が丘</td>
					<td>080-1234-5678</td>
					<td><a id="openModalBtn">修正</a></td>
					<td><a href="deleteAddress.jsp?id=1">削除</a></td>
				</tr>
			


			</tbody>
		</table>

		<br> <a href="../lgh_account/addrPopup.jsp">新しい住所追加</a>

	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			
			<form action="postAddC" method="post" enctype="multipart/form-data">
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
	</div>

</body>
</html>