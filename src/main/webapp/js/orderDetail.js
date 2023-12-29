$(function() {
	console.log("order.js loaded ======");
	$('.openModalBtn').on('click', function() {
		let index = $(this).data('number');
		console.log(index);

		// AJAX를 이용해 서버로 데이터 요청
		$.ajax({
			type: 'post',
			datatype: 'json',
			url: 'UserOrderC', // 실제 서버로의 경로로 변경해야 합니다.
			data: index,
			success: function(data) {
				console.log(data);
//				$('#modalContent').html(modalContent);

				// 모달 열기
//				$('#myModal').modal('show');
			},
			error: function() {
				console.error('데이터를 가져오는 동안 오류 발생');
			}
		});
	});
});
