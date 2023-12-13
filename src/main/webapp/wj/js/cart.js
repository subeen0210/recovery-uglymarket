// 초기 수량
let currentQuantity = 1;

// 수량 증가 함수
function increaseQuantity() {
    currentQuantity += 1;
    updateQuantityInput();
}

// 수량 감소 함수
function decreaseQuantity() {
    if (currentQuantity > 1) {
        currentQuantity -= 1;
        updateQuantityInput();
    }
}

// 수량 입력창 업데이트 함수
function updateQuantityInput() {
    document.getElementById('quantityInput').value = currentQuantity;
}