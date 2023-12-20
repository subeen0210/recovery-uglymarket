<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/regSeller.css" />
    <script
      src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="js/addr.js"></script>
    <script type="text/javascript" src="js/idCheck.js"></script>
    <script type="text/javascript" src="js/validCheck.js"></script>
  </head>
  <body>
    <form
      action="RegUserC"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return userCheck()"
    >
      <div class="reg-main">
        <div class="reg-container">
          <h1 style="color: #2a243a">Sign up</h1>
          <br />
          <div class="reg-content">
            <div class="reg-menu">ID</div>
            <div class="reg-input">
              <input
                class="input-style"
                name="sellerID"
                id="ID"
                maxlength="20"
              />&ensp;
              <button
                class="btn-style"
                type="button" id="checkDuplicate" value="seller"
              >
                重複確認
              </button>
            </div>
          </div>
          <span id="idStatus"></span>
          <div class="reg-content">
            <div class="reg-menu">PW</div>
            <div class="reg-input">
              <input
                class="input-style"
                name="sellerPW" type="password" id="sellerPW" maxlength="20"
              />
              <span id="pwStatus"></span>
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">PW Confirm</div>
            <div class="reg-input">
              <input
                class="input-style"
                type="password" id="sellerPWconfirm" placeholder="もう一度記入してください"
              />&ensp;
              <span id="pwConfirm"></span>
            </div>
          </div>
          <br />
          <div class="reg-content">
            <div class="reg-name">お名前</div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">姓</div>
            <div class="reg-input">
              <input class="input-style" name="sellerKanji_ln" />
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">名</div>
            <div class="reg-input">
              <input class="input-style" name="sellerKanji_fn" />
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">セイ</div>
            <div class="reg-input">
              <input class="input-style" name="sellerKata_ln" />
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">メイ</div>
            <div class="reg-input">
              <input class="input-style" name="sellerKata_fn" />
            </div>
          </div>
          <br />
          <div class="reg-content">
            <div class="reg-name">電話番号</div>
          </div>
          <div class="reg-content">
            <div class="reg-name">
              <input class="input-style3" name="sellerTel1" />&emsp;-&emsp;<input
                class="input-style3"
                name="sellerTel2"
              />&emsp;-&emsp;<input class="input-style3" name="sellerTel3" />
            </div>
          </div>
          <br />
          <div class="reg-content2">
            <div class="reg-name2">農場イメージ</div>
            &ensp;
            <label for="fileInput">アップロード</label
            ><input
              type="file"
              name="farmImg"
              id="fileInput"
              onchange="displayFileName(this)"
            />
            <span id="fileNameDisplay"></span>
          </div>
          <br />
          <div class="reg-content">
            <div class="reg-menu">農場名</div>
            <div class="reg-input">
              <input class="input-style" name="farmName" maxlength="10" />
            </div>
          </div>
          <br />
          <div class="reg-content3">
            <div class="reg-menu">農場説明</div>
            <div class="reg-input2">
              <textarea
                class="input-style2"
                name="farmStory"
                id=""
                cols="30"
                rows="10"
              ></textarea>
            </div>
          </div>
          <br />
          <div class="reg-content">
            <div class="reg-name2">農場 郵便番号</div>
            <div class="reg-name3">
              <button class="btn-style" type="button" id="addr-popup">
                住所検索</button
              ><br />
            </div>
          </div>
          <br />
          <div class="reg-content">
            <div class="reg-menu">郵便番号</div>
            <div class="reg-input">
              <input
                class="input-style"
                name="sellerAddrN" id="addrNum"
                readonly="readonly"
              />
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">都道府県</div>
            <div class="reg-input">
              <input
                class="input-style"
                name="sellerAddrP" id="addrPrefecture"
                readonly="readonly"
              />
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">市区町村</div>
            <div class="reg-input">
              <input
                class="input-style"
                name="sellerAddrC" id="addrCity"
                readonly="readonly"
              />
            </div>
          </div>
          <div class="reg-content">
            <div class="reg-menu">詳細情報</div>
            <div class="reg-input">
              <input class="input-style" name="sellerAddrD" />
            </div>
          </div>
          <br />
          <div class="reg-content">
            <div class="reg-name">
              <button class="btn-style">Sign Up</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </body>
  <script type="text/javascript" src="js/regUser.js"></script>
</html>
