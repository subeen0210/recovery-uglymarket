var modal;
$(function() {
	modal = document.getElementsByClassName('modal')[0];
	//alert(1111)
	showContent('product-management');

})


function showContent(contentId) {
	// Show the selected content
	document.getElementById(contentId).style.display = 'block';

	if (contentId == 'product-management') {
		// 페이지 로드 시 데이터 로딩
		loadStockData();
	}
}
function loadStockData() {
	$.ajax({
		url: 'ItemAddC',
		datatype: 'json'
	}).done(function(data) {
		console.log(data);
		for (let i = 0; i < data.length; i++) {
			// Date 객체로 변환
			var dateObject = new Date(data[i].i_enddate.replace(/월|일/g, '').trim());
			// 원하는 날짜 형식으로 포맷팅
			var year = dateObject.getFullYear();
			var month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
			var day = dateObject.getDate().toString().padStart(2, '0');

			// 원하는 형식으로 조합
			var formattedDate = year + "-" + month + "-" + day;

			let tr = $("<tr></tr>")
			$(tr).append("<td>" + data[i].i_name + "</td>");
			$(tr).append("<td>" + data[i].i_stock + "</td>");
			$(tr).append("<td>" + formattedDate + "</td>");
			$(tr).append("<td>" + data[i].i_price + "</td>");
			$(tr).append("<td><button class='button' onclick='itemUpdate(" + data[i].i_no + ")'>修正</button></td>");
			$(tr).append("<td><button onclick='itemDelete(" + data[i].i_no + ")'>削除</button></td>");
			$("#tbody").append(tr);
		}

	});
}

function itemDelete(no) {
	var confirmed = confirm('해당 상품을 정말 삭제하겠습니까?');
	// 사용자의 선택 확인
	if (confirmed) {
		// 사용자가 '예'를 선택한 경우, 삭제를 수행
		$.ajax({
			url: 'ItemDeleteC', // 실제 서블릿 URL로 교체
			method: 'POST',
			data: { no: no }, // 아이템 번호를 서블릿에 전달
			dataType: 'text', // 일반 텍스트 응답을 기대
			success: function(response) {
				// 성공 메시지 표시
				alert('해당 상품이 삭제되었습니다.');
				// 선택적으로 UI를 업데이트하거나 페이지를 다시 로드할 수 있습니다.
				location.reload();
			},
			error: function(error) {
				console.error('에러:', error);
			}
		});
	} else {
		// 사용자가 '아니요'를 선택한 경우, 아무 동작도 하지 않음
		console.log('삭제 취소됨');
	}
}

function itemUpdate(no) {
	let modal = document.getElementsByClassName('modal')[0];
	let close = document.getElementsByClassName('close')[0];
	let button = document.getElementsByClassName('button')[0];

	let confirmed = confirm('해당 상품을 수정하겠습니까?');

	if (confirmed) {
		setTimeout(function() {
			modal.style.display = 'flex';
		}, 0);

		close.addEventListener("click", function() {
			modal.style.display = 'none';
		});
	}

	$.ajax({
		url: 'ShopDetailC', // 실제 서블릿 URL로 교체
		method: 'POST',
		datatype: 'json',
		data: { no: no }, // 아이템 번호를 서블릿에 전달
		success: function(response) {
			// 성공 메시지 표시
			alert('해당 상품이 조회되었습니다.');
			$('#farm-name').val(response.i_name);
			$('#farm-story').val(response.i_des);
			
  			if (response.i_category === '1') {
            $('#farm-select1').prop('checked', true);
        } else if (response.i_category === '2') {
            $('#farm-select2').prop('checked', true);
        }

			$('#farm-date').val(response.i_ed);
			$('#farm-stock').val(response.i_stock);
			$('#farm-price').val(response.i_price);
			$('#farm-file').text(response.i_img);

		},
		error: function(error) {
			console.error('에러:', error);
		}
	});

}
