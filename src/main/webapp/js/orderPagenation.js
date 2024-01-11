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
var jb = jQuery.noConflict();

jb(function() {
	jb.ajax({
		url: 'UserOrderC',
		type: 'post',
		datatype: 'json',
		success: function(data) {
			simpleTemplating(data)
			Orderpagination(data);
		},
		error: function(error) {
			// 에러를 처리
			console.error('AJAX 에러:', error);
		}

	});
});


function Orderpagination(array) {
	jb('#pagination-container').pagination({
		dataSource: array,
		pageSize: 10,
		callback: function(data, pagination) {

			var html = simpleTemplating(data);
			jb('#userOrder').html(html);
		}
	})
}

function simpleTemplating(data) {
	console.log(data);
	let tableRows = "";
	jb.each(data, function(index, item) {
		let dateObject = new Date(item.o_date.replace(/월|일/g, '').trim());
		// 원하는 날짜 형식으로 포맷팅
		let year = dateObject.getFullYear();
		let month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
		let day = dateObject.getDate().toString().padStart(2, '0');

		// 원하는 형식으로 조합
		let formattedDate = year + "-" + month + "-" + day;



		let tr = "<tr>";
		tr += "<td><a class='openModalBtn' data-number='" + item.o_no + "' style='cursor: pointer;'>" + item.o_orderNum + "</a></td>";
		tr += "<td>" + item.i_name + "</td>";
		tr += "<td>" + item.o_quantity + "/" + item.i_price + "</td>";
		tr += "<td>" + item.o_totalprice + "</td>";

		if (item.o_status == '発送完了') {
			tr += "<td><a class='orderUpdateBtn' data-no='"+ item.o_no +"' >" + item.o_status + "</a></td>";
		} else {
			tr += "<td><span>" + item.o_status + "</span></td>"
		}

		tr += "<td>" + formattedDate + "</td>";
		
		if (item.o_status == '配送完了') {
			tr += "<td><button class='openModalBtn2' data-no='" + item.o_no + "'>作成</button>";
		} else {
			tr += "<td ></td>";
		}
		
		if (item.o_status == '配送完了') {
			tr += "<td class='orderDeleteBtn' data-no='"+ item.o_no +"' data-person='o_u_show' >X</td>";
		} else {
			tr += "<td ></td>";
		}



		tr += "</tr>";

		tableRows += tr;
	});
	return tableRows;
}

