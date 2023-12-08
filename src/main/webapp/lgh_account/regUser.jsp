<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>

	<div>
	<h1>회원가입</h1>
	</div>
	<div>
		<div>ID</div>
		<div><input name="userID">중복확인</div>
	</div>
	<div>
		<div>Password</div>
		<div><input name="userPW" type="password"></div>
	</div>
	<div>
		<div>Password-Confirm</div>
		<div><input type="password"></div>
	</div>
	<div>
		<div>name</div>
		<div><input name="userName"></div>
	</div>
	<div>
		<div>tel</div>
		<div><input name="userTel1">-<input name="userTel2">-<input name="userTel3"></div>
	</div>
	<div>
		<div>email</div>
		<div><input name="userEmail" type="email"></div>
	</div>
	<div>
		<div>addr</div>
		<div><input name="userAddrno" id="zipcode"> <button id="zipaddr" >우편번호</button> </div>
		<div><input readonly="readonly" name="userAddrcity" value="address">불러온 내용</div>
		<div><input name="userAddrDetail">상세정보</div>
	</div>
	<div>
		<button>Sign Up</button>
	</div>
</div>
</body>
<script type="text/javascript">
const japanAddressApi = () => {
	  $.get("https://api.zipaddress.net/?zipcode=453-0809")
	    .done((address) => {
	      console.log(address.data);
	    })
	    .fail((error) => {
	      console.log(error);
	    });
	};
	japanAddressApi();
//jQueryなら$とかやってください
document.addEventListener('DOMContentLoaded', function() {
  
  // 検索ボタンなど
  var btn = document.getElementById('zipaddr');
  // 郵便番号データ
  var zipcode = document.getElementById('zipcode');

  // クリックイベントでリクエスト
  btn.addEventListener('click', function() {
    // リクエスト
    ZA.request(zipcode.value, function(data, err) {
      // エラーがあったか見つからない
      if ( err ) {
        return alert(data.message);
      }

      // データセット
      document.getElementById('address').value = data.fullAddress;
    });
  });
}, false);

</script>
</html>