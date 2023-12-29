$(function() {


	//주문 상세 모달
	const myModal = document.getElementById('myModal');
	const closeModalBtn = document.getElementById('closeModalBtn');

	closeModalBtn.addEventListener('click', () => {
		myModal.close();
	});


	//수정 모달
	const myModal2 = document.getElementById('myModal2');
	let openModalBtn2 = document.querySelector('.openModalBtn2');
	const closeModalBtn2 = document.getElementById('closeModalBtn2');


	openModalBtn2.addEventListener('click', () => {
		myModal2.showModal();
	});

	closeModalBtn2.addEventListener('click', () => {
		myModal2.close();
	});








	console.log("order.js loaded ======");
	$('.openModalBtn').on('click', function() {
		let index = $(this).data('number');
		console.log(index);
		console.log(typeof (index));

		// AJAX를 이용해 서버로 데이터 요청
		$.ajax({
			type: 'get',
			datatype: 'json',
			url: 'UserOrderC?index=' + index, // 실제 서버로의 경로로 변경해야 합니다.
			success: function(data) {
				console.log(data.i_name);

				// Date 객체로 변환
				let dateObject = new Date(data.i_ed.replace(/월|일/g, '').trim());
				let addrDate = new Date(data.o_date.replace(/월|일/g, '').trim());
				// 원하는 날짜 형식으로 포맷팅
				let formattedDate = formatDate(dateObject);
				let formattAddrDate = formatDate(addrDate);
				
				let category = data.i_category == 1 ? "アグリー" : "普通";
				$("#f_name").text(data.f_name);
				$("#i_name").text(data.i_name);
				$("#i_category").text(category);
				$("#o_quantity").text(data.o_quantity);
				$("#i_price").text("￥" + data.i_price);
				$("#i_ed").text(formattedDate);

				$("#o_name").text(data.o_name);
				$("#o_tel").text(data.o_tel);
				$("#o_arrival").text(data.o_arrival);
				$("#o_addr").html(data.o_addr + "<br>(" + data.o_addrNum + ")");
				$("#o_date").text(formattAddrDate);
				
				myModal.showModal();
			},
			error: function() {
				console.error('데이터를 가져오는 동안 오류 발생');
			}
		});
	});
});

function formatDate(date) {
	let year = date.getFullYear();
	let month = (date.getMonth() + 1).toString().padStart(2, '0');
	let day = date.getDate().toString().padStart(2, '0');
	return year + "-" + month + "-" + day;
}
