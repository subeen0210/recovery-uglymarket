// bx슬라이더
document.addEventListener("DOMContentLoaded", function() {
	$('.bxslider').bxSlider({
		mode: 'horizontal', // 슬라이드 방향: 'horizontal' 또는 'vertical'
		captions: true,      // 이미지 위에 캡션 표시 여부
		auto: true,          // 자동 슬라이드 여부
		pause: 3000,          // 자동 슬라이드 시간 간격 (밀리초)
		adaptiveHeight: true,
		adaptiveWidth: true

	});
})

//$(window).on('resize', function() {
//	// 확대/축소 이벤트 발생시 bxslider를 다시 로드
//	slider.reloadSlider();
//});

// 스크롤 이벤트를 감지하여 화살표 위 아이콘의 표시 여부를 조절합니다.
//window.onscroll = function() {
//	scrollFunction();
//};
