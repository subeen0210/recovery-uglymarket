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

//////////////////////////////////////////////////////
// 선택삭제
function deleteSelectCart(){
	alert('aa');
};

// 그냥 삭제버튼
// 누르면 그 배열의 값을 받아서 삭제 
function deleteCart(i_no){
	let ok = confirm('カートで商品を削除しますか');
	if(ok){
		 $.ajax({
            type: "POST",
            url: "deleteCartItem", // 서버에서 해당 엔드포인트를 제공해야 함
            data: { i_no: i_no },
            success: function(response) {
                // 서버에서 응답을 받았을 때의 처리
                // 여기서는 간단히 해당 요소를 삭제
                // 예시: 해당 요소를 jQuery를 사용하여 숨김 처리
                $(`.${i_no}`).hide();
            },
            error: function(error) {
                console.error("Delete request failed: ", error);
            }
        });
	};
};

