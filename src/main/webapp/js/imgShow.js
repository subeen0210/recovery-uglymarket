$(function() {

	//처음 이미지 가져오기
	let photo_path = $('#previewImg').attr('src');
	console.log(photo_path);
	let my_photo; //회원이 업로드할 이미지 담을 변수
	$('#fileInput').change(function() {
		my_photo = this.files[0];
		if (!my_photo) {
			$('#previewImg').attr('src', photo_path);
			return
		}
		if (my_photo.size > 1024 * 1024) {
			alert(Math.round(my_photo.size / 1024 / 1024) + 'MB(1MB까지만 업로드 가능)');
			$('#previewImg').attr('src', photo_path);
			$(this).val('');
			return;
		}
		//이미지 미리보기 처리
		let reader = new FileReader();
		reader.readAsDataURL(my_photo);
		console.log(my_photo);
		
		const fileName = my_photo.name;
		$(".upload-img").val(fileName);
		reader.onload = function() {
			$('#previewImg').attr('src', reader.result);
		};
	});



});