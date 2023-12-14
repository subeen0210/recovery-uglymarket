<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/myPage.css">
    <link rel="stylesheet" href="css/header.css">

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="ajax.js"></script>
    <script>
        function loadJspPage(url, containerId) {
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById(containerId).innerHTML = this.responseText;
                }
            };

            xhttp.open("GET", url, true);
            xhttp.send();
        }

        function loadProductRegistration() {
            loadJspPage('../seller_register3.jsp', 'jsp_view');
        }

        function loadStockManagement() {
            loadJspPage('stock_management.jsp', 'jsp_view');
        }

        function loadFarmManagement() {
            loadJspPage('farm_management.jsp', 'jsp_view');
        }
    </script>
</head>
<body>
    <div class="myPage_container">
        <!-- ... 이전 내용 ... -->
        <div class="main_menu_container">
            <div class="main_menu_control">
                <div class="main_menu"><a onclick="loadProductRegistration()">상품등록</a></div>
                <div class="main_menu"><a onclick="loadStockManagement()">상품관리</a></div>
                <div class="main_menu"><a onclick="loadFarmManagement()">농장관리</a></div>
            </div>
        </div>
        <div class="sub_control">
            <div class="sub_menu">
                <div id="register"><a onclick="loadProductRegistration()">상품등록</a></div>
                <div id="stock"><a onclick="loadStockManagement()">상품관리</a></div>
                <div id="farm"><a onclick="loadFarmManagement()">농장관리</a></div>
            </div>
            <div class="subview">
                <div class="jsp_view"></div>
            </div>
        </div>
    </div>
</body>
</html>