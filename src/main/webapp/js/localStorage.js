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
	localStorage.clear();

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
		console.log(items.i_no);
		
		
		getItems += "<p class='details-farm'>";
		getItems += "<span>" + items[i].farmName + "</span><span class='order-delivery-status'>무료배송</span>";
		getItems += "</p>";
		getItems += "<hr />";
		getItems += "<p class='items'>";
		getItems += "<span class='getItems'> <span class='order-item-imgbox'>";
		getItems += "<img class='img-set-size' src='itemFolder/" + items[i].image + "' />";
		getItems += "</span>";
		getItems += "<span class='order-item'>";
		getItems += "<span class='order-item-name'>" + items[i].name + "</span><br />";
		getItems += "<span>(" + items[i].category + ")&ensp;<img src='img/en-icon.png' style='width: 15px;'>" + items[i].price + "│" + items[i].quantity +"</span><br /> <br /> ";
		getItems += "<span><img src='img/en-icon.png' style='width: 15px;'>" + items[i].subtotal + "</span>";
		getItems += "</span>";
		getItems += "</span>";
		getItems += "<input type='hidden' name='i_no' value='"+ items[i].i_no +"'>";
		getItems += "<input type='hidden' name='quantity' value='"+ items[i].quantity +"'>";	
		getItems += "<input type='hidden' name='subtotal' value='"+ items[i].subtotal +"'>";	
		getItems += "</p>";
	}
	document.getElementById('wrap-content').innerHTML = getItems;
	document.getElementById('totalPrice').innerHTML = total;
	











});
