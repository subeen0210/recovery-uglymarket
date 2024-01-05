document.getElementById("r-date").valueAsDate = new Date();

$(document).on('change', '#userOrder', function() {
	console.log('동적 변경');
});


$(function() {


	//주문 상세 모달
	const myModal = document.getElementById('myModal');
	const closeModalBtn = document.getElementById('closeModalBtn');

	closeModalBtn.addEventListener('click', () => {
		myModal.close();
	});


	//수정 모달
	const myModal2 = document.getElementById('myModal2');
	const closeModalBtn2 = document.getElementById('closeModalBtn2');

	closeModalBtn2.addEventListener('click', () => {
		myModal2.close();
	});

});



function formatDate(date) {
	let year = date.getFullYear();
	let month = (date.getMonth() + 1).toString().padStart(2, '0');
	let day = date.getDate().toString().padStart(2, '0');
	return year + "-" + month + "-" + day;
}


function addReview() {
	let name = $("#r_productname").text();
	let grade = $("input[name='grade']").val();
	let story = $("textarea[name='story']").val();
	let no = $("#myButton").val();

	if (!grade) {
		alert('評点を入力してください。');
		return;
	}

	if (parseInt(grade) >= 6) {
		alert('1から5まで入力してください。');
		return; // 값이 6 이상이면 함수를 종료
	}

	if (!story) {
		alert('内容を入力してください。');
		return;
	}



	let ok = confirm('後記を作成しますか？');

	if (ok) {
		$.ajax({
			url: 'ReviewAddC',
			method: 'POST',
			data: { name: name, grade: grade, story: story, no: no },
			success: function(res) {
				if (res == 1) {
					alert("後記が登録されました。");
					window.location.href = 'UserMypageC';
				} else {
					alert('後記の登録に失敗しました。');
				}
			}
		});
	}
}



$(document).on('click', '.orderUpdateBtn', function() {
	let no = $(this).data('no');
	console.log(no);
	if (confirm('到着しましたか？ 変えたら戻れません。')) {

		location.href = 'updateOrderStatusC?o_no=' + no + '&status=status2';
	}
});

$(document).on('click', '.orderDeleteBtn', function() {
	let no = $(this).data('no');
	let person = $(this).data('person');
	console.log(person);
	if (confirm('削除しますか？')) {
		let ok2 = confirm('本当に削除しますか？\r\n今後、商品に問題がある場合、確認できません。');
		if (ok2) {

			location.href = 'deleteOrderC?no=' + no + '&person=' + person;
		}
	}
});

// 주문상세 확인 모달 기능
$(document).on('click', '.openModalBtn', function() {
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

// 후기 작성 모달 기능
$(document).on('click', '.openModalBtn2', function() {
	let index = $(this).data('no');
	console.log(index);
	console.log(typeof (index));

	$.ajax({
		type: 'get',
		datatype: 'json',
		url: 'UserOrderC?index=' + index,
		success: function(data) {
			console.log(data.i_no);
			$("#r_productname").text(data.i_name);
			$("#myButton").val(data.i_no);
			console.log($("#r_productname").text());


			myModal2.showModal();
		}
	});
});