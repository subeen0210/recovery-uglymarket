<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 관리 목록</title>
    <link rel="stylesheet" href="css/reviewList.css">
 
</head>
<body>
    <div id="reviewListContainer">
        <h1>レビュー管理リスト</h1>
        <div class="my_review_buttons">
        <button id="modify">修正</button>
        <button id="delete">削除</button>
        </div>
        <table id="reviewTable">
            <thead>
                <tr>
                    <th>タイトル</th>
                    <th>内容</th>
                    <th>作成日時</th>
                    <th>スター</th>
                </tr>
            </thead>
            <tbody>
                <!-- 리뷰 목록 표시 -->
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="js/reviewList.js"></script>
</body>
</html>
