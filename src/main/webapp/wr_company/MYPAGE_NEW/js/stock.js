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
			let dateObject = new Date(data[i].i_enddate.replace(/월|일/g, '').trim());
			// 원하는 날짜 형식으로 포맷팅
			let year = dateObject.getFullYear();
			let month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
			let day = dateObject.getDate().toString().padStart(2, '0');

			// 원하는 형식으로 조합
			let formattedDate = year + "-" + month + "-" + day;

			let tr = $("<tr></tr>")
			$(tr).append("<td>" + data[i].i_name + "</td>");
			$(tr).append("<td>" + data[i].i_stock + "</td>");
			$(tr).append("<td>" + formattedDate + "</td>");
			$(tr).append("<td>" + data[i].i_price + "</td>");
			$(tr).append("<td class='update_td'><button class='button' data-i-no='" + data[i].i_no + "' onclick='itemUpdate(" + data[i].i_no + ")'>修正</button></td>");
			$(tr).append("<td class='orderDeleteBtn' onclick='itemDelete(" + data[i].i_no + ")'>X</td>");
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
				alert('해당 상품이 삭제되었습니다.');
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
	console.log('update~~~')
	let modal = document.getElementsByClassName('modal')[0];
	let close = document.getElementsByClassName('close')[0];
	let button = document.getElementsByClassName('update-button')[0];

	let confirmed = confirm('해당 상품을 수정하겠습니까??');

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
			console.log(response);
			//alert('해당 상품이 조회되었습니다.');
			$('#farm-name').val(response.i_name);
			$('#farm-story').val(response.i_des);

			$('.select[value="' + response.i_category + '"]').prop('checked', true);

			$('#farm-stock').val(response.i_stock);
			$('#farm-price').val(response.i_price);
			$('#farm-file2').val(response.i_img);

			let dateString = response.i_enddate;
			let parts = dateString.split(' ');  // 공백을 기준으로 나누기

			// 월 이름을 숫자로 변환
			let monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
			let month = monthNames.indexOf(parts[0]) + 1;

			// 일과 년도 추출
			let day = parseInt(parts[1].replace(',', ''));
			let year = parseInt(parts[2]);
			// 월과 일이 한 자리 수일 때 앞에 0 붙이기
			let formattedMonth = month < 10 ? `0${month}` : month;
			let formattedDay = day < 10 ? `0${day}` : day;

			// YYYY-MM-DD 형식으로 변환
			let formattedDate = `${year}-${formattedMonth}-${formattedDay}`;
			console.log(formattedDate);



			// input 요소에 설정
			$('#farm-date').val(formattedDate);
			$("#item-no").val(response.i_no)



		},
		error: function(error) {
			console.error('에러:', error);
		}
	});

}