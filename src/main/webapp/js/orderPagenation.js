/**
 * order부분 페이징처리
 */
// User
/*
currentPage: 현재 페이지
totalCount: 총 데이터의 갯수
pageCount: 화면에 나타날 페이지 갯수
limit: 한 페이지 당 나타낼 데이터의 갯수
*/

$(function() {
	$.ajax({
		url: 'UserOrderC',
		type: 'post',
		datatype: 'json',
		success: function(data) {
			for (i = 0, i < data.length; i++;) {
				let dateObject = new Date(data[i].o_date.replace(/월|일/g, '').trim());
				// 원하는 날짜 형식으로 포맷팅
				let year = dateObject.getFullYear();
				let month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
				let day = dateObject.getDate().toString().padStart(2, '0');

				// 원하는 형식으로 조합
				let formattedDate = year + "-" + month + "-" + day;

				console.log(data);
				let tr = "<tr>";
				tr += "<td><a class='openModalBtn' data-number='" + data[i].o_no + "' style='cursor: pointer;'>" + data[i].o_orderNum + "</a></td>";
				tr += "<td>" + data[i].i_name + "</td>";
				tr += "<td>" + data[i].o_quantity + "/" + data[i].i_price + "</td>";
				tr += "<td>" + data[i].o_totalprice + "</td>";
				tr += "<td><span>" + data[i].o_status + "</span><a class='orderUpdateBtn' onclick='updateStatusOrder('" + data[i].o_no + "');' style='display: none'>" + data[i].o_status + "</a></td>";
				tr += "<td>" + formattedDate + "</td>";
				tr += "<td><button class='openModalBtn2' data-no='" + data[i].o_no + "'>作成</button>";
				tr += "<td class='orderDeleteBtn' onclick='deleteOrder('" + data[i].o_no + "','o_u_show')'>X</td>";
				tr += "</tr>";

				$('#userOrder').html(tr);
			}
		},
		error: function(error) {
			// 에러를 처리
			console.error('AJAX 에러:', error);
		}

	});
});
