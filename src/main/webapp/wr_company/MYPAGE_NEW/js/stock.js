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
			$(tr).append("<td><button class='button' data-i-no='" + data[i].i_no + "' onclick='itemUpdate(" + data[i].i_no + ")'>修正</button></td>");
			$(tr).append("<td><button onclick='itemDelete(" + data[i].i_no + ")'>削除</button></td>");
			$("#tbody").append(tr);
		}

	});
}

function itemUpdate(iNo) {
    let modal = document.getElementsByClassName('modal')[0];
    let close = document.getElementsByClassName('close')[0];

    let confirmed = confirm('해당 상품을 수정하겠습니까?');

    if (confirmed) {
        setTimeout(function() {
            modal.style.display = 'flex';
        }, 0);

        close.addEventListener("click", function() {
            modal.style.display = 'none';
        });

        // 추가된 부분: .update-button에 대한 이벤트 핸들러 정의
        $('.update-button').off('click').on('click', function () {
            // 모달 내의 데이터와 함께 itemUpdate 함수 호출
            itemUpdate(iNo);

            // 추가된 부분
            $.ajax({
                url: 'ItemUpdateC',
                method: 'POST',
                datatype: 'json',
                data: {
                    iNo: iNo,
                    name: $('#farm-name').val(),
                    story: $('#farm-story').val(),
                    type: $('.select:checked').val(),
                    date: $('#farm-date').val(),
                    stock: $('#farm-stock').val(),
                    price: $('#farm-price').val(),
                    
                },
                success: function (response) {
                    // 성공 처리
                },
                error: function (error) {
                    console.error('에러:', error);
                }
            });
        });
    }

    // 이 부분에서 iNo 값을 사용하여 데이터를 가져오는 Ajax 호출 수행
    $.ajax({
        url: 'ShopDetailC', 
        method: 'POST',
        datatype: 'json',
        data: { no: iNo }, 
        success: function(response) {
            // 성공 메시지 표시
            alert('해당 상품이 조회되었습니다.');
            $('#farm-name').val(response.i_name);
            $('#farm-story').val(response.i_des);
            
            $('.select[value="' + response.i_category + '"]').prop('checked', true);

            let selectedDate = new Date(response.i_ed);
            let formattedDate = selectedDate.toISOString().slice(0, 10);
            $('#farm-date').val(formattedDate);
            
            $('#farm-stock').val(response.i_stock);
            $('#farm-price').val(response.i_price);
            $('#farm-file').text(response.i_img);
        },
        error: function(error) {
            console.error('에러:', error);
        }
    });
}
