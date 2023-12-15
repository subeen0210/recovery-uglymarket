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
					$("#idStatus").text("사용 가능한 ID입니다.");
				} else if (response === "unavailable") {
					$("#idStatus").text("이미 사용 중인 ID입니다.");
				} else {
					$("#idStatus").text("ID 확인 중 오류가 발생했습니다.");
				}
			},
			error: function(xhr, status, error) {
				$("#idStatus").text("서버와 통신 중 오류가 발생했습니다.");
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
			 $('#pwConfirm').text('間違っています');
		} else {
			 $('#pwConfirm').text('正しいです');
		} 
	});
	
	$('#sellerPW').keyup(function() {
		 $('#pwConfirm').text(''); 
	});
	$('#sellerPWconfirm').keyup(function() {
		 if ($('#sellerPW').val() != $('#sellerPWconfirm').val()) {
			 $('#pwConfirm').text('間違っています');
		} else {
			 $('#pwConfirm').text('正しいです');
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
	let setLowerCase = "abcdefghijklmnopqrstuvwxyz";
	let setNumbers = "1234567890";
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

	// 아이디 예외
	// 2글자 이상
	// 한글, 특수문자 불가능(영어와 숫자만 가능)
	if (isEmpty(inputId) || lessThan(inputId, 2) || containKR(inputId)) {
		alert('IDなし');
		inputId.focus();
		$("#idStatus").text("");
		return false;
	}

	let idStatusText = $("#idStatus").text();
	if (idStatusText != "사용 가능한 ID입니다.") {
		if (idStatusText == "") {
			alert('ID 중복처리가 안됐습니다!');
			return false;
		} else {
			alert('ID가 중복입니다!');
			return false;
		}
	}
	// 패스워드 예외
	// 10자 이상
	// 소문자, 숫자, 특수문자 포함
	if (isEmpty(inputPW) || lessThan(inputPW, 10) || (notContains(inputPW, setLowerCase) || notContains(inputPW, setNumbers) || notContains(inputPW, setSpecialChars))) {
		alert('passwordなし');
		inputPW.focus();
		return false;
	}
	let pwCText = $("#pwConfirm").text();
	if (pwCText != "正しいです" || isEmpty(inputPWconfirm)) {
		alert('passwordの再確認が正しくありません。');
		inputPWconfirm.focus();
		return false;
	}
	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert('seiなし');
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert('meiなし');
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert('katakanaなし');
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert('katakanameiなし');
		inputKatF.focus();
		return false;
	}
	// 닉네임 예외
	// 특수문자 불가
	if (isEmpty(inputNick) || !(notContains(inputNick, setSpecialChars))) {
		alert('nicknameなし');
		inputNick.focus();
		return false;
	}
	// 전화 예외
	// 오직 숫자만
	if (isEmpty(inputTel1) || isNotNumber(inputTel1)) {
		alert('telがありません');
		inputTel1.focus();
		inputTel1.value = '';
		return false;
	} else if (isEmpty(inputTel2) || isNotNumber(inputTel2)) {
		alert('telがありません');
		inputTel2.focus();
		inputTel2.value = '';
		return false;
	} else if (isEmpty(inputTel3) || isNotNumber(inputTel3)) {
		alert('telがありません');
		inputTel3.focus();
		inputTel3.value = '';
		return false;
	}
	// 이메일 예외
	if (isEmpty(inputEmail)) {
		alert('emailなし');
		inputEmail.focus();
		return false;
	}
	// 주소 예외
	if (isEmpty(inputAddrN)) {
		alert('addrなし');
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
	let setLowerCase = "abcdefghijklmnopqrstuvwxyz";
	let setNumbers = "1234567890";
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

	// 아이디 예외
	// 2글자 이상
	// 한글, 특수문자 불가능(영어와 숫자만 가능)
	if (isEmpty(inputId) || lessThan(inputId, 2) || containKR(inputId)) {
		alert('IDなし');
		inputId.focus();
		$("#idStatus").text("");
		return false;
	}

	let idStatusText = $("#idStatus").text();
	if (idStatusText != "사용 가능한 ID입니다.") {
		if (idStatusText == "") {
			alert('ID 중복처리가 안됐습니다!');
			return false;
		} else {
			alert('ID가 중복입니다!');
			return false;
		}
	}
	// 패스워드 예외
	// 10자 이상
	// 소문자, 숫자, 특수문자 포함
	if (isEmpty(inputPW) || lessThan(inputPW, 10) || (notContains(inputPW, setLowerCase) || notContains(inputPW, setNumbers) || notContains(inputPW, setSpecialChars))) {
		alert('passwordなし');
		inputPW.focus();
		return false;
	}
	let pwCText = $("#pwConfirm").text();
	if (pwCText != "正しいです" || isEmpty(inputPWconfirm)) {
		alert('passwordの再確認が正しくありません。');
		inputPWconfirm.focus();
		return false;
	}
	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert('seiなし');
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert('meiなし');
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert('katakanaなし');
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert('katakanameiなし');
		inputKatF.focus();
		return false;
	}
	// 전화 예외
	// 오직 숫자만
	if (isEmpty(inputTel1) || isNotNumber(inputTel1)) {
		alert('telがありません');
		inputTel1.focus();
		inputTel1.value = '';
		return false;
	} else if (isEmpty(inputTel2) || isNotNumber(inputTel2)) {
		alert('telがありません');
		inputTel2.focus();
		inputTel2.value = '';
		return false;
	} else if (isEmpty(inputTel3) || isNotNumber(inputTel3)) {
		alert('telがありません');
		inputTel3.focus();
		inputTel3.value = '';
		return false;
	}
	// 팜 이미지
	if (isEmpty(inputFImg)) {
		alert('FarmImgなし');
		inputFImg.focus();
		return false;
	}
	// 팜 이름 예외
	// 특수문자 불가
	if (isEmpty(inputFName) || !(notContains(inputFName, setSpecialChars))) {
		alert('Farmnameなし');
		inputFName.focus();
		return false;
	}
	// 주소 예외
	if (isEmpty(inputAddrN)) {
		alert('addrなし');
		inputAddrN.focus();
		return false;
	}

};
