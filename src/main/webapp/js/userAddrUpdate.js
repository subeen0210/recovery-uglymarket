/**
 *  user Mypage address update
 */

$(function() {

	//주문 상세 모달
	const myModal = document.getElementById('myModal');
	const closeModalBtn = document.getElementById('closeModalBtn');


	closeModalBtn.addEventListener('click', () => {
		myModal.close();
	});

	$(".openModalBtn").on("click", function() {
		// 해당 버튼의 data-post-id 속성 값 가져오기
		let a_no = $(this).data("no");

		// Ajax 요청 설정
		$.ajax({
			url: "AddrShowC?a_no=" + a_no,
			method: "get",
			dataType: "json",
			success: function(data) {
				// 결과를 해당 버튼의 결과 엘리먼트에 출력
				console.log(data);
				$("#nameInput").val(data.a_name);
				$("#telInput").val(data.a_tel);
				
				let time = data.a_req;
				$('#deliveryTime').val(time).prop("selected", true);
				
				$("#addrNum").val(data.a_postcode);
				
				let addr = data.a_addr.split('!');
				$("#addrPrefecture").val(addr[0]);
				$("#addrCity").val(addr[1]);
				
				
				$("#addrDetail").val(data.a_addrDetail);
				
				$("#formUpBtn").val(data.a_no);
				
				
				
				myModal.showModal();
			},
			error: function(xhr, status, error) {
				console.error("Error:", error);
			}
		});
	});
	
	
	
	
	
	// 주소 등록 모달
	const myModal2 = document.getElementById('myModal2');
	const openRegAddrBtn = document.getElementById('openRegAddrBtn');
	const closeModalBtn2 = document.getElementById('closeModalBtn2');


	openRegAddrBtn.addEventListener('click', () => {
		myModal2.showModal();
	});
	
	closeModalBtn2.addEventListener('click', () => {
		myModal2.close();
	});
});

function updateCheck() {
	if(confirm('住所を変更しますか?')){
		return true;
	}
	return false;
};

function regCheck() {
	if(confirm('住所を追加しますか?')){
		return true;
	}
	return false;
}

function deleteAddr(no) {
	if(confirm('削除しますか?')){
		location.href='deleteAddrC?no='+no;
	}
}
