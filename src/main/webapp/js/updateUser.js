
/**
 * 정보수정
 */

let setLowerCase = "abcdefghijklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM";
let setNumbers = "1234567890";
let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

$(function() {
	// 비밀번호 키업하면 에러메세지 사라지게 
	$("#old-pw").keyup(function() {
		$("#PW-old-errorMsg").text("");
	});

	$("#new-pw").keyup(function() {
		// 비밀번호 검증 함수 호출
		validatePassword(this);
		$('#pwConfirm').text("");
	});

	$('#new-pw-confirm').keyup(function() {
		if ($('#new-pw').val() != $('#new-pw-confirm').val()) {
			$('#pwConfirm').text('間違っています').css("color", "red");
		} else {
			$('#pwConfirm').text('正しいです').css("color", "green");
		}
	});


});

function validatePassword(inputPW) {
	if (
		!(isEmpty(inputPW)) &&
		!(lessThan(inputPW, 10))
	) {

		if ((notContains(inputPW, setLowerCase) ||
			notContains(inputPW, setNumbers) ||
			notContains(inputPW, setSpecialChars))) {
			$("#pw-new-errorMsg").text(
				"英語、数字、特殊文字を１つ以上組み合わせてください"
			).css("font-size", "12px");
		} else {
			$("#pw-new-errorMsg").text("");
		}

	}

	else {
		// 오류가 있으면
		$("#pw-new-errorMsg").text(
			"10字~20字で入力してください"
		).css({ "color": "red", "font-size": "16px" });
	}
}


function userCheck() {
	let inputKanL = document.querySelector('input[name="userKanji_ln"]');
	let inputKanF = document.querySelector('input[name="userKanji_fn"]');
	let inputKatL = document.querySelector('input[name="userKata_ln"]');
	let inputKatF = document.querySelector('input[name="userKata_fn"]');
	let inputNick = document.querySelector('input[name="userNickname"]');
	let inputTel1 = document.querySelector('input[name="userTel1"]');
	let inputTel2 = document.querySelector('input[name="userTel2"]');
	let inputTel3 = document.querySelector('input[name="userTel3"]');
	let inputEmail = document.querySelector('input[name="userEmail"]');
	let img = document.querySelector('input[name="userImg"]');
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert("姓がありません");
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert("名がありません");
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert("セイがありません");
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert("メイがありません");
		inputKatF.focus();
		return false;
	}
	// 닉네임 예외
	// 특수문자 불가
	if (isEmpty(inputNick) || !notContains(inputNick, setSpecialChars)) {
		alert("ニックネームには特殊文字を入れないでください");
		inputNick.focus();
		return false;
	}
	// 전화 예외
	// 오직 숫자만
	if (isEmpty(inputTel1) || isNotNumber(inputTel1)) {
		alert("電話番号には数字を入れてください");
		inputTel1.focus();
		inputTel1.value = "";
		return false;
	} else if (isEmpty(inputTel2) || isNotNumber(inputTel2)) {
		alert("電話番号には数字を入れてください");
		inputTel2.focus();
		inputTel2.value = "";
		return false;
	} else if (isEmpty(inputTel3) || isNotNumber(inputTel3)) {
		alert("電話番号には数字を入れてください");
		inputTel3.focus();
		inputTel3.value = "";
		return false;
	}
	// 이메일 예외
	if (isEmpty(inputEmail)) {
		alert("メールがありません");
		inputEmail.focus();
		return false;
	}
}

