$(function() {
	showReviewContent('reviewListContainer');
})

function showReviewContent(contentId){
	document.getElementById(contentId).style.display = 'block';
	if (contentId == 'reviewListContainer') {
		showReviews();
	}
}

function showReviews(){
	$.ajax({
		url: 'ShowReviewC',
		dataType: 'json'
	}).done(function(data) {
		console.log(data);
		for (let i = 0; i < data.length; i++) {
			let dateObject = new Date(data[i].r_date.replace(/월|일/g, '').trim());
			let year = dateObject.getFullYear();
			let month = (dateObject.getMonth()+ 1).toString().padStart(2, '0');
			let day = dateObject.getDate().toString().padStart(2, '0');
			let date = year + "-" + month + "-" + day;
			
			let tr = $("<tr></tr>")
			$(tr).append("<td>" + data[i].r_productname + "</td>");
			$(tr).append("<td>" + data[i].r_estimation + "</td>");
			$(tr).append("<td>" + date + "</td>");
			$(tr).append("<td>" + data[i].r_grade + "</td>");
			$(tr).append("<td><button onclick='reviewDelete(" + data[i].i_no + ")'>削除</button></td>");
			$("#review-tbody").append(tr);
		}
	}).fail(function(jqXHR, textStatus, errorThrown) {
       console.error("AJAX Error:", textStatus, errorThrown);
	});
}

function reviewDelete(no) {
	let confirmed = confirm('해당 리뷰를 정말 삭제하겠습니까?');
	if (confirmed) {
		$.ajax({
			url: 'ReviewDeleteC',
			data: {no: no},
			dataType: 'text',
			success: function(res) {
				alert('해당 리뷰가 삭제되었습니다.');
				location.reload();
			},
			error: function(error){
				console.log('error', error);
			}
		});
	} else {
		console.log('삭제 취소');
	}
}