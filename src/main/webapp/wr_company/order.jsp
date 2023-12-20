<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 상세 정보</title>
 
</head>
<body>
<div class="main">
    <h1>주문 상세 정보</h1>
<div class="button_div"><button>수정</button>
<button>수정</button></div>
    <table>
        <thead>
            <tr>
                <th>선택</th>
                <th>상품 사진</th>
                <th>상품명</th>
                <th>수량</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td><img src="product1.jpg" alt="상품1"></td>
                <td>상품 1</td>
                <td>2</td>
                <td>$30.00</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td><img src="product2.jpg" alt="상품2"></td>
                <td>상품 2</td>
                <td>1</td>
                <td>$20.00</td>
            </tr>
         
        </tbody>
    </table>
    </div>
</body>
</html>