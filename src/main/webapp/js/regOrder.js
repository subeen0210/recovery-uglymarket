// orderPage.jsp 에서 localStorage 불러오기
$(function() {
	
	
	
	let req = document.getElementById('deliveryCheck').value;
	$("#deliveryTime").val(req).prop("selected", true);
	

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
		getItems += "<input type='hidden' class='i_no' value='"+ items[i].i_no +"'>";
		getItems += "<input type='hidden' class='quantity' value='"+ items[i].quantity +"'>";	
		getItems += "<input type='hidden' class='subtotal' value='"+ items[i].subtotal +"'>";	
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
	
	let ok = confirm("配送先と商品を確認しましたか？");
			if (ok) {
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
	console.log(i_noArray.toString());
	console.log(quantityArray.toString());
	console.log(subtotalArray.toString());

	$.ajax({
    url: "OrderPageC", // 서버의 URL
    method: "post", // HTTP 메서드 (GET, POST 등)
	data: {i_no: i_noArray.toString(), quantity: quantityArray.toString(), subtotal: subtotalArray.toString()},
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
}