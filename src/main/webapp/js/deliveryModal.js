$(function() {
	const myModal = document.getElementById('myModal');
	const closeModalBtn = document.getElementById('closeModalBtn');

	closeModalBtn.addEventListener('click', () => {
		myModal.close();
	});


	// 배송 상세정보 모달
	$('.openModalBtn').on('click', function() {
		let index = $(this).data('number');
		console.log(index);

		// AJAX를 이용해 서버로 데이터 요청
		$.ajax({
			type: 'post',
			datatype: 'json',
			url: 'SellerOrderC',// 실제 서버로의 경로로 변경해야 합니다.
			data: { no: index },
			success: function(data) {
				console.log(data.i_name);

				// Date 객체로 변환
				let dateObject = new Date(data.i_ed.replace(/월|일/g, '').trim());
				let addrDate = new Date(data.o_date.replace(/월|일/g, '').trim());
				// 원하는 날짜 형식으로 포맷팅
				let formattedDate = formatDate(dateObject);
				let formattAddrDate = formatDate(addrDate);

				let category = data.i_category == 1 ? "アグリー" : "普通";
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

				// 오더 상태에 따라서 버튼의 우무
				let status = 'status0';
				let statusShow = 'status0';
				let statusHide = 'status2';
				$('#o_status').show();
				$('#o_statusEnd').hide();
				$('#modify').show();
				if (data.o_status == "発送完了") {
					status = 'status1'
					statusShow = 'status2';
					statusHide = 'status0';
				} else if (data.o_status == "配送完了") {
					$('#o_status').hide();
					$('#o_statusEnd').show();
					$('#modify').hide();
				}
				$("#status option[value='" + statusShow + "']").show();
				$("#status option[value='" + statusHide + "']").hide();
				$('#status').val(status).prop("selected", true);

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