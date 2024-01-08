// 전체 선택 체크박스 요소 가져오기
let checkAll = document.getElementById("checkAll");
let priceAll = document.getElementById('payAllMoneySpan');
// 각 항목의 체크박스 요소 가져오기
let checkboxes = document.querySelectorAll(".item-checkbox");
//let totalP = 0;
// 전체 선택 체크박스의 변경 이벤트 처리
checkAll.addEventListener("click", function() {
	const isChecked = checkAll.checked;

	if (isChecked) {
		// 모두 체크
		for (const checkbox of checkboxes) {
			checkbox.checked = true;
		}
		updateTotalPrice();
	}

	else {
		// 모두 체크 안함
		for (const checkbox of checkboxes) {
			checkbox.checked = false;
		}
		priceAll.innerText = 0;
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
				url: "deleteCartItem", 
				data: { c_no: cartCode },
				success: function(response) {
					
					let parentDiv = checkbox.closest('.menu');
					parentDiv.parentNode.removeChild(parentDiv);
					$(`.${cartCode}`).remove();
					updateTotalPrice();
					
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
			url: "deleteCartItem", 
			data: { c_no: c_no },
			success: function(response) {
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
	
	priceAll.innerText = perTotal;
	return perTotal;
	

}
////////////////////////////////////////////////
// 변경 버튼을 눌렀을 때, 수량을 서버에 전달
function changeQuantity(cartCode) {
	let inputField = $(`#quantityInput_${cartCode}`);
	let currentValue = parseInt(inputField.val());
	console.log(cartCode);
	console.log(currentValue);
	$.ajax({
		url: 'updateCartCount', 
		method: 'GET',
		data: { quantity: currentValue, no: cartCode },
		success: function(response) {
			
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

	// 값이 1보다 작아지지 않도록
	if (newValue < 1) {
		newValue = 1;
		
	}

	// 변경된 값을 입력 필드에 설정
	inputField.val(newValue);
	// 하나 당 가격으로 총 가격 연산
	let perPrice = parseInt($(btn).closest('.menu').find('.info-price span').text());
    let calcVal = perPrice * newValue;
	$(`#set-allprice_${cartCode}`).text(calcVal);
	$(`#set-allprice2_${cartCode}`).attr('data-subtotal', calcVal);
	
	updateTotalPrice();
	
	
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
