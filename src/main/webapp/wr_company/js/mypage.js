$(function() {
    let previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수

    // 'kanri' id를 가진 div에 대한 클릭 이벤트
    $('#kanri').on('click', function(event) {
        handleDivClick(event, 'wr_company/kanri.jsp', '#kanri');
    });

    // 'review' id를 가진 div에 대한 클릭 이벤트
    $('#review').on('click', function(event) {
        handleDivClick(event, 'wr_company/review.jsp', '#review');
    });

    // 'order' id를 가진 div에 대한 클릭 이벤트
    $('#order').on('click', function(event) {
        handleDivClick(event, 'wr_company/order.jsp', '#order');
    });

    // 'cart' id를 가진 div에 대한 클릭 이벤트
    $('#cart').on('click', function(event) {
        handleDivClick(event, 'CartAllC', '#cart');
    });


    $('#user_modify').on('click', function(event) {
        handleDivClick(event, 'wr_company/user_modify.jsp', '#user_modify');
    });

    function handleDivClick(event, pageUrl, divId) {
        // 기본 동작(페이지 이동) 막기
        event.preventDefault();

        // 이전에 클릭된 div의 색상 초기화
        if (previousClickedDiv !== null) {
            previousClickedDiv.removeClass('clicked');
        }

        // AJAX 요청 수행
        $.ajax({
            url: pageUrl,
            type: 'post',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 서서히 나타나게 삽입
                $('#mypage_centents3_box').hide().html(response).fadeIn('slow');

                // 현재 div를 클릭한 것으로 표시하고 변수 업데이트
                $(divId).addClass('clicked');
                previousClickedDiv = $(divId);
            },
            error: function(error) {
                // 에러를 처리
                console.error('AJAX 에러:', error);
            }
        });
    }
});

