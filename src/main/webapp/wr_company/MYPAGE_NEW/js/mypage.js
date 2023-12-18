// mypage.js

$(document).ready(function() {
	// 초기 페이지 로딩 시 실행할 코드
	showJSP('insert');

	// 각 메뉴에 클릭 이벤트 리스너 추가
	$('.main_menu a').click(function(event) {
		event.preventDefault();
		var pageId = $(this).attr('data-page-id');
		showJSP(pageId);
	});
});

$(document).ready(function() {
  $('.main_menu_control div').click(function(event) {
    event.preventDefault();

    // 기존에 선택된 메뉴에서 'selected' 클래스 제거
    $('.main_menu_control div').removeClass('selected');

    // 현재 눌린 메뉴에 'selected' 클래스 추가
    $(this).addClass('selected');

    var pageId = $(this).attr('data-page-id');
    showJSP(pageId);
  });
});

function showJSP(pageId) {
	var jspContainer = $('.jsp_view');

	if (jspContainer.length > 0) {

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
	
	switch (pageId) {

		case "insert":
			return "insert.jsp"
		case "register":
			return "register.jsp";
		case "delivery":
			return "delivery.jsp";
		case "stock":
			return "stock.jsp";
		case "mypage":
			return "farmpage.jsp";
		default:
			console.error('JSP 페이지 로딩 중 에러:', error);
			return "";
	}
}
