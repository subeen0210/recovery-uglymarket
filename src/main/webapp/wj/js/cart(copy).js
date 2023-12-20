// 전체 선택 체크박스 요소 가져오기
let checkAll = document.getElementById("checkAll");
let priceAll = document.getElementById('payAllMoneySpan');
// 각 항목의 체크박스 요소 가져오기
let checkboxes = document.querySelectorAll(".item-checkbox");
let totalP = 0;
// 전체 선택 체크박스의 변경 이벤트 처리
checkAll.addEventListener("click", function() {
	const isChecked = checkAll.checked;

	if (isChecked) {
		// 모두 체크
		for (const checkbox of checkboxes) {
			checkbox.checked = true;
			totalP += parseInt(checkbox.parentNode.parentNode.querySelector('.set-allprice').getAttribute("data-subtotal"));
			console.log(parseInt(checkbox.parentNode.parentNode.querySelector('.set-allprice').getAttribute("data-subtotal")));
		}
		totalP = updateTotalPrice();
		priceAll.innerText = totalP;
	}

	else {
		// 모두 체크 안함
		for (const checkbox of checkboxes) {
			checkbox.checked = false;
		}
		priceAll.innerText = 0;
		totalP = 0;
	}


});
//////////////////////////////////////////////////////
for (const checkbox of checkboxes) {
	checkbox.addEventListener('click', function() {

		const totalCnt = checkboxes.length;

		const checkedCnt = document.querySelectorAll('.item-checkbox:checked').length;

		// 개별 선택의 변경에 따른 전체선택 체크박스의 체크유무
		if (totalCnt == checkedCnt) {
			document.querySelector('#checkAll').checked = true;
		}
		else {
			document.querySelector('#checkAll').checked = false;
		}

	});

}



// 체크된거 가격 추가하거나 뺴기

function selectTotalPrice(checkbox) {
	let subtotalElement = checkbox.parentNode.parentNode.querySelector('.set-allprice');
	let subtotal = parseFloat(subtotalElement.dataset.subtotal);
	let totalPrice = parseInt(priceAll.innerText);
	if (checkbox.checked) {
		totalPrice += subtotal;
	} else {
		totalPrice -= subtotal;
		totalP = 0;
	}

	priceAll.innerText = totalPrice;
};

// 위에서 만든 전체 체크박스 클릭 시켜버리기
$(checkAll).trigger("click");



//////////////////////////////////////////////////////
// 선택삭제


function deleteSelectCart() {
	let SelectedCheckboxes = document.querySelectorAll('.item-checkbox:checked');
	console.log(SelectedCheckboxes.length);
	if (SelectedCheckboxes.length === 0) {
		// 체크박스가 없으면 아무런 동작 없이 함수 종료
		return;
	}

	let ok = confirm('洗濯した商品を削除しますか');

	if (ok) {
		SelectedCheckboxes.forEach(function(checkbox) {
			let cartCode = checkbox.getAttribute('data-cartCode');

			$.ajax({
				type: "POST",
				url: "deleteCartItem", // 서버에서 해당 엔드포인트를 제공해야 함
				data: { c_no: cartCode },
				success: function(response) {
					// 여기서는 간단히 해당 요소를 삭제
					let parentDiv = checkbox.closest('.menu');
					parentDiv.parentNode.removeChild(parentDiv);
					$(`.${cartCode}`).remove();
					updateTotalPrice();
					
					totalP -= parseInt(checkbox.parentNode.parentNode.querySelector('.set-allprice').getAttribute("data-subtotal"));
				},
				error: function(error) {
					console.error("Delete request failed: ", error);
				}
			});

			console.log(cartCode);
		});
	};
};

// 그냥 삭제버튼
// 누르면 그 배열의 값을 받아서 삭제 
function deleteCart(c_no) {
	let ok = confirm('カートで商品を削除しますか');
	if (ok) {
		$.ajax({
			type: "POST",
			url: "deleteCartItem", // 서버에서 해당 엔드포인트를 제공해야 함
			data: { c_no: c_no },
			success: function(response) {
				// 서버에서 응답을 받았을 때의 처리
				// 여기서는 간단히 해당 요소를 삭제
				// 예시: 해당 요소를 jQuery를 사용하여 삭제 처리
				$(`.${c_no}`).remove();
				updateTotalPrice();
			},
			error: function(error) {
				console.error("Delete request failed: ", error);
			}
		});
	};

};

function updateTotalPrice() {
	let perTotal = 0;
	const checkedInputs = document.querySelectorAll('.item-checkbox:checked');
	console.log(checkedInputs);
	$(checkedInputs).each(function(i, obj){
		perTotal += parseInt($(obj).closest('.menu').find('.set-allprice').children().text());
	});
	
	console.log(perTotal);
	
	$("#payAllMoneySpan").text(perTotal);
	return perTotal;
	

}
////////////////////////////////////////////////
// 변경 버튼을 눌렀을 때, 수량을 서버에 전달
function changeQuantity(cartCode) {
	let inputField = $(`#quantityInput_${cartCode}`);
	let currentValue = parseInt(inputField.val());
	console.log(cartCode);
	// AJAX 요청을 수행하고 서버에 데이터 전송
	$.ajax({
		url: 'updateCartCount', // 실제로는 서버의 엔드포인트 URL로 대체해야 합니다.
		method: 'GET',
		data: { quantity: currentValue, no: cartCode },
		dataType: "json",
		success: function(response) {
			let totalCartPrice = response.totalCartPrice;
			let selectedCartPrice = response.selectedCartPrice;
			console.log(totalCartPrice);
			console.log(selectedCartPrice);
			// 성공적으로 처리된 경우 추가적인 로직을 수행할 수 있습니다.
			
		},
		error: function(error) {
			console.error('AJAX 요청 실패:', error);
		}
	});
}

// 수량을 증가 또는 감소시키는 함수
function adjustQuantity(btn, cartCode, delta) {
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
	// 하나 당 가격으로 총 가격 연산
	let perPrice = parseInt($(btn).closest('.menu').find('.info-price').text());
    let calcVal = perPrice * newValue;
	$(`#set-allprice_${cartCode}`).text(calcVal);
	$(`#set-allprice2_${cartCode}`).attr('data-subtotal', calcVal);
	
	let perTotal = 0;
	const checkedInputs = document.querySelectorAll('.item-checkbox:checked');
	$(checkedInputs).each(function(i,obj){
		perTotal += parseInt($(obj).closest('.menu').find('.set-allprice').children().text());
	});
	
	$("#payAllMoneySpan").text(perTotal);
	
	
}



// 1일때 못난이 2일떄 일반
$(function(){
	let categories = document.querySelectorAll('.info-menu');

    categories.forEach(function(category) {
        let cValue = category.textContent.trim();
        let result = cValue === '1' ? 'アグリー' : '普 通';
		let backgroundColor = cValue === '1' ? '#0B6121' : '#D8D8D8';
		let color = cValue === '1' ? '#FFFFFF' : '#000000';
		
        
        category.style.backgroundColor = backgroundColor;
        category.style.color = color;
        category.textContent = result;
    });
});
