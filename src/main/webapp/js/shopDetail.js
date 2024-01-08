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
		alert('消費者ログイン後に使用できます。');
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


function pay(no, id) {
	let count = $('#quantityInput').val();
	if (id == "") {
		alert('消費者ログイン後に使用できます。');
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

					let selectedItems = [];

					$.ajax({
						url: 'ShopDetailC', // 상품 정보 불러오기
						data: { no: no },
						method: 'post',
						datatype: 'json',
						success: function(response) {
							let c_no = 0;
							let i_no = response.i_no;
							let image = response.i_img
							let name = response.i_name
							let category = response.i_category == 1 ? "アグリー" : "普通";

							let price = response.i_price;
							let quantity = count
							let subtotal = response.i_price * count;
							/*							console.log(response);
														console.log(i_no);
														console.log(image);
														console.log(name);
														console.log(category);
														console.log(price);
														console.log(quantity);
														console.log(subtotal);*/
							let fName = "";
							farmName(response.s_id, function(farmNameResult) {
								fName = farmNameResult;
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

							selectedItems.push(item);

							localStorage.removeItem('selectedItems');

							let arrItems = JSON.stringify(selectedItems);

							localStorage.setItem('selectedItems', arrItems);


							location.href = 'OrderPageC';
							});
						}
					});

				}
			}
		});
	};
};

function farmName(s_id, callback) {
	$.ajax({
		url: 'SellerShowC', // 상품 정보 불러오기
		data: { s_id: s_id },
		method: 'post',
		success: function(response) {
			//		console.log(response);
			callback(response);
		}
	});
}