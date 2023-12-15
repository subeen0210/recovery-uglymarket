// mypage.js

$(document).ready(function() {
	// 초기 페이지 로딩 시 실행할 코드
	showJspPage('../insert.jsp');

	// 각 메뉴에 클릭 이벤트 리스너 추가
	$('.main_menu a').click(function(event) {
		event.preventDefault();
		var pageId = $(this).attr('data-page-id');
		showJSP(pageId);
	});
});

function showJSP(pageId) {
	var jspContainer = $('.jsp_view');

	if (jspContainer.length > 0) {
		// 여기서 각 페이지의 경로를 설정해주세요.
		var pagePath = getPagePath(pageId);

		$.ajax({
			url: pagePath,
			method: 'GET',
			success: function(data) {
				jspContainer.html(data);
			},
			error: function(xhr, status, error) {
				console.error('JSP 페이지 로딩 중 에러:', error);
			}
		});
	}
}


function getPagePath(pageId) {
	// 각 페이지의 경로를 설정해주세요.
	switch (pageId) {

		case "insert":
			return "insert.jsp"
		case "register":
			return "register.jsp";
		case "delivery":
			return "delivery.jsp";
			case "stock":
			return "stock.jsp";
		default:
		console.error('JSP 페이지 로딩 중 에러:', error);
			return "";
	}
}
