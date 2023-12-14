$(document).ready(function() {
  $("#kanri").on("click", function() {
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
  });

  $("#order").on("click", function() {
    $.ajax({
      url: "wr_company/order.jsp",
      method: "GET",
      success: function(data) {
        $("#mypage_centents3_box").html(data);
      },
      error: function() {
        alert("데이터를 불러오는 데 실패했습니다.");
      }
    });
  });

  $("#cart").on("click", function() {
    $.ajax({
      url: "wj/cart.jsp",
      method: "GET",
      success: function(data) {
        $("#mypage_centents3_box").html(data);
      },
      error: function() {
        alert("데이터를 불러오는 데 실패했습니다.");
      }
    });
  });

  $("#review").on("click", function() {
    $.ajax({
      url: "wr_company/review.jsp",
      method: "GET",
      success: function(data) {
        $("#mypage_centents3_box").html(data);
      },
      error: function() {
        alert("데이터를 불러오는 데 실패했습니다.");
      }
    });
  });

  $("#seller-register").on("click", function() {
    $.ajax({
      url: "wr_company/seller_register3.jsp",
      method: "GET",
      success: function(data) {
        $("#mypage_centents3_box").html(data);
      },
      error: function() {
        alert("데이터를 불러오는 데 실패했습니다.");
      }
    });
  });
});


 /*function showJSP(jspId) {
            // 모든 JSP 컨테이너를 숨김
            document.querySelectorAll('.jsp-container').forEach(function(container) {
                container.style.display = 'none';
            });

            // 클릭한 A 태그에 해당하는 JSP 컨테이너를 표시
            document.getElementById(jspId).style.display = 'block';
        }*/
