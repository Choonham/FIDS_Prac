<%--
  Created by IntelliJ IDEA.
  User: samsung
  Date: 2020-10-27
  Time: 오후 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@  page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=auto" initial-scale="1">
    <title>MainPage</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cab8d5537c069ad77c3d51ea034a74a"></script>
</head>
<body class="background">

<div class="container-fluid">
    <div class="row justify-content-start">
        <div class="col-2">
            <nav class="navbar">
                <a class="navbar-brand" href="Main.jsp">
                    <img src="img/ICON.png" width="70" height="70" alt="">
                </a>
            </nav>
        </div>
        <div class="col-8" id="MainTitle">
            <a>FIDS MAIN PAGE</a>
        </div>
        <div class="col-2" id="Clock">
            <div class="hour">
                <div class="hr" id="hr"></div>
            </div>
            <div class="min">
                <div class="mn" id="mn"></div>
            </div>
            <div class="sec">
                <div class="sc" id="sc"></div>
            </div>
        </div>
        <script type="text/javascript">
            const deg = 6;
            const hr = document.querySelector('#hr');
            const mn = document.querySelector('#mn');
            const sc = document.querySelector('#sc');

            setInterval(() => {

                let day = new Date();
                let hh = day.getHours() * 30;
            let mm = day.getMinutes() * deg;
                let ss = day.getSeconds() * deg;

                hr.style.transform = 'rotateZ(' + (hh + (mm / 12)) + 'deg)';
                mn.style.transform = 'rotateZ(' + mm + 'deg)';
                sc.style.transform = 'rotateZ(' + ss + 'deg)';
            })
        </script>
    </div>
    <div class="row justify-content-center">
        <div class="col-6">
            <div id="map_text">
                Map
            </div>
            <div id="map">
            </div>
            <svg width="100%" id="mapBox">
                <rect id="map_back" width="100%" height="800px">
                </rect>
            </svg>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(37.3744863112487, 126.63321945761774),
                    level: 13
                };

                var map = new kakao.maps.Map(container, options);
            </script>
        </div>
    </div>
</div>
</body>
</html>

