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

function goToCart(no,id) {
	let count = $('#quantityInput').val();
//	console.log(count);
	if (id == "") {
		alert('ログイン後に使用できます。');
		location.href = 'LoginPageC';
	} else{
		location.href='RegCartC?no='+no+'&count='+count;
	//db에 cart를 담고. 카트 이동 유뮤
	let ok = confirm('카트에 담겼습니다. 카트로 이동하시겠습니까?');
	if(ok){
		location.href='CartAllC';
	}
	}
};