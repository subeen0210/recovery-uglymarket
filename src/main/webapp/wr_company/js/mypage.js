$(document).ready(function() {
	// 버튼 클릭 이벤트
	$("#kanri").on("click", function() {
		// AJAX를 이용해 별도의 JSP 파일 로드
		$.ajax({
			url: "wr_company/kanri.jsp", // 로드할 다른 JSP 파일 경로
			method: "GET",
			success: function(data) {
				// 로드 성공 시, 결과를 #loadedContent에 삽입
				$("#mypage_centents3_box").html(data);
			},
			error: function() {
				// 로드 실패 시 처리
				alert("데이터를 불러오는 데 실패했습니다.");
			}
		});
	});
	$("#order").on("click", function() {
		// AJAX를 이용해 별도의 JSP 파일 로드
		$.ajax({
			url: "wr_company/order.jsp", // 로드할 다른 JSP 파일 경로
			success: function(data) {
				// 로드 성공 시, 결과를 #loadedContent에 삽입
				$("#mypage_centents3_box").html(data);
			},
			error: function() {
				// 로드 실패 시 처리
				alert("데이터를 불러오는 데 실패했습니다.");
			}
		});
	});
	$("#cart").on("click", function() {
		// AJAX를 이용해 별도의 JSP 파일 로드
		$.ajax({
			url: "wr_company/cart.jsp", // 로드할 다른 JSP 파일 경로
			success: function(data) {
				// 로드 성공 시, 결과를 #loadedContent에 삽입
				$("#mypage_centents3_box").html(data);
			},
			error: function() {
				// 로드 실패 시 처리
				alert("데이터를 불러오는 데 실패했습니다.");
			}
		});
	});
	$("#review").on("click", function() {
		// AJAX를 이용해 별도의 JSP 파일 로드
		$.ajax({
			url: "wr_company/review.jsp", // 로드할 다른 JSP 파일 경로
			success: function(data) {
				// 로드 성공 시, 결과를 #loadedContent에 삽입
				$("#mypage_centents3_box").html(data);
			},
			error: function() {
				// 로드 실패 시 처리
				alert("데이터를 불러오는 데 실패했습니다.");
			}
		});
	});
	$("#seller-register").on("click", function() {
    // Ajax를 이용해 서버에 요청을 보내고 사업자 회원 여부 확인
    $.ajax({
        url: "CheckSellerC",
        method: "POST",
        success: function(response) {
            if (response === "true") {
                // 사업자 회원인 경우, 별도의 JSP 파일 로드
                $.ajax({
                    url: "wr_company/seller_register3.jsp",
                    success: function(data) {
                        // 로드 성공 시, 결과를 #mypage_centents3_box에 삽입
                        $("#mypage_centents3_box").html(data);
                    },
                    error: function() {
                        // 로드 실패 시 처리
                        alert("데이터를 불러오는 데 실패했습니다.");
                    }
                });
            } else {
                // 사업자 회원이 아닌 경우, 경고창 표시
                alert("사업자 회원만 이용 가능합니다!");
            }
        },
        error: function() {
            // 에러 발생 시 처리
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
	});


});