// js/orderDetails.js

$(document).ready(function() {
    // 페이지 로드 시 주문 정보를 가져와서 표시
    loadOrderDetails();
});

function loadOrderDetails() {
    // AJAX를 사용하여 서버에서 주문 정보 데이터를 가져옴
    $.ajax({
        url: 'OrderDetailsServlet', // 실제로는 서블릿이나 다른 백엔드 로직을 호출하는 URL로 변경해야 합니다.
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            // 서버에서 받은 주문 정보 데이터를 표시
            displayOrderDetails(response);
        },
        error: function(error) {
            console.error('AJAX 에러:', error);
        }
    });
}

function displayOrderDetails(orderDetails) {
    var orderInfoContainer = $('#orderInfo');

    // 주문 정보를 HTML로 구성하여 표시
    var orderHtml = '<p><strong>상품 사진:</strong> <img src="' + orderDetails.productImage + '" alt="Product Image"></p>' +
                    '<p><strong>물품명:</strong> ' + orderDetails.productName + '</p>' +
                    '<p><strong>결제 금액:</strong> ' + orderDetails.paymentAmount + ' 원</p>' +
                    '<p><strong>판매자 이름:</strong> ' + orderDetails.sellerName + '</p>';

    orderInfoContainer.html(orderHtml);
}
