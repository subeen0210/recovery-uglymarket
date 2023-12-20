/**
 * 
 */
$(function() {
	$("#checkDuplicate").click(function() {
		// 클라이언트에서 입력한 ID 가져오기
		let ID = $("#ID").val();
		console.log(ID);
		let table = $("#checkDuplicate").val();
		console.log(table);

		// 서버로 ID 전송 및 중복 확인
		$.ajax({
			type: "post",
			url: "IDCheckDuplicateC", // 서버에서 ID 중복 확인을 수행하는 API 엔드포인트
			data: { ID, table },
			success: function(response) {
				console.log(response);
				if (response === "available") {
					$("#idStatus").text("使用可能です。").css("color", "green");
				} else if (response === "unavailable") {
					$("#idStatus").text("すでに使用中のIDです。").css("color", "red");
				} else {
					$("#idStatus").text("IDの確認中にエラーが発生しました。").css("color", "red");
				}
			},
			error: function(xhr, status, error) {
				$("#idStatus").text("サーバーとの通信中にエラーが発生しました。").css("color", "red");
				console.log('xhr: ', xhr);
				console.log('status: ', status);
				console.log('error: ', error);
			}
		});
	});

	$("#ID").keyup(function() {
		// #ID의 내용이 변경될 때마다 #idStatus의 텍스트를 비움
		$("#idStatus").text("");
	});

	$('#userPW').keyup(function() {
		 $('#pwConfirm').text(''); 
	});
	$('#userPWconfirm').keyup(function() {
		 if ($('#userPW').val() != $('#userPWconfirm').val()) {
			 $('#pwConfirm').text('間違っています').css("color", "red");
		} else {
			 $('#pwConfirm').text('正しいです').css("color", "green");
		} 
	});
	
	$('#sellerPW').keyup(function() {
		 $('#pwConfirm').text(''); 
	});
	$('#sellerPWconfirm').keyup(function() {
		 if ($('#sellerPW').val() != $('#sellerPWconfirm').val()) {
			 $('#pwConfirm').text('間違っています').css("color", "red");
		} else {
			 $('#pwConfirm').text('正しいです').css("color", "green");
		} 
	});

});

function userCheck() {
	let inputId = document.querySelector('input[name="userID"]');
	let inputPW = document.querySelector('input[name="userPW"]');
	let inputPWconfirm = document.querySelector('#userPWconfirm');
	let inputKanL = document.querySelector('input[name="userKanji_ln"]');
	let inputKanF = document.querySelector('input[name="userKanji_fn"]');
	let inputKatL = document.querySelector('input[name="userKata_ln"]');
	let inputKatF = document.querySelector('input[name="userKata_fn"]');
	let inputNick = document.querySelector('input[name="userNicname"]');
	let inputTel1 = document.querySelector('input[name="userTel1"]');
	let inputTel2 = document.querySelector('input[name="userTel2"]');
	let inputTel3 = document.querySelector('input[name="userTel3"]');
	let inputEmail = document.querySelector('input[name="userEmail"]');
	let inputAddrN = document.querySelector('input[name="userAddrN"]');
	console.log(inputId);
	let setLowerCase = "abcdefghijklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM";
	let setNumbers = "1234567890";
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

	// 아이디 예외
	// 2글자 이상
	// 한글, 일본어, 특수문자 불가능(영어와 숫자만 가능)
	if (isEmpty(inputId) || lessThan(inputId, 2) || containKR(inputId)) {
		alert('IDの条件が足りないです');
		inputId.focus();
		$("#idStatus").text("");
		return false;
	}

	let idStatusText = $("#idStatus").text();
	if (idStatusText != "使用可能です。") {
		if (idStatusText == "") {
			alert('IDが確認されていません');
			return false;
		} else {
			alert('すでに使用中のIDです。');
			return false;
		}
	}
	// 패스워드 예외
	// 10자 이상
	// 영어, 숫자, 특수문자 포함
	if (isEmpty(inputPW) || lessThan(inputPW, 10) || (notContains(inputPW, setLowerCase) || notContains(inputPW, setNumbers) || notContains(inputPW, setSpecialChars))) {
		alert('パスワードの条件が足りないです');
		inputPW.focus();
		return false;
	}
	let pwCText = $("#pwConfirm").text();
	if (pwCText != "正しいです" || isEmpty(inputPWconfirm)) {
		alert('パスワードの再確認が正しくありません。');
		inputPWconfirm.focus();
		return false;
	}
	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert('姓がありません');
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert('名がありません');
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert('セイがありません');
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert('メイがありません');
		inputKatF.focus();
		return false;
	}
	// 닉네임 예외
	// 특수문자 불가
	if (isEmpty(inputNick) || !(notContains(inputNick, setSpecialChars))) {
		alert('ニックネームがありません');
		inputNick.focus();
		return false;
	}
	// 전화 예외
	// 오직 숫자만
	if (isEmpty(inputTel1) || isNotNumber(inputTel1)) {
		alert('電話番号は数字を入れてください');
		inputTel1.focus();
		inputTel1.value = '';
		return false;
	} else if (isEmpty(inputTel2) || isNotNumber(inputTel2)) {
		alert('電話番号は数字を入れてください');
		inputTel2.focus();
		inputTel2.value = '';
		return false;
	} else if (isEmpty(inputTel3) || isNotNumber(inputTel3)) {
		alert('電話番号は数字を入れてください');
		inputTel3.focus();
		inputTel3.value = '';
		return false;
	}
	// 이메일 예외
	if (isEmpty(inputEmail)) {
		alert('メールがありません');
		inputEmail.focus();
		return false;
	}
	// 주소 예외
	if (isEmpty(inputAddrN)) {
		alert('郵便番号がありません');
		inputAddrN.focus();
		return false;
	}

};


