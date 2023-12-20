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
        <h1>리뷰 관리 목록</h1>
        <div class="my_review_buttons">
        <button id="modify">수정</button>
        <button id="delete">삭제</button>
        </div>
        <table id="reviewTable">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성일</th>
                    <th>별점</th>
                </tr>
            </thead>
            <tbody>
                <!-- 리뷰 목록이 여기에 표시될 것입니다 -->
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="js/reviewList.js"></script>
</body>
</html>
