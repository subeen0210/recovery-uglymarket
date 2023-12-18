// js/reviewList.js

$(document).ready(function() {
    // 페이지 로드 시 리뷰 목록을 가져와서 표시
    loadReviewList();
});

function loadReviewList() {
    // AJAX를 사용하여 서버에서 리뷰 목록 데이터를 가져옴
    $.ajax({
        url: 'ReviewListServlet', // 실제로는 서블릿이나 다른 백엔드 로직을 호출하는 URL로 변경해야 합니다.
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            // 서버에서 받은 리뷰 목록 데이터를 테이블에 표시
            displayReviewList(response);
        },
        error: function(error) {
            console.error('AJAX 에러:', error);
        }
    });
}

function displayReviewList(reviewList) {
    var tableBody = $('#reviewTable tbody');

    // 기존에 표시된 데이터를 지우고 새로운 데이터로 갱신
    tableBody.empty();

    // 각 리뷰에 대해 테이블 행을 추가
    for (var i = 0; i < reviewList.length; i++) {
        var review = reviewList[i];
        var row = '<tr>' +
                  '<td>' + review.id + '</td>' +
                  '<td>' + review.author + '</td>' +
                  '<td>' + review.title + '</td>' +
                  '<td>' + review.content + '</td>' +
                  '<td>' + review.date + '</td>' +
                  '</tr>';
        tableBody.append(row);
    }
}
