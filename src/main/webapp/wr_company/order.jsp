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
    <h1>注文詳細情報</h1>
<div class="button_div"><button id="modify">修正</button>
<button id="delete">削除</button></div>
    <table>
        <thead>
            <tr>
                <th>選択</th>
                <th>写真</th>
                <th>商品名</th>
                <th>数量</th>
                <th>価格</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td><img src="product1.jpg" alt="상품1"></td>
                <td>アグリートマト</td>
                <td>2</td>
                <td>3000</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td><img src="product2.jpg" alt="상품2"></td>
                <td>可愛いイチゴ</td>
                <td>1</td>
                <td>1000</td>
            </tr>
         
        </tbody>
    </table>
    </div>
</body>
</html>