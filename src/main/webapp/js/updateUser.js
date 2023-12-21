/**
 * 유저 정보수정
 */

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
	let setSpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>?/";

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
	
	alert('情報が更新されました');
};