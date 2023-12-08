// 토글 id toggleLink
document.addEventListener("DOMContentLoaded", function () {
  const toggleLink = document.getElementById("toggleLink");

  if (toggleLink) {
      toggleLink.addEventListener("click", function (event) {
          event.preventDefault(); // 기본 동작을 막아 클릭 시 페이지 이동을 방지
          this.classList.toggle("active");
      });
  }
});

// bx슬라이더
document.addEventListener("DOMContentLoaded", function(){
  $('.bxslider').bxSlider({
      mode: 'horizontal', // 슬라이드 방향: 'horizontal' 또는 'vertical'
      captions: true,      // 이미지 위에 캡션 표시 여부
      auto: true,          // 자동 슬라이드 여부
      pause: 3000          // 자동 슬라이드 시간 간격 (밀리초)
  });
})