function sellerCheck() {
	let inputId = document.querySelector('input[name="sellerID"]');
	let inputPW = document.querySelector('input[name="sellerPW"]');
	let inputPWconfirm = document.querySelector('#sellerPWconfirm');
	let inputKanL = document.querySelector('input[name="sellerKanji_ln"]');
	let inputKanF = document.querySelector('input[name="sellerKanji_fn"]');
	let inputKatL = document.querySelector('input[name="sellerKata_ln"]');
	let inputKatF = document.querySelector('input[name="sellerKata_fn"]');
	let inputFName = document.querySelector('input[name="farmName"]');
	let inputTel1 = document.querySelector('input[name="sellerTel1"]');
	let inputTel2 = document.querySelector('input[name="sellerTel2"]');
	let inputTel3 = document.querySelector('input[name="sellerTel3"]');
	let inputAddrN = document.querySelector('input[name="sellerAddrN"]');
	let inputFImg = document.querySelector('input[name="farmImg"]');
	console.log(inputId);
	let setLowerCase = "abcdefghijklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM";
	let setNumbers = "1234567890";
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

	// 아이디 예외
	// 2글자 이상
	// 한글, 일본어, 특수문자 불가능(영어와 숫자만 가능)
	if (isEmpty(inputId) || lessThan(inputId, 2) || containKR(inputId)) {
		alert('IDの条件が足りないです');
		inputId.focus();
		$("#idStatus").text("");
		return false;
	}

	let idStatusText = $("#idStatus").text();
	if (idStatusText != "使用可能です。") {
		if (idStatusText == "") {
			alert('IDが確認されていません');
			return false;
		} else {
			alert('すでに使用中のIDです。');
			return false;
		}
	}
	// 패스워드 예외
	// 10자 이상
	// 영어, 숫자, 특수문자 포함
	if (isEmpty(inputPW) || lessThan(inputPW, 10) || (notContains(inputPW, setLowerCase) || notContains(inputPW, setNumbers) || notContains(inputPW, setSpecialChars))) {
		alert('パスワードの条件が足りないです');
		inputPW.focus();
		return false;
	}
	let pwCText = $("#pwConfirm").text();
	if (pwCText != "正しいです" || isEmpty(inputPWconfirm)) {
		alert('パスワードの再確認が正しくありません。');
		inputPWconfirm.focus();
		return false;
	}
	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert('姓がありません');
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert('名がありません');
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert('セイがありません');
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert('メイがありません');
		inputKatF.focus();
		return false;
	}
	// 전화 예외
	// 오직 숫자만
	if (isEmpty(inputTel1) || isNotNumber(inputTel1)) {
		alert('電話番号は数字を入れてください');
		inputTel1.focus();
		inputTel1.value = '';
		return false;
	} else if (isEmpty(inputTel2) || isNotNumber(inputTel2)) {
		alert('電話番号は数字を入れてください');
		inputTel2.focus();
		inputTel2.value = '';
		return false;
	} else if (isEmpty(inputTel3) || isNotNumber(inputTel3)) {
		alert('電話番号は数字を入れてください');
		inputTel3.focus();
		inputTel3.value = '';
		return false;
	}
	// 팜 이미지
	if (isEmpty(inputFImg)) {
		alert('農場のイメージを入れてください');
		inputFImg.focus();
		return false;
	}
	// 팜 이름 예외
	// 특수문자 불가
	if (isEmpty(inputFName) || !(notContains(inputFName, setSpecialChars))) {
		alert('農場の名前には特殊文字なしにしてください');
		inputFName.focus();
		return false;
	}
	// 주소 예외
	if (isEmpty(inputAddrN)) {
		alert('郵便番号がありません');
		inputAddrN.focus();
		return false;
	}

};
