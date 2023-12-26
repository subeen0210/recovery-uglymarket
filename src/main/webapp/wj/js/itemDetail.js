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
  document.getElementById("usernameDisplay").innerText =
    "ニックネーム: " + maskedUsername + "님";
}



// 최수빈 쿠키 생성 코드 작성
function getProductIdFromURL() {
    let urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('no');
}

	let productId = getProductIdFromURL();
	//console.log('productId:', productId);
	addRecentProduct(productId);

// 상품을 추가하는 함수
function addRecentProduct(productId) {
    let recentProducts = getRecentProductIds() || [];

    // 이미 최근 본 상품 목록에 있는지 확인
    if (!recentProducts.includes(productId)) {
        recentProducts.unshift(productId);

        if (recentProducts.length > 3) {
            recentProducts.pop();
        }
        saveRecentProductIds(recentProducts);
    }
}

// 최근 본 상품 목록을 저장하는 함수 (쿠키 또는 다른 저장소에 저장)
function saveRecentProductIds(recentProducts) {
    createCookie('recentProducts', recentProducts.join(','), 1);
    console.log('쿠키 생성 완료');
}

// 최근 본 상품 목록을 가져오는 함수
function getRecentProductIds() {
    let cookieValue = getCookie('recentProducts');
    const recentProducts = cookieValue ? cookieValue.split(',') : [];
    console.log('최근 본 상품 목록:', recentProducts);
    return recentProducts;
}

// 쿠키 생성 함수
function createCookie(name, value, days) {
    let expires = '';
    if (days) {
        const date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = '; expires=' + date.toUTCString();
    }
    document.cookie = name + '=' + value + expires + '; path=/';
}

// 쿠키 조회 함수
function getCookie(name) {
    const nameEQ = name + '=';
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i];
        while (cookie.charAt(0) === ' ') cookie = cookie.substring(1, cookie.length);
        if (cookie.indexOf(nameEQ) === 0) return cookie.substring(nameEQ.length, cookie.length);
    }
    return null;
}