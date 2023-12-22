function itemAdd() {
    var fileInput = document.querySelector('.img');
    var formData = new FormData();
    
    if (!isEmpty()) {
	
        return; 
    }

    for (let i = 0; i < fileInput.files.length; i++) {
        var file = fileInput.files[i];
        if (file) {
            formData.append('img' + (i + 1), file);
        }
    }
/*
    let name = $("input[name='name']").val();
    let story = $("textarea[name='story']").val();
    let type = $("input[name='type']:checked").val();
    let enddate = $("input[name='enddate']").val();
    let stock = $("input[name='stock']").val();
    let price = $("input[name='price']").val();

    formData.append('name', name);
    formData.append('story', story);
    formData.append('type', type);
    formData.append('enddate', enddate);
    formData.append('stock', stock);
    formData.append('price', price);

    $.ajax({
        url: 'ItemAddC',
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (res) {
            // 서버 응답에 따라 알림 표시
            console.log(res);
            if (res === 'success') {
                alert("상품이 등록되었습니다.");
                window.location.href = 'SellerMypageC';
            } else {
                alert('상품 등록 실패');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
   		console.error('AJAX 오류:', textStatus, errorThrown);
		}
    }); */
	return true;
}



function isEmpty(){
	var name = $("input[name='name']");
    var story = $("textarea[name='story']");
    var enddate = $("input[name='enddate']");
    var stock = $("input[name='stock']");
    var price = $("input[name='price']");
    var fileInput = document.querySelector('.img');
	
	
	if (!name.val().trim()) {
        alertAndFocus(name, '상품명을 입력해주세요.');
        return false;
    }

    if (!story.val().trim()) {
        alertAndFocus(story, '상품설명을 입력해주세요.');
        return false;
    }

    if (!enddate.val()) {
        alertAndFocus(enddate, '날짜를 입력해주세요.');
        return false;
    }

    if (!stock.val().trim()) {
        alertAndFocus(stock, '재고를 입력해주세요.');
        return false;
    }

    if (!price.val().trim()) {
        alertAndFocus(price, '가격을 입력해주세요.');
        return false;
    }

    if (fileInput.files.length === 0) {
        alert('이미지를 첨부해주세요.');
        return false;
    }

    if (fileInput.files.length > 4) {
        alert('이미지는 최대 4장까지 첨부 가능합니다.');
        return false;
    }

    return true;
}

function alertAndFocus(element, message) {
    alert(message);
    element.focus();
}