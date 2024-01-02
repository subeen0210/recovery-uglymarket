function userLoginCheck(id) {
	console.log(id);
	if (id == "") {
		alert('ログイン後に使用できます。');
		location.href = 'LoginPageC';
	} else {
		$.ajax({
			url: 'SessionCheck', // 서버 측 코드가 처리하는 URL
			method: 'GET',
			success: function(response) {
				if (response == '0') {
					// 세션이 만료된 경우
					alert('ログインが切れました。ログインページに移動します。');
					location.href = 'LoginPageC';
				} else {
					location.href = 'CartAllC';
				}
			},
			error: function() {
				// 에러 처리
				console.error('세션 확인 중 오류가 발생했습니다.');
			}
		});
	}
};