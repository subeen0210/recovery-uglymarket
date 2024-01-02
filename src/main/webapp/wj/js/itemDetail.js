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

function calculateAndLogAverage(reviews) {
    // 평균 계산 함수
    function calculateAverage(ratings) {
        if (ratings.length === 0) return 0;
        var sum = ratings.reduce((acc, val) => acc + val.r_grade, 0);
        return sum / ratings.length;
    }

    // 평균 값 계산
    var averageRating = calculateAverage(reviews);

    // 콘솔에 출력
    console.log("평균 평점: " + averageRating);

    // 여기에서 다른 원하는 작업을 수행할 수 있습니다.
}


function maskUsername(username) {
  if (username.length <= 3) {
    return username;
  } else {
    const maskedPart = "*".repeat(username.length - 3);
    return username.substring(0, 3) + maskedPart;
  }
}
