<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function() {
	alert('11');
	const japanAddressApi = () => {
		  let searchValue; // 우편번호가 들어갈 변수 선언
		  $(".search").on("input", () => {
		    searchValue = $(".search").val();
		  });
		  
		  $(".search-btn").on("click", () => {
		    $.get(`https://api.zipaddress.net/?zipcode=${searchValue}`)
		      .done((address) => {
		        console.log(address);
		        const addressTemplate = `
		          <p class="address-text">${address.data.fullAddress}</p>
		        `;
		        $(".address").append(addressTemplate);
		      })
		      .fail((error) => {
		        console.log(error);
		      });
		  });
		};
		japanAddressApi();
	
})
</script>
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
		<h1>일본 우편번호 검색</h1>
        <div class="search-bar">
          <input class="search" type="text" />
          <button class="search-btn">검색</button>
        </div>
      </header>
      <aside>
        <p>주소가 나올 텍스트</p>
      </aside>
      </div>
	<div>
		<button>Sign Up</button>
	</div>
</div>
</body>
</html>