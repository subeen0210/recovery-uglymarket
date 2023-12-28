<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 관리 목록</title>
    <link rel="stylesheet" href="wr_company/css/reviewList.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 
</head>
<body>
    <div id="reviewListContainer">
        <h1>レビュー管理リスト</h1>
        <div class="my_review_buttons">
        </div>
        <table id="reviewTable">
            <thead>
                <tr>
                    <th>タイトル</th>
                    <th>内容</th>
                    <th>作成日時</th>
                    <th>スター</th>
                    <th>削除</th>
                </tr>
            </thead>
            <tbody>
               <tr>
               <td>可愛いイチゴ</td>
               <td>おいしいです</td>
               <td>2023.12.20</td>
               <td>★★★★★</td>
               <td><button id="delete">削除</button></td>
               </tr>
            </tbody>
        </table>
    </div>

    <script src="wr_company/js/reviewList.js"></script>
</body>

</html>
