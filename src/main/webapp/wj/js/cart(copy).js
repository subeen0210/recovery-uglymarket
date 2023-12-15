// 전체 선택 체크박스 요소 가져오기
let checkAll = document.getElementById("checkAll");

// 각 항목의 체크박스 요소 가져오기
let checkboxes = document.querySelectorAll(".item-checkbox");

// 전체 선택 체크박스의 변경 이벤트 처리
checkAll.addEventListener("click", function() {
	const isChecked = checkAll.checked;

	if (isChecked) {
	// 모두 체크
		for (const checkbox of checkboxes) {
			checkbox.checked = true;
		}
	}

	else {
	// 모두 체크 안함
		for (const checkbox of checkboxes) {
			checkbox.checked = false;
		}
	}

	
});
//////////////////////////////////////////////////////
for(const checkbox of checkboxes){
  checkbox.addEventListener('click',function(){
    
    const totalCnt = checkboxes.length;
  
    const checkedCnt = document.querySelectorAll('.item-checkbox:checked').length;
    
	// 개별 선택의 변경에 따른 전체선택 체크박스의 체크유무
    if(totalCnt == checkedCnt){
      document.querySelector('#checkAll').checked = true;
    }
    else{
      document.querySelector('#checkAll').checked = false;
    }
    
  });
  
}
