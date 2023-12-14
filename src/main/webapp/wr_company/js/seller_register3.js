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
				$(tr).append("<td><button>delete</button></td>");
				$("#tbody").append(tr);

			}
		})
	}


	// Activate the corresponding tab
	document.querySelector(`.tab[onclick="showContent('${contentId}')"]`).classList.add('active');
}

function submitProductForm() {
	// 상품 등록 폼 제출 시 동작하는 함수
	// 필요에 따라 추가적인 로직을 여기에 작성하세요
	alert('상품이 등록되었습니다!');
}


