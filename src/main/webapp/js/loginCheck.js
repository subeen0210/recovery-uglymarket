/**
 * 
 */
function loginCall() {
let userID = document.querySelector('#loginUserID');
let userPW = document.querySelector('#loginUserPW');
	
if(isEmpty(userID)){
	$("#loginEmptyID").text("아이디 비어있음!!");
	$("#loginEmptyID").css("color", "red");
	userID.focus();
	return false;
};
if(isEmpty(userPW)){
	alert("비밀번호 비어있음!!");
	userPW.focus();
	return false;
	
};

userlogin();
};


function userlogin(){
	let userID = $("#loginUserID").val();
	let userPW = $("#loginUserPW").val();
	
	$.ajax({
            type: "post",
            url: "LoginPageC",
            data:{userID, userPW},
            success: function (response) {
				console.log(response);
                if (response === "0") {
                    $("#errorMessage").text("IDまたはパスワードが正しくありません。");
                } else{
					location.href='HC';
				}
            },
            error: function (xhr,status,error) {
                $("#idStatus").text("서버와 통신 중 오류가 발생했습니다.");
				console.log('xhr: ', xhr);
				console.log('status: ', status);
				console.log('error: ', error);
            }
        });
};


function loginSellerCall(){
let sellerID = document.querySelector('#loginSellerID');
let sellerPW = document.querySelector('#loginSellerPW');

if(isEmpty(sellerID)){
	alert("아이디 비어있음!!");
	sellerID.focus();
	return false;
};
if(isEmpty(sellerPW)){
	alert("비밀번호 비어있음!!");
	sellerPW.focus();
	return false;
};
};


function sellerlogin(){
	let userID = $("#loginUserID").val();
	let userPW = $("#loginUserPW").val();
	
	$.ajax({
            type: "post",
            url: "LoginPageC",
            data:{userID, userPW},
            success: function (response) {
				console.log(response);
                if (response === "0") {
                    $("#errorMessage").text("IDまたはパスワードが正しくありません。");
                } else{
					location.href='HC';
				}
            },
            error: function (xhr,status,error) {
                $("#idStatus").text("서버와 통신 중 오류가 발생했습니다.");
				console.log('xhr: ', xhr);
				console.log('status: ', status);
				console.log('error: ', error);
            }
        });
};
