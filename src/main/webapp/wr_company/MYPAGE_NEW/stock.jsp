<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/seller_register.css">
<!--<link rel="stylesheet" href="css/header.css">-->
</head>
<body>

      
<div class="content">
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
        <tbody>
           
            <tr>
                <td>アグリージャガイモ</td>
                <td>3</td>
                <td>2023-12-31</td>
                <td>10000</td>
                <td><a href="editAddress.jsp?id=1">修正</a></td>
                <td><a href="deleteAddress.jsp?id=1">削除</a></td>
            </tr>
            <tr>
                <td>可愛いイチゴ</td>
                <td>10</td>
                <td>2023-12-28</td>
                <td>30000</td>
                <td><a href="editAddress.jsp?id=1">修正</a></td>
                <td><a href="deleteAddress.jsp?id=1">削除</a></td>
            </tr>
            <tr>
                <td>長いニンジン</td>
                <td>30</td>
                <td>2024-01-03</td>
                <td>6000</td>
                <td><a href="editAddress.jsp?id=1">修正</a></td>
                <td><a href="deleteAddress.jsp?id=1">削除</a></td>
            </tr>
            
            
        </tbody>
    </table>

    <br>
    
    </div>
</body>
</html>