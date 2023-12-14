function showContent(contentId) {
	// Hide all content divs
	document.querySelectorAll('.content').forEach(function(content) {
		content.style.display = 'none';
	});

	// Deactivate all tabs
	document.querySelectorAll('.tab').forEach(function(tab) {
		tab.classList.remove('active');
	});

	// Show the selected content
	document.getElementById(contentId).style.display = 'block';
	console.log(contentId)
	if (contentId == 'product-management') {
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
				$(tr).append("<td><button>modi</button></td>");
				$(tr).append("<td><button onclick='itemDelete("+ data[i].i_no +")'>delete</button></td>");
				$("#tbody").append(tr);

			}
		})
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

	// Activate the corresponding tab
	document.querySelector(`.tab[onclick="showContent('${contentId}')"]`).classList.add('active');
	
}

function submitProductForm() {
	// 상품 등록 폼 제출 시 동작하는 함수
	// 필요에 따라 추가적인 로직을 여기에 작성하세요
	alert('상품이 등록되었습니다!');
}


