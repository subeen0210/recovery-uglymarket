<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="wr_company/MYPAGE_NEW/css/seller_register.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/modal.css">
</head>
<body>

      
	<div class="content" id="product-management">
    	<h2>在庫リスト</h2>

    	<table border="1">
       		<thead>
            	<tr>
                	<th>商品名</th>
                	<th>財御量</th>
                	<th>賞味期限</th>
                	<th>価格</th>
                	<th>修正</th>
                	<th>削除</th>
            	</tr>
        	</thead>
        	<tbody id="tbody">
          
        	</tbody>
    	</table>
    
    </div>
    
    
    
<!-- 모달 내용 시작 -->
	<div id="myModal" class="modal">
  	<div class="modal-content">
   		<span class="close">&times;</span>
 
    	<form action="UpdateItemC" method="post" enctype="multipart/form-data">
    	<br>
   		<br>
     	<div>
			<div>
				<div>商品名</div>
				<div><input name="name" class="name"></div>
			</div>
		<div>
			<div>商品の説明</div>
			<div><textarea class="story" name="story"></textarea></div>
		</div>
		<div>
			<div class="radio-container">商品種類
				<label>アグリー<input type="radio" value="1" name="type" class="select"></label>
				<label>ふつう<input type="radio" value="2" name="type" class="select"></label>
			</div>
		</div>
		<div>
			<div>賞味期限</div>
			<div><input name="enddate" type="date" class="date"></div>
		</div>
		<div>
			<div>商品在郷</div>
			<div><input name="stock" class="stock"></div>
		</div>
		<div>
			<div>商品価格</div>
			<div><input name="price"  class="price"></div>
		</div>
		<div>
			<div>写真登録（一番目の写真が代表イメージになります。）</div>
			<div><input type="file" name="img" class="img"></div>
		</div>
	</div>
     
    	</form>
  </div>
</div>
<!-- 모달창 내용 끝 -->

			

</body>
</html>