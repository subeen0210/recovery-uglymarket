// 전체 선택 체크박스 요소 가져오기
let checkAll = document.getElementById("checkAll");
let priceAll = document.getElementById('payAllMoneySpan');
// 각 항목의 체크박스 요소 가져오기
let checkboxes = document.querySelectorAll(".item-checkbox");
let totalP = 0 ;
// 전체 선택 체크박스의 변경 이벤트 처리
checkAll.addEventListener("click", function() {
	const isChecked = checkAll.checked;

	if (isChecked) {
		// 모두 체크
		for (const checkbox of checkboxes) {
			checkbox.checked = true;
		 totalP += parseInt(checkbox.parentNode.parentNode.querySelector('.set-allprice').getAttribute("data-subtotal"));
		}
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
	alert('aa');
};

// 그냥 삭제버튼
// 누르면 그 배열의 값을 받아서 삭제 
function deleteCart(i_no) {
	let ok = confirm('カートで商品を削除しますか');
	if (ok) {
		$.ajax({
			type: "POST",
			url: "deleteCartItem", // 서버에서 해당 엔드포인트를 제공해야 함
			data: { i_no: i_no },
			success: function(response) {
				// 서버에서 응답을 받았을 때의 처리
				// 여기서는 간단히 해당 요소를 삭제
				// 예시: 해당 요소를 jQuery를 사용하여 숨김 처리
				$(`.${i_no}`).hide();
			},
			error: function(error) {
				console.error("Delete request failed: ", error);
			}
		});
	};

	updateTotalPrice();
};

function updateTotalPrice() {
	// 서버에 현재 총 합을 요청
	$.ajax({
		type: "GET",
		url: "deleteCartItem", // 서버에서 현재 총 합을 반환하는 엔드포인트
		success: function(totalPrice) {
			console.log(totalPrice);

			// 화면의 총 합 엘리먼트를 업데이트
			$(".pay-allmoney span").text(totalPrice);
		},
		error: function(error) {
			console.error("Total price update request failed: ", error);
		}
	});

}