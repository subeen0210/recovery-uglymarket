/*$(document).ready(function() {
  $("kanri").on("click", function() {
    $.ajax({
      url: "wr_company/kanri.jsp",
      method: "GET",
      success: function(data) {
        $("#mypage_centents3_box").html(data);
      },
      error: function() {
        alert("데이터를 불러오는 데 실패했습니다.");
      }
    });
  $(this).toggleClass('clicked');
  });*/
$(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수

    // 'kanri' id를 가진 div에 대한 클릭 이벤트
    $('#kanri').on('click', function(event) {
        handleDivClick(event, 'kanri.jsp', '#kanri');
    });

    // 'review' id를 가진 div에 대한 클릭 이벤트
    $('#review').on('click', function(event) {
        handleDivClick(event, 'review.jsp', '#review');
    });

    // 'order' id를 가진 div에 대한 클릭 이벤트
    $('#order').on('click', function(event) {
        handleDivClick(event, 'order.jsp', '#order');
    });

    // 'cart' id를 가진 div에 대한 클릭 이벤트
    $('#cart').on('click', function(event) {
        handleDivClick(event, 'cart.jsp', '#cart');
    });


    $('#user_modify').on('click', function(event) {
        handleDivClick(event, 'user_modify.jsp', '#user_modify');
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
            type: 'GET',
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


$(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수

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
        handleDivClick(event, 'wr_company/cart.jsp', '#cart');
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
            type: 'GET',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 삽입
                $('#mypage_centents3_box').html(response);

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




$(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수


    $('#kanri').on('click', function(event) {
        // 기본 동작(페이지 이동) 막기
        event.preventDefault();

        // 이전에 클릭된 div의 색상 초기화
        if (previousClickedDiv !== null) {
            previousClickedDiv.removeClass('clicked');
        }

        // AJAX 요청 수행
        $.ajax({
            url: 'kanri.jsp',
            type: 'GET',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 삽입
                $('#mypage_centents3_box').html(response);

                // 현재 div를 클릭한 것으로 표시하고 변수 업데이트
                $('#kanri').addClass('clicked');
                previousClickedDiv = $('#kanri');
            },
            error: function(error) {
                // 에러를 처리
                console.error('AJAX 에러:', error);
            }
        });
    });

});


  $(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수


    $('#review').on('click', function(event) {
        // 기본 동작(페이지 이동) 막기
        event.preventDefault();

        // 이전에 클릭된 div의 색상 초기화
        if (previousClickedDiv !== null) {
            previousClickedDiv.removeClass('clicked');
        }

        // AJAX 요청 수행
        $.ajax({
            url: 'review.jsp',
            type: 'GET',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 삽입
                $('#mypage_centents3_box').html(response);

                // 현재 div를 클릭한 것으로 표시하고 변수 업데이트
                $('#review').addClass('clicked');
                previousClickedDiv = $('#review');
            },
            error: function(error) {
                // 에러를 처리
                console.error('AJAX 에러:', error);
            }
        });
    });
});
 
  $(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수


    $('#order').on('click', function(event) {
        // 기본 동작(페이지 이동) 막기
        event.preventDefault();

        // 이전에 클릭된 div의 색상 초기화
        if (previousClickedDiv !== null) {
            previousClickedDiv.removeClass('clicked');
        }

        // AJAX 요청 수행
        $.ajax({
            url: 'order.jsp',
            type: 'GET',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 삽입
                $('#mypage_centents3_box').html(response);

                // 현재 div를 클릭한 것으로 표시하고 변수 업데이트
                $('#order').addClass('clicked');
                previousClickedDiv = $('#order');
            },
            error: function(error) {
                // 에러를 처리
                console.error('AJAX 에러:', error);
            }
        });
    });

});

  $(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수


    $('#cart').on('click', function(event) {
        // 기본 동작(페이지 이동) 막기
        event.preventDefault();

        // 이전에 클릭된 div의 색상 초기화
        if (previousClickedDiv !== null) {
            previousClickedDiv.removeClass('clicked');
        }

        // AJAX 요청 수행
        $.ajax({
            url: 'cart.jsp',
            type: 'GET',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 삽입
                $('#mypage_centents3_box').html(response);

                // 현재 div를 클릭한 것으로 표시하고 변수 업데이트
                $('#cart').addClass('clicked');
                previousClickedDiv = $('#cart');
            },
            error: function(error) {
                // 에러를 처리
                console.error('AJAX 에러:', error);
            }
        });
    });

});
$(document).ready(function() {
    var previousClickedDiv = null; // 이전에 클릭된 div의 참조를 저장하는 변수


    $('#user_modify').on('click', function(event) {
        // 기본 동작(페이지 이동) 막기
        event.preventDefault();

        // 이전에 클릭된 div의 색상 초기화
        if (previousClickedDiv !== null) {
            previousClickedDiv.removeClass('clicked');
        }

        // AJAX 요청 수행
        $.ajax({
            url: 'user_modify.jsp',
            type: 'GET',
            dataType: 'html', // JSP 페이지는 HTML 형식일 것으로 가정
            success: function(response) {
                // 서버에서 받은 HTML을 mypage_centents3_box 안에 삽입
                $('#mypage_centents3_box').html(response);

                // 현재 div를 클릭한 것으로 표시하고 변수 업데이트
                $('#user_modify').addClass('clicked');
                previousClickedDiv = $('#user_modify');
            },
            error: function(error) {
                // 에러를 처리
                console.error('AJAX 에러:', error);
            }
        });
    });

});

/*$(document).ready(function() {
  $("kanri").on("click", function() {
    $.ajax({
      url: "wr_company/kanri.jsp",
      method: "GET",
      success: function(data) {
        $("#mypage_centents3_box").html(data);
      },
      error: function() {
        alert("데이터를 불러오는 데 실패했습니다.");
      }
    });
  $(this).toggleClass('clicked');
  });*/

