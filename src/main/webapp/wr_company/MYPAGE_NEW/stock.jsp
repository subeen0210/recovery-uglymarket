<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="wr_company/MYPAGE_NEW/css/seller_register.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/modal.css">
<!--<link rel="stylesheet" href="css/header.css">-->
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


	<div class="content">
		<h2>在庫リスト</h2>

		<table border="1">
			<thead>
				<tr>
					<th>商品名</th>
					<th>財御量</th>
					<th>賞味期限</th>
					<th>価格</th>
					<th>修正</th>
					<th>削除</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>アグリージャガイモ</td>
					<td>3</td>
					<td>2023-12-31</td>
					<td>10000</td>
					<td><a id="openModalBtn">修正</a></td>
					<td><a href="deleteAddress.jsp?id=1">削除</a></td>
				</tr>



			</tbody>
		</table>

		<br>

	</div>
	<!-- 모달 내용 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>

			<form action="ItemAddC" method="post" enctype="multipart/form-data">
				<br> <br>
				<div>
					<div>
						<div>商品名</div>
						<div>
							<input name="name" class="name">
						</div>
					</div>
					<div>
						<div>商品の説明</div>
						<div>
							<textarea class="story" name="story"></textarea>
						</div>
					</div>
					<div>
						<div class="radio-container">
							商品種類 <label>アグリー<input type="radio" value="1" name="type"
								class="select"></label> <label>ふつう<input type="radio"
								value="2" name="type" class="select"></label>

						</div>
					</div>
					<div>
						<div>賞味期限</div>
						<div>
							<input name="enddate" type="date" class="date">
						</div>
					</div>
					<div>
						<div>商品在郷</div>
						<div>
							<input name="stock" class="stock">
						</div>
					</div>
					<div>
						<div>商品価格</div>
						<div>
							<input name="price" class="price">
						</div>
					</div>
					<div>
						<div>写真登録（一番目の写真が代表イメージになります。）</div>
						<div>
							<input type="file" name="img" class="img">
						</div>
						<!--  <div><input type="file" name="img2" class="img"></div>
			<div><input type="file" name="img3" class="img"></div>
			<div><input type="file" name="img4" class="img"></div>-->
					</div>
					<button type="submit">登録</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>