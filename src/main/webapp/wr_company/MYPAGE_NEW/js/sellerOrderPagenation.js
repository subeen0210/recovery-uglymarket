/**
 *  seller 페이지네이션
 */

var sss = jQuery.noConflict();
let totalItem;
sss(function() {
	sss.ajax({
		url: 'SellerOrderC',
		type: 'get',
		datatype: 'json',
		success: function(data) {
			totalItem = data;
			Templating(data)
			sellerPagination(data);
		},
		error: function(error) {
			// 에러를 처리
			console.error('AJAX 에러:', error);
		}

	});
});
function sellerPagination(array) {
	sss('#pagination-seller').pagination({
		dataSource: array,
		pageSize: 10,
		callback: function(data, pagination) {

			var html = Templating(data);
			sss('#sellerOrder').html(html);
		}
	})
}

function Templating(data) {
	console.log(data);
	let tableRows = "";
	sss.each(data, function(index, item) {
		let dateObject = new Date(item.o_date.replace(/월|일/g, '').trim());
		// 원하는 날짜 형식으로 포맷팅
		let year = dateObject.getFullYear();
		let month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
		let day = dateObject.getDate().toString().padStart(2, '0');

		// 원하는 형식으로 조합
		let formattedDate = year + "-" + month + "-" + day;



		let tr = "<tr>";
		if (item.o_status == '注文完了') {
			tr += "<td><a class='openModalBtn statusColor1' data-number='" + item.o_no + "' style='cursor: pointer;'>" + item.o_orderNum + "</a></td>";
		} else if (item.o_status == '発送完了'){
			tr += "<td><a class='openModalBtn statusColor2' data-number='" + item.o_no + "' style='cursor: pointer;'>" + item.o_orderNum + "</a></td>";
		} else{
			tr += "<td><a class='openModalBtn' data-number='" + item.o_no + "' style='cursor: pointer;'>" + item.o_orderNum + "</a></td>";
		}
		tr += "<td>" + item.i_name + "</td>";
		tr += "<td>" + item.o_quantity + "</td>";
		tr += "<td>" + item.o_totalprice + "</td>";
		tr += "<td>" + item.o_name + "</td>";
		tr += "<td>" + item.o_addr + "</td>";
		tr += "<td class='status'>" + item.o_status + "</td>";
		tr += "<td>" + formattedDate + "</td>";
		if (item.o_status == '配送完了') {
			tr += "<td class='orderDeleteBtn' data-no='" + item.o_no + "' data-person='o_s_show'>X</td>";
		} else {
			tr += "<td ></td>";
		}



		tr += "</tr>";

		tableRows += tr;
	});
	return tableRows;
}
