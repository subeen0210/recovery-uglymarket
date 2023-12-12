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
