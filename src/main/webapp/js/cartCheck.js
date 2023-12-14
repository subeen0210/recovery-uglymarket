function userLoginCheck(id) {
	if (id == "") {
		alert('ログイン後に使用できます。');
		location.href = 'LoginPageC';
	} else {
		location.href = 'CartAllC';
	}
};