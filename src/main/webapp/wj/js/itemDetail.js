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


	let ratingFill = document.querySelector('.star-ratings-fill');
	var ratingValue = document.getElementById("rating-value").getAttribute("data-rating");
	console.log(ratingValue)
	ratingFill.style.width = (parseFloat(ratingValue) * 20) + '%';






});




//function maskUsername(username) {
//  if (username.length <= 3) {
//    return username;
//  } else {
//    const maskedPart = "*".repeat(username.length - 3);
//    return username.substring(0, 3) + maskedPart;
//  }
//}