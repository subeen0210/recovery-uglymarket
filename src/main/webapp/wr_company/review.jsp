<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/review.css" />
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
 
</head>
<body>
<div class="review_container">
<div class="review_title">리뷰관리</div>

  <div class="review" onclick="toggleReview('review1')">
    <h2>Review 1</h2>
    <div id="review1" class="review-content">
      내용 1
    </div>
  </div>

  <div class="review" onclick="toggleReview('review2')">
    <h2>Review 2</h2>
    <div id="review2" class="review-content">
      내용 2
    </div>
  </div>
</div>
  <script>
    function toggleReview(reviewId) {
      var content = document.getElementById(reviewId);
      if (content.style.display === "none") {
        content.style.display = "block";
      } else {
        content.style.display = "none";
      }
    }
  </script>

</body>
</html>