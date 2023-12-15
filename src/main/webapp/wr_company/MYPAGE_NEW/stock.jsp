<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/seller_register3.css">
<link rel="stylesheet" href="css/header.css">
</head>
<body>
<h2>재고 관리</h2>
      
<div class="content">
    <h2>상품리스트</h2>

    <table border="1">
        <thead>
            <tr>
                <th>상품이름</th>
                <th>재고량</th>
                <th>유통기한</th>
                <th>가격</th>
                <th>修正</th>
                <th>削除</th>
            </tr>
        </thead>
        <tbody>
           
            <tr>
                <td>못난이감자</td>
                <td>3</td>
                <td>2023-12-31</td>
                <td>10000</td>
                <td><a href="editAddress.jsp?id=1">修正</a></td>
                <td><a href="deleteAddress.jsp?id=1">削除</a></td>
            </tr>
            <tr>
                <td>예쁜딸기</td>
                <td>10</td>
                <td>2023-12-28</td>
                <td>30000</td>
                <td><a href="editAddress.jsp?id=1">修正</a></td>
                <td><a href="deleteAddress.jsp?id=1">削除</a></td>
            </tr>
            <tr>
                <td>당근</td>
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