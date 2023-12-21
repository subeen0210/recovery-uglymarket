function scrollFunction() {
	var arrowIcon = document.querySelector('.scroll-to-top');
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		arrowIcon.style.display = 'block';
	} else {
		arrowIcon.style.display = 'none';
	}
}

// 화살표 위 아이콘을 클릭했을 때 맨 위로 스크롤합니다.
function scrollToTop() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}