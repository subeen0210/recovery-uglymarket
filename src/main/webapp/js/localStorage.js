/**
 * 결제용 로컬 스토리지 설정
 */

// cart.jsp 에서 결제하기 클릭했을 때, 상품의 로컬스토리지 생성
function payStorage() {
	
	let payTotalPrice = document.querySelector('#payAllMoneySpan').innerText;
	if(payTotalPrice == '0'){
		alert('買い物を選択してください');
		
		return f;
	}
	

	// class가 'item-checkbox'인 모든 체크박스를 가져옵니다.
	let checkboxes = document.querySelectorAll('.item-checkbox');

	// 선택된 아이템을 저장할 배열을 생성합니다.
	let selectedItems = [];

	// 체크박스를 순회합니다.
	checkboxes.forEach(function(checkbox) {
		// 체크박스가 선택되어 있는지 확인합니다.
		if (checkbox.checked) {
			// 체크박스의 부모 컨테이너를 가져옵니다 ('menu' 클래스를 가진 div)
			let menuContainer = checkbox.closest('.menu');


			let c_no = menuContainer.querySelector('.cartNumber').value;
			let i_no = menuContainer.querySelector('.itemNumber').value;
			// menuContainer에서 값을 가져옵니다.
			let image = menuContainer.querySelector('.profile-img').textContent;
			let name = menuContainer.querySelector('.info-title').textContent;
			let category = menuContainer.querySelector('.info-menu').textContent;
			let fName = menuContainer.querySelector('.info-menus div:nth-child(2)').textContent;
			let price = menuContainer.querySelector('.info-price').textContent;
			let quantity = menuContainer.querySelector('.quantity-input').value;
			let subtotal = menuContainer.querySelector('.per-total-price').textContent;

			// 가져온 값을 사용하여 객체를 생성합니다.
			let item = {
				c_no: c_no,
				i_no: i_no,
				image: image,
				name: name,
				category: category,
				farmName: fName,
				price: price,
				quantity: quantity,
				subtotal: subtotal
			};

			// 객체를 selectedItems 배열에 추가합니다.
			selectedItems.push(item);
		}
	});

	// 선택된 아이템을 콘솔에 출력합니다 (필요에 따라 이 부분을 수정할 수 있습니다).
	console.log(selectedItems);


	//	 초기화
	localStorage.removeItem('selectedItems');

	let arrItems = JSON.stringify(selectedItems);

	localStorage.setItem('selectedItems', arrItems);


	location.href = 'OrderPageC';
};

// orderPage.jsp 에서 localStorage 불러오기
$(function() {

	let itemsString = localStorage.getItem('selectedItems')
	let items = JSON.parse(itemsString);
	console.log(items);

	
	let getItems = "";
	let total = 0;
	for (i = 0; i < items.length; i++) {

		console.log(items[i]);
		total += parseInt(items[i].subtotal);
		console.log(total);
		console.log(items[i].i_no);
		
		
		getItems += "<p class='details-farm'>";
		getItems += "<span>" + items[i].farmName + "</span><span class='order-delivery-status'>送料無料</span>";
		getItems += "</p>";
		getItems += "<hr />";
		getItems += "<p class='items'>";
		getItems += "<span class='getItems'> <span class='order-item-imgbox'>";
		getItems += "<img class='img-set-size' src='itemFolder/" + items[i].image + "' />";
		getItems += "</span>";
		getItems += "<span class='order-item'>";
		getItems += "<span class='order-item-name'>" + items[i].name + "</span><br />";
		getItems += "<span><span class='item-categorys'>" + items[i].category + "</span>&ensp;<img src='img/en-icon.png' style='width: 15px;'>" + items[i].price + "│" + items[i].quantity +"</span><br /> <br /> ";
		getItems += "<span><img src='img/en-icon.png' style='width: 15px;'>" + items[i].subtotal + "</span>";
		getItems += "</span>";
		getItems += "</span>";
		getItems += "<input type='hidden' class='i_no' name='i_no' value='"+ items[i].i_no +"'>";
		getItems += "<input type='hidden' class='quantity' name='quantity' value='"+ items[i].quantity +"'>";	
		getItems += "<input type='hidden' class='subtotal' name='subtotal' value='"+ items[i].subtotal +"'>";	
		getItems += "</p>";
	}
	document.getElementById('wrap-content').innerHTML = getItems;
	document.getElementById('totalPrice').innerHTML = total;
	

	let categories = document.querySelectorAll('.item-categorys');

    categories.forEach(function(category) {
        let cValue = category.textContent.trim();
		let backgroundColor = cValue == 'アグリー' ? '#0B6121' : '#D8D8D8';
		let color = cValue == 'アグリー' ? '#FFFFFF' : '#000000';
		
        
        category.style.backgroundColor = backgroundColor;
        category.style.color = color;
    });

});

function regOrder(){
	let i_no = document.getElementsByClassName('i_no');
	let quantity = document.getElementsByClassName('quantity');
	let subtotal = document.getElementsByClassName('subtotal');
	const paymentEndPage = document.getElementById('paymentEndPage');

//    // 가져온 요소들의 값을 배열에 저장
    let i_noArray = [];
	let quantityArray = [];
	let subtotalArray = [];
    for (var i = 0; i < i_no.length; i++) {
        i_noArray.push(i_no[i].value);
        quantityArray.push(quantity[i].value);
        subtotalArray.push(subtotal[i].value);
    }
//	console.log(i_noArray);
//	console.log(quantityArray);
//	console.log(subtotalArray);

	$.ajax({
    url: "OrderPageC", // 서버의 URL
    method: "post", // HTTP 메서드 (GET, POST 등)
	data: {i_no:i_noArray, quantity:quantityArray, subtotal:subtotalArray},
    success: function(data) {
        // 요청이 성공했을 때 실행되는 콜백 함수
        paymentEndPage.showModal();

    },
    error: function(xhr, status, error) {
        // 요청이 실패했을 때 실행되는 콜백 함수
        console.error("AJAX request failed:", status, error);
    }
});
$(document).on('keydown', function(event) {
    if (event.key === 'Escape') {
        event.preventDefault(); // 기본 동작 취소
        // 모달이 닫히지 않도록 추가적인 로직을 추가할 수 있습니다.
    }
});
	
}
