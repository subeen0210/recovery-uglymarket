function handleEnterKey(event) {
    // keyCode 13은 Enter 키를 나타냄
    if (event.keyCode === 13) {
        // 검색창의 값 가져오기
        let searchValue = document.getElementById("searchInput").value;

        // 여기에 검색창에서 Enter 키를 눌렀을 때 실행할 동작을 추가
      //  alert("검색어: " + searchValue);
		location.href='ShopC?name=' + searchValue;
    }
}

// 검색창에 이벤트 리스너 등록
document.getElementById("searchInput").addEventListener("keyup", handleEnterKey);