function sellerCheck() {
	let inputKanL = document.querySelector('input[name="sellerKanji_ln"]');
	let inputKanF = document.querySelector('input[name="sellerKanji_fn"]');
	let inputKatL = document.querySelector('input[name="sellerKata_ln"]');
	let inputKatF = document.querySelector('input[name="sellerKata_fn"]');
	let inputFName = document.querySelector('input[name="farmName"]');
	let inputTel1 = document.querySelector('input[name="sellerTel1"]');
	let inputTel2 = document.querySelector('input[name="sellerTel2"]');
	let inputTel3 = document.querySelector('input[name="sellerTel3"]');
	let inputAddrN = document.querySelector('input[name="sellerAddrN"]');
	let inputFImg = document.querySelector('input[name="newFarmImg"]');
	console.log(inputId);
	let setLowerCase = "abcdefghijklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM";
	let setNumbers = "1234567890";
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

	// 한자 성 예외
	if (isEmpty(inputKanL)) {
		alert("姓がありません");
		inputKanL.focus();
		return false;
	}
	// 한자 이름 예외
	if (isEmpty(inputKanF)) {
		alert("名がありません");
		inputKanF.focus();
		return false;
	}
	// 카타카나 성 예외
	if (isEmpty(inputKatL)) {
		alert("セイがありません");
		inputKatL.focus();
		return false;
	}
	// 카타카나 이름 예외
	if (isEmpty(inputKatF)) {
		alert("メイがありません");
		inputKatF.focus();
		return false;
	}
	// 전화 예외
	// 오직 숫자만
	if (isEmpty(inputTel1) || isNotNumber(inputTel1)) {
		alert("電話番号には数字を入れてください");
		inputTel1.focus();
		inputTel1.value = "";
		return false;
	} else if (isEmpty(inputTel2) || isNotNumber(inputTel2)) {
		alert("電話番号には数字を入れてください");
		inputTel2.focus();
		inputTel2.value = "";
		return false;
	} else if (isEmpty(inputTel3) || isNotNumber(inputTel3)) {
		alert("電話番号には数字を入れてください");
		inputTel3.focus();
		inputTel3.value = "";
		return false;
	}

	// 팜 이름 예외
	// 특수문자 불가
	if (isEmpty(inputFName) || !notContains(inputFName, setSpecialChars)) {
		alert("農場の名前には特殊文字を入れないでください");
		inputFName.focus();
		return false;
	}
	// 주소 예외
	if (isEmpty(inputAddrN)) {
		alert("郵便番号がありません");
		inputAddrN.focus();
		return false;
	}
}



function passwordChange(loginPage) {
	let oldPW = $("#old-pw").val();
	let newPW = $("#new-pw").val();

	$.ajax({
		url: loginPage,
		method: "post",
		data: { oldPW },
		success: function(data) {
			let inputPWconfirm = document.querySelector("#new-pw-confirm");
			if (data == "0") {
				$("#PW-old-errorMsg").text("パスワードが正しくありません。").css("color", "red");
				$("#old-pw").focus();
			} else {
				// 현재 비밀번호가 맞을 때
				// 예외처리
				let inputPW2 = document.querySelector('#new-pw');
				if ($("#pw-new-errorMsg").text() != "" || isEmpty(inputPW2)) {
					alert('パスワードが正しくありません。');
					inputPW2.focus();
					return false;
				}

				let pwCText = $("#pwConfirm").text();
				if (pwCText.trim() != "正しいです" || isEmpty(inputPWconfirm)) {
					alert('パスワードの再確認が正しくありません。');
					inputPWconfirm.focus();
					return false;
				}

				$.ajax({
					url: "ChangePasswordC",
					method: "post",
					data: { newPW },
					success: function(data) {
						// AJAX 요청 성공 시 실행되는 콜백 함수
						alert("パスワードが変更されました。");
						$("#old-pw").val('');
						$("#new-pw").val('');
						inputPWconfirm.value = "";
						$('#pwConfirm').text("");

					},
					error: function(xhr, status, error) {
						// AJAX 요청 실패 시 실행되는 콜백 함수
						console.error("AJAX request failed: ", status, error);
					},
				});

			}
		},
		error: function(xhr, status, error) {
			// AJAX 요청 실패 시 실행되는 콜백 함수
			console.error("AJAX request failed: ", status, error);
		},
	});

	return false;
}


function loginCheck(loginPage) {
	$.ajax({
		url: 'SessionCheck', // 서버 측 코드가 처리하는 URL
		method: 'GET',
		success: function(response) {
			if (response == '0') {
				// 세션이 만료된 경우
				alert('ログインが切れました。ログインページに移動します。');
				location.href = 'LoginPageC';
			} else {
				passwordChange(loginPage);
			}
		}
	});
	return false;
}
