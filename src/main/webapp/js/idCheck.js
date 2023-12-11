/**
 * 
 */
$(function(){
	$("#checkDuplicate").click(function () {
        // 클라이언트에서 입력한 ID 가져오기
		console.log(11);
        let userID = $("#userID").val();

        // 서버로 ID 전송 및 중복 확인
        $.ajax({
            type: "POST",
            url: "IDCheckDuplicateC", // 서버에서 ID 중복 확인을 수행하는 API 엔드포인트
            data: { userID: userID },
            success: function (response) {
                if (response === "available") {
                    $("#idStatus").text("사용 가능한 ID입니다.");
                } else if (response === "unavailable") {
                    $("#idStatus").text("이미 사용 중인 ID입니다.");
                } else {
                    $("#idStatus").text("ID 확인 중 오류가 발생했습니다.");
                }
            },
            error: function () {
                $("#idStatus").text("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    });
	
});