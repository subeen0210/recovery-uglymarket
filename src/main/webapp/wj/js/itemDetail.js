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

  // 초기화할 때 기본 값으로 채워줄 별 개수를 설정합니다.
  var initialRating = Math.round(gradeAvg != null ? gradeAvg.getR_grade() : 0);

  // 초기화할 때 별을 채워주는 함수 호출
  fillStars(initialRating);
});

// 별을 채워주는 함수
function fillStars(rating) {
  var stars = document.querySelectorAll(".star");

  // 모든 별의 클래스 초기화
  stars.forEach(function (star) {
    star.classList.remove("filled");
  });

  // 현재 클릭한 별의 이하 별들을 채웁니다.
  for (var i = 0; i < rating; i++) {
    stars[i].classList.add("filled");
  }
}


function maskUsername(username) {
  if (username.length <= 3) {
    return username;
  } else {
    const maskedPart = "*".repeat(username.length - 3);
    return username.substring(0, 3) + maskedPart;
  }
}
