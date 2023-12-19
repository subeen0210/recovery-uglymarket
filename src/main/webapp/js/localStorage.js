/**
 * 결제용 로컬 스토리지 설정
 */

function payStorage() {

	// class가 'item-checkbox'인 모든 체크박스를 가져옵니다.
	var checkboxes = document.querySelectorAll('.item-checkbox');

	// 선택된 아이템을 저장할 배열을 생성합니다.
	var selectedItems = [];

	// 체크박스를 순회합니다.
	checkboxes.forEach(function(checkbox) {
		// 체크박스가 선택되어 있는지 확인합니다.
		if (checkbox.checked) {
			// 체크박스의 부모 컨테이너를 가져옵니다 ('menu' 클래스를 가진 div)
			var menuContainer = checkbox.closest('.menu');


			var c_no = menuContainer.querySelector('.cartNumber').value;
            var i_no = menuContainer.querySelector('.itemNumber').value;
			// menuContainer에서 값을 가져옵니다.
			var image = menuContainer.querySelector('.profile-img').textContent;
			var name = menuContainer.querySelector('.info-title').textContent;
			var category = menuContainer.querySelector('.info-menu').textContent;
			var flavor = menuContainer.querySelector('.info-menus div:nth-child(2)').textContent;
			var price = menuContainer.querySelector('.info-price').textContent;
			var quantity = menuContainer.querySelector('.quantity-input').value;
			var subtotal = menuContainer.querySelector('.per-total-price').textContent;

			// 가져온 값을 사용하여 객체를 생성합니다.
			var item = {
				c_no: c_no,
				i_no: i_no,
				image: image,
				name: name,
				category: category,
				flavor: flavor,
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





	// 초기화
	//	localStorage.clear();
	//	
	//	localStorage.setItem();
};