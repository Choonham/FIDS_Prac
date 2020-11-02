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
    <title>Airport</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/bootstrap.js"></script>
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
            <a>Airport #1</a>
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
                2020.10.27
            </div>
            <svg width="100%" id="map">
                <rect id="map_back" width="100%" height="800px">
                </rect>
            </svg>
        </div>
    </div>
</div>
</body>
</html>

