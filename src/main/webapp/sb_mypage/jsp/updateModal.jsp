<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

	<div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>상품 수정</h2>
            
            <!-- 상품 수정 폼 -->
            <form action="ItemUpdateC" method="post" enctype="multipart/form-data">
                <div>
                    <div>
                        <div>상품명</div>
                        <div><input name="name" class="name"></div>
                    </div>
                    <div>
                        <div>상품 설명</div>
                        <div><textarea class="story" name="story"></textarea></div>
                    </div>
                    <div>
                    	<div>상품 종류</div>
                    	<div>
                    		<label>못난이<input type="radio" value="1" name="type" class="select"></label>
							<label>일반<input type="radio" value="2" name="type" class="select"></label>
                    	</div>
                	</div>
                	<div>
                		<div>유통기한</div>
                		<div> <input name="enddate" type="date"> </div>
                	</div>
					<div>
						<div>상품 가격</div>
						<div><input name="price"  class="price"></div>
					</div>
					<div>
						<div>사진 등록</div>
						<div><input type="file" name="img" class="img"></div>
						<div><input type="file" name="img2" class="img"></div>
						<div><input type="file" name="img3" class="img"></div>
						<div><input type="file" name="img4" class="img"></div>
					</div>
                </div>
                
                <!-- 수정 버튼 -->
                <button type="submit">수정</button>
            </form>
        </div>
    </div>
    
</body>
</html>