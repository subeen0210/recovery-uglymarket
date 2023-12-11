<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송 주소 관리</title>
    <!-- 여기에 필요한 CSS 링크 등을 추가할 수 있습니다. -->
</head>
<body>
<h1>会員住所管理</h1>

    <h2>配送先住所リスト</h2>

    <table border="1">
        <thead>
            <tr>
                <th>名前</th>
                <th>住所</th>
                <th>携帯電話</th>
                <th>修正</th>
                <th>削除</th>
            </tr>
        </thead>
        <tbody>
           
            <tr>
                <td>小田さくら</td>
                <td>神奈川県座間市相模が丘</td>
                <td>080-1234-5678</td>
                <td><a href="editAddress.jsp?id=1">修正</a></td>
                <td><a href="deleteAddress.jsp?id=1">削除</a></td>
            </tr>
        </tbody>
    </table>

    <br>

    <a href="addAddress.jsp">新しい住所追加</a>

  

</body>
</html>