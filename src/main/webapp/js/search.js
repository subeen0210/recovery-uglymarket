function handleEnterKey(event) {
    if (event.keyCode === 13) {
        let searchValue = document.getElementById("searchInput").value;

        // 여기에 검색창에서 Enter 키를 눌렀을 때 실행할 동작을 추가
		location.href='ShopC?name=' + searchValue;
    }
}

// 검색창에 이벤트 리스너 등록
document.getElementById("searchInput").addEventListener("keyup", handleEnterKey);


