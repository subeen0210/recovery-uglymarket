// 전체 선택 체크박스 요소 가져오기
var selectAllCheckbox = document.getElementById("selectAll");

// 항목 목록 가져오기
var itemList = document.getElementById("itemList");

// 각 항목의 체크박스 요소 가져오기
var itemCheckboxes = document.querySelectorAll(".item-checkbox");

// 전체 선택 체크박스의 변경 이벤트 처리
selectAllCheckbox.addEventListener("change", function() {
	var isChecked = selectAllCheckbox.checked;

	// 모든 항목의 체크박스 상태를 변경
	itemCheckboxes.forEach(function(checkbox) {
		checkbox.checked = isChecked;

		// 선택된 항목에 스타일 적용 또는 제거
		checkbox.parentNode.classList.toggle("selected-item", isChecked);
	});
});

// 선택 삭제 버튼 클릭 이벤트 처리
function deleteSelected() {
	// 선택된 항목 찾기
	var selectedItems = document.querySelectorAll(".item-checkbox:checked");

	// 선택된 항목 삭제
	selectedItems.forEach(function(selectedItem) {
		selectedItem.parentNode.remove();
	});

	// 전체 선택 체크박스 초기화
	selectAllCheckbox.checked = false;
}
