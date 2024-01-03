/**
 * 
 */
function loginCall(backUrl) {
	let userID = document.querySelector('#loginUserID');
	let userPW = document.querySelector('#loginUserPW');

	if (isEmpty(userID)) {
		$("#loginEmptyID").text("IDが空いています");
		$("#loginEmptyID").css("color", "red");
		userID.focus();
		return false;
	};
	if (isEmpty(userPW)) {
		$("#loginEmptyPW").text("パスワードが空いています");
		$("#loginEmptyPW").css("color", "red");
		userPW.focus();
		return false;

	};

	userlogin(backUrl);
};

$(function() {

	document.getElementById("loginUserID").addEventListener("keyup", function() {
		var emptyMsg = document.getElementById("loginEmptyID");
		if (this.value.trim() !== "") {
			emptyMsg.textContent = ""; // 글자가 입력되면 에러 메시지를 숨김
		}
	});

	document.getElementById("loginUserPW").addEventListener("keyup", function() {
		var emptyMsg = document.getElementById("loginEmptyPW");
		if (this.value.trim() !== "") {
			emptyMsg.textContent = ""; // 글자가 입력되면 에러 메시지를 숨김
		}
	});

	document.getElementById("loginSellerID").addEventListener("keyup", function() {
		var emptyMsg = document.getElementById("loginEmptyID2");
		if (this.value.trim() !== "") {
			emptyMsg.textContent = ""; // 글자가 입력되면 에러 메시지를 숨김
		}
	});

	document.getElementById("loginSellerPW").addEventListener("keyup", function() {
		var emptyMsg = document.getElementById("loginEmptyPW2");
		if (this.value.trim() !== "") {
			emptyMsg.textContent = ""; // 글자가 입력되면 에러 메시지를 숨김
		}
	});
	
 $("#loginUserPW").keypress(function(event) {
        if (event.which === 13) { // 13은 엔터 키의 keyCode
            userlogin("HC"); //  엔터키를 눌렀을 떄 ID, PW 체크 후 HC로 되돌림
        }
    });
function userlogin(backUrl) {
	let userID = $("#loginUserID").val();
	let userPW = $("#loginUserPW").val();

	$.ajax({
		type: "post",
		url: "LoginPageC",
		data: { userID, userPW },
		success: function(response) {
			console.log(response);
			if (response === "0") {
				$("#loginEmptyPW").text("IDまたはパスワードが正しくありません。").css("color", "red");
			} else {
				location.href = backUrl;
			}
		},
		error: function(xhr, status, error) {
			$("#idStatus").text("서버와 통신 중 오류가 발생했습니다.");
			console.log('xhr: ', xhr);
			console.log('status: ', status);
			console.log('error: ', error);
		}
	});
}

});






function loginSellerCall(backUrl) {
	let sellerID = document.querySelector('#loginSellerID');
	let sellerPW = document.querySelector('#loginSellerPW');

	if (isEmpty(sellerID)) {
		$("#loginEmptyID2").text("IDが空いています");
		$("#loginEmptyID2").css("color", "red");
		sellerPW.focus();
		return false;
	};
	if (isEmpty(sellerPW)) {
		$("#loginEmptyPW2").text("パスワードが空いています");
		$("#loginEmptyPW2").css({
			"color": "red",
			"font-size": "16px"  // 여기에 적절한 크기를 지정합니다.
		});
		sellerPW.focus();
		return false;
	};

	sellerlogin(backUrl);
};


function sellerlogin(backUrl) {
	let sellerID = $("#loginSellerID").val();
	let sellerPW = $("#loginSellerPW").val();

	$.ajax({
		type: "post",
		url: "SellerLoginC",
		data: { sellerID, sellerPW },
		success: function(response) {
			console.log(response);
			if (response === "0") {
				$("#loginEmptyPW2").text("IDまたはパスワードが正しくありません。").css({
					"color": "red",
					"font-size": "12px"  // 여기에 적절한 크기를 지정합니다.
				});
			} else {
				location.href = backUrl;
			}
		},
		error: function(xhr, status, error) {
			$("#idStatus").text("서버와 통신 중 오류가 발생했습니다.");
			console.log('xhr: ', xhr);
			console.log('status: ', status);
			console.log('error: ', error);
		}
	});
};
