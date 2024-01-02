let popupData;
	$(function() {
		$("#addr-popup").click(
				function() {
					console.log("Popup button clicked");
					let popup = window.open("lgh_account/addrPopup.jsp", "우편번호 검색",
							"width=700, height=700, left=100, top=50");

					popup.onbeforeunload = function() {
						// 팝업에서 전달받은 데이터 출력
						console.log(popupData);
						
						// 정규식을 사용하여 숫자, 도시, 시를 추출
						const matchResult = popupData.match(/(\d+)!(.+?)!(.+)/);
						console.log(matchResult);
						
						
						    // matchResult 배열의 각 요소에서 추출된 값을 가져옴
						    const zipCode = matchResult[1];
						    const prefecture = matchResult[2];
						    const city = matchResult[3];

						    // 결과 출력
						    console.log("Zip Code: " + zipCode);
						    console.log("Prefecture: " + prefecture);
						    console.log("City: " + city);
							
						    $("#addrNum").val(zipCode);
						    $("#addrPrefecture").val(prefecture);
		                    $("#addrCity").val(city);
				
						
						
					};

				});
				
				
				
				$("#addr-popup2").click(
				function() {
					console.log("Popup button clicked");
					let popup = window.open("lgh_account/addrPopup.jsp", "우편번호 검색",
							"width=700, height=700, left=100, top=50");

					popup.onbeforeunload = function() {
						// 팝업에서 전달받은 데이터 출력
						console.log(popupData);
						
						// 정규식을 사용하여 숫자, 도시, 시를 추출
						const matchResult = popupData.match(/(\d+)!(.+?)!(.+)/);
						console.log(matchResult);
						
						
						    // matchResult 배열의 각 요소에서 추출된 값을 가져옴
						    const zipCode = matchResult[1];
						    const prefecture = matchResult[2];
						    const city = matchResult[3];

						    // 결과 출력
						    console.log("Zip Code: " + zipCode);
						    console.log("Prefecture: " + prefecture);
						    console.log("City: " + city);
							
						    $("#addrNum2").val(zipCode);
						    $("#addrPrefecture2").val(prefecture);
		                    $("#addrCity2").val(city);
				
						
						
					};

				});

	});

	// 부모 창에서 호출할 함수
	function receiveDataFromPopup(data) {
		// 팝업에서 전달받은 데이터 저장
		popupData = data;
	}