function incrementQuantity() {
	var quantityInput = document.getElementById("quantityInput");
	var currentQuantity = parseInt(quantityInput.value, 10);

	// 상품 수량 증가
	quantityInput.value = currentQuantity + 1;
}

function decrementQuantity() {
	var quantityInput = document.getElementById("quantityInput");
	var currentQuantity = parseInt(quantityInput.value, 10);

	// 최소 수량은 1로 설정
	if (currentQuantity > 1) {
		// 상품 수량 감소
		quantityInput.value = currentQuantity - 1;
	}
}

function goToCart(no, id) {
	let count = $('#quantityInput').val();
	//	console.log(count);
	if (id == "") {
		alert('ログイン後に使用できます。');
		location.href = 'LoginPageC';
	} else {
		$.ajax({
			url: 'SessionCheck', // 서버 측 코드가 처리하는 URL
			method: 'GET',
			success: function(response) {
				if (response == '0') {
					// 세션이 만료된 경우
					alert('ログインが切れました。ログインページに移動します。');
					location.href = 'LoginPageC';
				} else {
					location.href = 'RegCartC?no=' + no + '&count=' + count;
					//db에 cart를 담고. 카트 이동 유뮤
					let ok = confirm('カートに入れました。 カートで移動しますか？');
					if (ok) {
						location.href = 'CartAllC';
					}
				}
			}
		});
	};
};