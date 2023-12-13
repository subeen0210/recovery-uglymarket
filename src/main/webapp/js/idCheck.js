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


});

function userCheck() {
	let inputId = document.querySelector('input[name="userID"]');
	let inputPW = document.querySelector('input[name="userPW"]');
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

	// 아이디 예외
	// 한글, 특수문자 불가능(영어와 숫자만 가능)
	if (isEmpty(inputId)) {
		alert('IDなし');
		inputId.focus();
		return false;
	}
	// 패스워드 예외
	// 10자 이상
	// 소문자, 숫자, 특수문자 포함
	if (isEmpty(inputPW)) {
		alert('passwordなし');
		inputPW.focus();
		return false;
	}
	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert('IDなし');
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert('IDなし');
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert('IDなし');
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert('IDなし');
		inputKatF.focus();
		return false;
	}
	// 닉네임 예외
	// 특수문자 불가
	if (isEmpty(inputNick)) {
		alert('IDなし');
		inputNick.focus();
		return false;
	}
	// 전화 예외
	if (isEmpty(inputTel1)) {
		alert('tel1がありません');
		inputTel1.focus();
		return false;
	} else if (isEmpty(inputTel2)) {
		alert('tel2がありません');
		inputTel2.focus();
		return false;
	} else if (isEmpty(inputTel3)) {
		alert('tel3がありません');
		inputTel3.focus();
		return false;
	}
	// 이메일 예외
	if (isEmpty(inputEmail)) {
		alert('IDなし');
		inputEmail.focus();
		return false;
	}
	// 주소 예외
	if (isEmpty(inputAddrN)) {
		alert('IDなし');
		inputAddrN.focus();
		return false;
	}

};
