// AJAX 호출을 담당하는 함수
function updateQuantity(cartCode, value) {
	console.log(cartCode);
	// AJAX 요청을 수행하고 서버에 데이터 전송
	$.ajax({
		url: 'updateCartCount', // 실제로는 서버의 엔드포인트 URL로 대체해야 합니다.
		method: 'GET',
		data: { quantity: value, no: cartCode  },
		dataType : "json",
		success: function(response) {
			let totalCartPrice = response.totalCartPrice;
        	let selectedCartPrice = response.selectedCartPrice;
			console.log(totalCartPrice);
			console.log(selectedCartPrice);
			// 성공적으로 처리된 경우 추가적인 로직을 수행할 수 있습니다.
			$(`#set-allprice_${cartCode}`).text(selectedCartPrice);
			$(`#set-allprice2_${cartCode}`).attr('data-subtotal', selectedCartPrice);
		},
		error: function(error) {
			console.error('AJAX 요청 실패:', error);
		}
	});
}

// 수량을 증가 또는 감소시키는 함수
function adjustQuantity(cartCode, delta) {
	// 현재 값 가져오기
	let inputField = $(`#quantityInput_${cartCode}`);
	let currentValue = parseInt(inputField.val());


	// 값 증가 또는 감소
	let newValue = currentValue + delta;

	// 값이 1보다 작아지지 않도록 보장
	if (newValue < 1) {
		newValue = 1;
	}

	// 변경된 값을 입력 필드에 설정
	inputField.val(newValue);

	// 변경된 값을 서버에 업데이트
	 updateQuantity(cartCode, newValue);
}

