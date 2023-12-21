function itemAdd() {

		var fileInput = document.querySelector('.img');
		console.log(fileInput);
		var formData = new FormData();
		
		for (let i = 0; i < fileInput.files.length; i++) {
			console.log(fileInput.files[i]);
			var file = fileInput.files[i];
			if (file) {
				formData.append('img' + (i + 1), file);
			}
		}
		let name = $("input[name='name']").val();
		let story = $("textarea[name='story']").val();
		let type = $("input[name='type']:checked").val();
		let enddate = $("input[name='enddate']").val();
		let stock = $("input[name='stock']").val();
		let price = $("input[name='price']").val();

	/*	  if (!name.trim()) {
        alert('상품명을 입력해주세요.');
        return;
    	}

    	if (!story.trim()) {
        alert('상품설명을 입력해주세요.');
        return;
    	}

    	if (!enddate) {
        alert('날짜를 입력해주세요.');
        return;
    	}

    	if (!stock.trim()) {
        alert('재고를 입력해주세요.');
        return;
    	}

    	if (!price.trim()) {
        alert('가격을 입력해주세요.');
        return;
    	}

    	if (fileInput.files.length === 0) {
        alert('이미지를 첨부해주세요.');
        return;
    	}

    	if (fileInput.files.length > 4) {
        alert('이미지는 최대 4장까지 첨부 가능합니다.');
        return;
    	}
*/

		formData.append('name', name);
		formData.append('story', story);
		formData.append('type', type);
		formData.append('enddate', enddate);
		formData.append('stock', stock);
		formData.append('price', price);

		$.ajax({
			url : 'ItemAddC',
			method : 'POST',
			data : formData,
			processData : false, 
			contentType : false,
			success : function(res) {
				// 성공 메시지 표시
				console.log(res)
				if(res == 1){
				alert("상품이 등록되었습니다.");
				window.location.href = 'SellerMypageC';
				}else{
					alert('상품 등록 실패')
				}
			},
			error : function(error) {
				console.error('에러:', error);
			}
		});
}


