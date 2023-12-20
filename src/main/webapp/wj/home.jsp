<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=1920, height=1080, initial-scale=1.0"charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="wj/css/home.css" />
<script type="text/javascript" src="pagination/pagination.js"></script>
<script type="text/javascript" src="pagination/pagination.min.js"></script>
<link rel="stylesheet" href="pagination/pagination.css">
<script type="text/javascript" src="js/item.js"></script>
  </head>
  <body>
    <!-- bx 슬라이더 -->
    <ul class="bxslider">    
      <li>
        <img src="img/semi-main-slider.png" alt="Image 1" /><span
          class="text-overlay"
          >農業を回復する<br />アグリーマーケット
        </span>
      </li>
      <li>
        <img src="img/semi-main-slider.png" alt="Image 1" /><span
          class="text-overlay"
          >農業を回復する<br />アグリーマーケット
        </span>
      </li>
      <li>
        <img src="img/semi-main-slider.png" alt="Image 1" /><span
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
          <div class="item-img-news-link-position-img">
            <img src="img/semi-main-item-img-news-rectangle.png" alt="" />
            <img
              class="news-inner-img"
              src="img/semi-main-item-news-text-img.png"
              alt=""
            /><img
              class="news-inner-img2"
              src="img/semi-main-item-news-text-first-img.png"
              alt=""
            /><img
              class="news-inner-img3"
              src="img/semi-main-item-news-text-first-img-date.png"
              alt=""
            />
            <img src="img/semi-main-item-img-news-rectangle.png" alt="" />
            <img
              class="news-inner-img4"
              src="img/semi-main-item-news-text-first-img3.png"
              alt=""
            /><img
              class="news-inner-img5"
              src="img/semi-main-item-news-text-third-img.png"
              alt=""
            /><img
              class="news-inner-img6"
              src="img/semi-main-item-news-text-third-img-date.png"
              alt=""
            />
          </div>
          <div class="item-img-news-link-position-img">
            <img src="img/semi-main-item-img-news-rectangle.png" alt="" />
            <img
              class="news-inner-img7"
              src="img/semi-main-item-news-text-first-img4.png"
              alt=""
            /><img
              class="news-inner-img5"
              src="img/semi-main-item-news-text-four-img.png"
              alt=""
            /><img
              class="news-inner-img6"
              src="img/semi-main-item-news-text-four-img-date.png"
              alt=""
            />
            <img src="img/semi-main-item-img-news-rectangle.png" alt="" />
            <img
              class="news-inner-img"
              src="img/semi-main-item-news-text-first-img2.png"
              alt=""
            /><img
              class="news-inner-img2"
              src="img/semi-main-item-news-text-second-img.png"
              alt=""
            /><img
              class="news-inner-img3"
              src="img/semi-main-item-news-text-second-img-date.png"
              alt=""
            />
          </div>
        </div>
      </div>
    </div>
    <br />
  </body>
</html>
