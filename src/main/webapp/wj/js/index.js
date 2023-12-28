// 스크롤 탑 (맨위로 이동) 원준 작업
function scrollToTop() {
	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});
}

document.addEventListener('DOMContentLoaded', function() {
	var scrollToTopButton = document.querySelector('.scroll-to-top');

	// 스크롤 위치에 따라 scroll-to-top 버튼을 표시/숨김
	window.addEventListener('scroll', function() {
		if (window.scrollY > 200) {
			scrollToTopButton.style.display = 'block';
		} else {
			scrollToTopButton.style.display = 'none';
		}
	});

	// 버튼 클릭 이벤트에 scrollToTop 함수 연결
	scrollToTopButton.addEventListener('click', scrollToTop);
});