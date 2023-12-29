document.addEventListener("DOMContentLoaded", function () {
  // HTML에서 요소들을 가져옵니다.
  var decrementButton = document.getElementById("decrement");
  var incrementButton = document.getElementById("increment");
  var quantityInput = document.getElementById("quantity");

  // 감소 버튼 클릭 시
  decrementButton.addEventListener("click", function () {
    // 현재 수량을 가져와서 1 감소시킵니다.
    var currentQuantity = parseInt(quantityInput.value, 10);
    if (currentQuantity > 1) {
      quantityInput.value = currentQuantity - 1;
    }
  });

  // 증가 버튼 클릭 시
  incrementButton.addEventListener("click", function () {
    // 현재 수량을 가져와서 1 증가시킵니다.
    var currentQuantity = parseInt(quantityInput.value, 10);
    quantityInput.value = currentQuantity + 1;
  });
});

document.addEventListener("DOMContentLoaded", function () {
  // HTML에서 요소들을 가져옵니다.
  var stars = document.querySelectorAll(".star");
  var ratingValue = document.getElementById("rating-value");

  // 별 클릭 시 이벤트를 추가합니다.
  stars.forEach(function (star) {
    star.addEventListener("click", function () {
      var rating = this.getAttribute("data-value");
      ratingValue.textContent = rating;
    });
  });
});

function maskUsername(username) {
  if (username.length <= 3) {
    return username;
  } else {
    const maskedPart = "*".repeat(username.length - 3);
    return username.substring(0, 3) + maskedPart;
  }
}

// 예시로 초기 닉네임을 설정
let originalUsername = "example_user";
updateMaskedUsername();

// 닉네임이 변경될 때마다 호출되는 함수
function updateMaskedUsername() {
  const maskedUsername = maskUsername(originalUsername);
  document.getElementsByClassName("usernameDisplay").innerText =
    "ニックネーム: " + maskedUsername + "님";
}

// 최수빈 후기 코드
//function reviewShow() {
//    $.ajax({
//        url: 'ShopDetailC',
//        datatype: 'json'
//    }).done(function (data) {
//	console.log(data);
//        for (let i = 0; i < data.length; i++) {
//            let dateObject = new Date(data[i].r_data.replace(/월|일/g, '').trim());
//            let year = dateObject.getFullYear();
//            let month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
//            let day = dateObject.getDate().toString().padStart(2, '0');
//            let formattedDate = year + "-" + month + "-" + day;
//
//            let grade = data[i].r_grade;
//            let username = data[i].r_nickname;
//            let reviewText = data[i].r_estimation;
//
//            // 리뷰를 표시할 HTML 생성
//            let reviewHTML = `
//                <div class="review-input">
//                    <div class="input-menu">
//                        <div class="usernameDisplay">${username}</div>
//                        <div class="input-date">${formattedDate}</div>
//                        <div class="input-grade">${grade}</div>
//                    </div>
//                    <div class="input-text">${reviewText}</div>
//                </div>
//            `;
//
//            // 리뷰를 'review-input' 클래스에 추가
//            $('.review-input').append(reviewHTML);
//        }
//    });
//}