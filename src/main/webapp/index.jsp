<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<link rel="stylesheet" href="wj/css/index.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="wj/js/index.js"></script>
<title>Document</title>
</head>
<body>
	<div class="header">
		<a class="header-logo" href="#"> <img src="img/semi-logo-img.png"
			alt="" /> <img src="img/semi-logo-title.png" alt="Website Logo" />
		</a>

		<div class="header-menu">
			<div>
				<a href="">会社紹介</a>
			</div>
			&emsp;&emsp;&emsp;&emsp;&emsp;
			<div>
				<a href="ShopC">モール</a>
			</div>
		</div>
		<div class="header-icon">
			<jsp:include page="${loginChange }"></jsp:include> &emsp;&emsp; <a href=""><img
				class="cart-icon" src="img/semi-cart-icon.png" alt="" /></a>
			&emsp;&emsp; <a href=""><img class="search-icon"
				src="img/semi-search-icon.png" alt="" /></a>
		</div>
	</div>

	<table id="site">
		<tr>
			<td><jsp:include page="${contentPage }"></jsp:include></td>
		</tr>
	</table>
	
</body>
<footer>
	<div class="container">
		<div class="footer1">
			<div>
				<span class="a-footer">利用規約</span>&emsp;&emsp;
			</div>
			<div>
				<span class="a-footer">個人情報処理方針</span> &emsp;&emsp;
			</div>
			<div>
				<span class="a-footer">電子金融取引約款</span>&emsp;&emsp;
			</div>
			<div>
				<span class="a-footer">安全取引政策</span>&emsp;&emsp;
			</div>
		</div>
		<div class="footer2">
			<div class="footer3">アグリーマーケット株式会社 | 代表:キム·ヨンミン | 事業者登録番号:
				732-86-02604 | 通販業届出番号:2022-衿川-2280</div>
			<div class="footer3">本社:忠清南道天安市東南区大興路321、501 | 支店:
				ソウル特別市城北区花郎路13ギル59,518</div>
			<div class="footer3">カスタマーセンター: 010 - 1111 - 1111</div>
			<div class="footer3">
				相談時間:月~金、午前10時~午後6時(週末/祝日
				お休み）&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;
				<button class="f_button">よくある質問</button>
				<button class="f_button">問い合わせ</button>
			</div>
		</div>
	</div>
</footer>
</html>