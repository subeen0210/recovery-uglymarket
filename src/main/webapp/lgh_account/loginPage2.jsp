<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="wj/css/login.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Ubuntu"
      rel="stylesheet"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="path/to/font-awesome/css/font-awesome.min.css"
    />
    <title>Sign in</title>
  </head>
  

  <body>
    <div class="main">
    	<div>
    	<a href="HC"><img src="img/semi-logo-img.png"><img
		src="img/semi-logo-title.png"></a>
    	</div>
      <p class="sign">
        <img
          class="main-logo-img"
          src="img/semi-logo-img.png"
        />Sign in
      </p>
      <form class="form1">
        <input class="un" type="text" placeholder="ID" />
        <input class="pass" type="password" placeholder="PW" />
        <br />
        <a class="submit">ログイン</a><br />
        <a class="submit">ログイン&ensp;(販売者専用)</a>
        <p class="forgot"><a href="#">Forgot Password?</a></p>
      </form>
      <div class="reg-title"><img class="reg-title-img" src="/src/main/webapp/img/reg-img.png" alt=""></div>
      <div class="reg">
        <div class="reg-personal">
          <img
            class="peronal-img"
            src="img/personal.png"
            alt=""
          /><br />個人向け
        </div>
        <div class="reg-business">
          <img
            class="business-img"
            src="img/celler.png"
            alt=""
          /><br />販売者向け
        </div>
      </div>
    </div>
  </body>
</html>
