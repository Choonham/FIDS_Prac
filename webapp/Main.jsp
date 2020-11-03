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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
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
            <svg width="100%" id="map">
                <rect id="map_back" width="100%" height="800px">
                </rect>
            </svg>
            <div id="mapApi" style="width:80%;height:730px; padding:10px; position: absolute; left: 10%; top:20px; z-index: 2"></div>
            <script>
                var container = document.getElementById('mapApi');
                var options = {
                    center: new kakao.maps.LatLng( 36.5095,127.945),
                    level: 13
                };
                var map = new kakao.maps.Map(container, options);

                var positions = [
                    {
                        title: '인천 공항',
                        content:'<a style="font-family: 나눔스퀘어; text-align: center">인천 공항</a>',
                        latlng: new kakao.maps.LatLng(37.4625, 126.439167),
                        toFIDS: "fids.jsp?airportNo1"
                    },
                    {
                        title: '김포 공항',
                        content:'<a style="font-family: 나눔스퀘어; text-align: center">김포 공항</a>',
                        latlng: new kakao.maps.LatLng(37.558056, 126.790556),
                        toFIDS: "fids.jsp?airportNo2"
                    },
                    {
                        title: '김해 공항',
                        content:'<a style="font-family: 나눔스퀘어; text-align: center">김해 공항</a>',
                        latlng: new kakao.maps.LatLng(35.179444, 128.938056),
                        toFIDS: "fids.jsp?airportNo3"

                    },
                    {
                        title: '제주 공항',
                        content:'<a style="font-family: 나눔스퀘어 text-align: center">제주 공항</a>',
                        latlng: new kakao.maps.LatLng(33.5113, 126.4930),
                        toFIDS: "fids.jsp?airportNo4"
                    }
                ];
                for (var i = 0; i < positions.length; i ++) {

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: positions[i].latlng,
                        title : positions[i].title,
                        toFIDS: positions[i].toFIDS
                    });
                    var infowindow = new kakao.maps.InfoWindow({
                        content: positions[i].content // 인포윈도우에 표시할 내용
                    });
                    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                }
                function makeOverListener(map, marker, infowindow) {
                    return function() {
                        infowindow.open(map, marker);
                    };
                }

                // 인포윈도우를 닫는 클로저를 만드는 함수입니다
                function makeOutListener(infowindow) {
                    return function() {
                        infowindow.close();
                    };
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>

