<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=1920, height=1080, initial-scale=1.0" charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="wj/css/home2.css" />
<script type="text/javascript" src="js/item.js"></script>
</head>
<body>
	<!-- bx 슬라이더 -->
	<ul class="bxslider">
		<li><img style="width: 100%;"
			src="https://static.wixstatic.com/media/541a79_44794d65115b4eb7b8597d90488b9550~mv2.jpg/v1/fill/w_1280,h_581,al_c,q_85,enc_auto/541a79_44794d65115b4eb7b8597d90488b9550~mv2.jpg"
			alt="Image 1" /><span class="text-overlay">農業を回復する<br />アグリーマーケット
		</span></li>
		<li><img style="width: 100%;"
			src="https://static.wixstatic.com/media/541a79_c2ee0a169f3b48c0afa9d2c30e357a67~mv2.jpg/v1/fill/w_1280,h_581,al_c,q_85,enc_auto/541a79_c2ee0a169f3b48c0afa9d2c30e357a67~mv2.jpg"
			alt="Image 2" /><span class="text-overlay2">安くて新鮮な農産物を<br />買うことができます！
		</span></li>
		<li><img style="width: 100%;"
			src="https://static.wixstatic.com/media/541a79_fd8dd9142c404814b2a9a986e0f7cd09~mv2.jpg/v1/fill/w_1280,h_581,al_c,q_85,enc_auto/541a79_fd8dd9142c404814b2a9a986e0f7cd09~mv2.jpg"
			alt="Image 1" /><span class="text-overlay2">アグリーマーケットには<br />特別な特典も用意しました！
		</span></li>
	</ul>

	<div class="main-item">

		<div class="item-text-discount">
			<span class="item-text-discount-detail">今週の新商品</span>
		</div>
		<div class="item-text-detail">
			<a href="ShopC">もっと見る</a>
		</div>

		<!-- 상품 3개 보이기 div -->
		<div>
			<div id="pagination"></div>
			<div id="data-container"></div>
		</div>
		<!-- <div></div> -->
		<h1 class="news-title">NEWS</h1>
		<br>
		<div class="news-position">
			<div class="news-content">
				<a target="_blank" rel="noopener noreferrer" href="https://financial-field.com/living/entry-225773"><div class="news-text1">ファイナンシャルプランナー</div>
				<div class="news-text2">5割以上の人がよく知らない<br>「規格外食品」。<br>野菜などを格安で買う方法は？</div>
				<div class="news-text3">2023.08.09</div></a>
			</div>
			<div class="news-content">
				<a target="_blank" rel="noopener noreferrer" href="https://www.chunichi.co.jp/article/753923"><div class="news-text1">中日新聞</div>
				<div class="news-text2">規格外野菜、<br>必要な家庭にどうぞ<br>「飛騨高山わらべうたの会」が支援</div>
				<div class="news-text3">2023.08.23</div></a>
			</div>
			<div class="news-content">
				<a target="_blank" rel="noopener noreferrer" href="https://mirasus.jp/sdgs/consumption-production/8771"><div class="news-text1">MIRASUS For SDGs</div>
				<div class="news-text2">規格外野菜の廃棄が<br>食品ロスの原因に！<br>廃棄量や販売サイトを紹介</div>
				<div class="news-text3">2022.12.21</div></a>
			</div>
			<div class="news-content">
				<a target="_blank" rel="noopener noreferrer" href="https://www.advertimes.com/20220817/article393137"><div class="news-text1">AdverTimes</div>
					<div class="news-text2">オイシックス・ラ・大地<br> 規格外の農作物をアプリで通知・販売</div>
					<div class="news-text3">2022.08.17</div></a>
			</div>
		</div>
	</div>

</body>
<script src="wj/js/home.js"></script>
</html>
