<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 관리 목록</title>
    <link rel="stylesheet" href="wr_company/css/reviewList.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="js/review.js"></script>
</head>
<body>
    <div id="reviewListContainer">
        <h1>商品レビュー</h1>
<!--         <div class="my_review_buttons"> -->
<!--         </div> -->
        <table id="reviewTable">
            <thead>
                <tr>
                    <th>商品名</th>
                    <th>内容</th>
                    <th>作成日時</th>
                    <th>点</th>
                    <th>削除</th>
                </tr>
            </thead>
            <tbody id="review-tbody">
            
            </tbody>
        </table>
    </div>

</body>

</html>
