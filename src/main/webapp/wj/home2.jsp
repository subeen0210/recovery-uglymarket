<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bxSlider with Fade-In</title>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Include bxSlider CSS and JS files -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.15/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <!-- Custom styles for slider -->
    <style>
        .slider-container {
            max-width: 600px;
            margin: 0 auto;
        }

        .slider-item {
            display: none;
        }

        .slider-item img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>

<div class="slider-container">
    <div class="slider">
        <div class="slider-item">
            <img src="https://static.wixstatic.com/media/541a79_44794d65115b4eb7b8597d90488b9550~mv2.jpg/v1/fill/w_1280,h_581,al_c,q_85,enc_auto/541a79_44794d65115b4eb7b8597d90488b9550~mv2.jpg" alt="Image 1">
        </div>
        <div class="slider-item">
            <img src="https://static.wixstatic.com/media/541a79_c2ee0a169f3b48c0afa9d2c30e357a67~mv2.jpg/v1/fill/w_1280,h_581,al_c,q_85,enc_auto/541a79_c2ee0a169f3b48c0afa9d2c30e357a67~mv2.jpg" alt="Image 2">
        </div>
        <div class="slider-item">
            <img src="https://static.wixstatic.com/media/541a79_fd8dd9142c404814b2a9a986e0f7cd09~mv2.jpg/v1/fill/w_1280,h_581,al_c,q_85,enc_auto/541a79_fd8dd9142c404814b2a9a986e0f7cd09~mv2.jpg" alt="Image 3">
        </div>
        <!-- Add more slider items as needed -->
    </div>
</div>

<script>
    $(document).ready(function(){
        // Initialize bxSlider with fade mode
        $('.slider').bxSlider({
            mode: 'fade',
            captions: false,
            auto: true,
            speed: 1000, // Set the speed of the fade-in transition (in milliseconds)
            pause: 4000 // Set the time between transitions (in milliseconds)
        });
    });
</script>

</body>
</html>
