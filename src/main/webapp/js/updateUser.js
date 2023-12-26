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

  alert("情報が更新されました");
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
  // 팜 이미지
  if (isEmpty(inputFImg)) {
    alert("農場のイメージを入れてください");
    inputFImg.focus();
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

function passwordChange() {
  let oldPW = $("#old-pw").val();
  let newPW = $("#new-pw").val();

  $.ajax({
    url: "ChangePasswordC",
    method: "post",
    data: { newPW },
    success: function (data) {
      // AJAX 요청 성공 시 실행되는 콜백 함수
      alert("비밀번호가 변경되었습니다.");
    },
    error: function (xhr, status, error) {
      // AJAX 요청 실패 시 실행되는 콜백 함수
      console.error("AJAX request failed: ", status, error);
    },
  });
  return false;
}

// 이미지 첨부시 미리보기 (원준)
