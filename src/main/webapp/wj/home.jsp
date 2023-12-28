<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=1920, height=1080, initial-scale=1.0"charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="wj/css/home.css" />

<script type="text/javascript" src="js/item.js"></script>
  </head>
  <body>
    <!-- bx 슬라이더 -->
    <ul class="bxslider">    
      <li>
        <img style="width: 1800px;" src="img/semi-main-slider.png" alt="Image 1" /><span
          class="text-overlay"
          >農業を回復する<br />アグリーマーケット
        </span>
      </li>
      <li>
        <img style="width: 1800px;" src="img/semi-main-slider.png" alt="Image 1" /><span
          class="text-overlay"
          >農業を回復する<br />アグリーマーケット
        </span>
      </li>
      <li>
        <img style="width: 1800px;" src="img/semi-main-slider.png" alt="Image 1" /><span
          class="text-overlay"
          >農業を回復する<br />アグリーマーケット
        </span>
      </li>
    </ul>

    <div class="main-item">
    
      <div class="item-text-discount">
        <span class="item-text-discount-detail">今週の特価セール</span>
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
	

      <div class="item-img-news">
        <img
          src="img/semi-main-item-img-news.png"
          alt=""
          class="item-img-news-position"
        />
        
        <div class="item-img-news-link-position">
        <br>
          <div class="item-img-news-link-position-img">
           <a href="https://financial-field.com/living/entry-225773"><img src="img/semi-main-item-img-news-rectangle.png" alt="" />
</a>          

            <a href="https://www.chunichi.co.jp/article/753923"><img src="img/semi-main-item-img-news-rectangle2.png" alt="" />
            </a>
          </div>
          <div class="item-img-news-link-position-img">
            <a href="https://mirasus.jp/sdgs/consumption-production/8771"><img src="img/semi-main-item-img-news-rectangle3.png" alt="" />
            </a>
            <a href="https://www.advertimes.com/20220817/article393137"><img src="img/semi-main-item-img-news-rectangle4.png" alt="" />
            </a>
          </div>
        </div>
      </div>
    </div>
    <br />
  </body>
  <script src="wj/js/home.js"></script>
</html>
