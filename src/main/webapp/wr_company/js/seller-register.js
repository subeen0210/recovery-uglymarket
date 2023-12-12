function showContent(contentId) {
  // 모든 내용 숨기기
  var contents = document.getElementsByClassName('content');
  for (var i = 0; i < contents.length; i++) {
    contents[i].style.display = 'none';
  }

  // 선택한 내용 표시
  var selectedContent = document.getElementById(contentId);
  if (selectedContent) {
    selectedContent.style.display = 'block';
  }

  // 모든 메뉴에서 active 클래스 제거
  var menuItems = document.querySelectorAll('.menu li');
  menuItems.forEach(function (item) {
    item.classList.remove('active');
  });

  // 선택한 메뉴에 active 클래스 추가
  var selectedMenuItem = document.getElementById('menu-' + contentId);
  if (selectedMenuItem) {
    selectedMenuItem.classList.add('active');
  }
}
