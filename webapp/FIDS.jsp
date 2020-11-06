<%--
  Created by IntelliJ IDEA.
  User: samsung
  Date: 2020-10-27
  Time: 오후 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@  page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "getInfo_FIDS.IncheonAirport" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<html>
<head>
    <meta name="viewport" content="width=auto" initial-scale="1">
    <title>MainPage</title>
    <link rel="stylesheet" href="css/fids.css?after">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/bootstrap.js"></script>
</head>
<%
    int AirportNo = 0;
        if(request.getParameter("AirportNo") != null){
        AirportNo = Integer.parseInt(request.getParameter("AirportNo"));
    }
    String title = null;
%>
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
            <%  IncheonAirport Info = new IncheonAirport();
                if(AirportNo == 1) {
                title = "인천공항 FIDS";
            } else if(AirportNo == 2) {
                title = "김포공항 FIDS";
            } else if(AirportNo == 3) {
                title = "김해공항 FIDS";
            } else if(AirportNo == 4) {
                title = "제주공항 FIDS";
            }
            %>
            <a><%=title%></a>
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
        <div class="col-lg-8">
            <div id="map_text">
                <%=Info.getDate()%>
            </div>
            <svg width="100%" id="map">
                <rect id="map_back" width="100%" height="600px">
                </rect>
            </svg>
            <div id="FIDS_table">
                <table class="table table-striped" id="table">
                    <thead>
                        <tr style="color: #ffd500; font-size: 35px">
                            <th>
                                <img src="img/DepartureIcon.jpg">
                            </th>
                            <th colspan="11">Departure</th>
                        </tr>
                        <tr style="color: #b8daff; text-align: center" >
                            <th>Time</th>
                            <th colspan="4">Destination</th>
                            <th>Flight</th>
                            <th colspan="2">AirLine</th>
                            <th>Gate</th>
                            <th colspan="2">Status</th>
                            <th>Delay</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%  String Class = null;
                        ArrayList<String> FIDS_Info_AL = new ArrayList<>();
                        HashMap<Integer, ArrayList<String>> FIDS_Info_Map = new HashMap<>();

                        for(int i = 0; i<=9; i++){
                            if(i%2==1) Class = "class=\"bg-primary\"";
                            else Class = null;
                            if(AirportNo == 4) {
                                FIDS_Info_Map = Info.getFIDS("CJU");
                                FIDS_Info_AL = FIDS_Info_Map.get(i);
                            }
                            else if(AirportNo == 3) {
                                FIDS_Info_Map = Info.getFIDS("PUS");
                                FIDS_Info_AL = FIDS_Info_Map.get(i);
                            }
                            else if(AirportNo == 2) {
                                FIDS_Info_Map = Info.getFIDS("GMP");
                                FIDS_Info_AL = FIDS_Info_Map.get(i);
                            }
                            else if(AirportNo == 1) {
                                FIDS_Info_Map = Info.getFIDS("CJU");
                                FIDS_Info_AL = FIDS_Info_Map.get(i);
                            }
                        String time = FIDS_Info_AL.get(0);
                        String hr= time.substring(0,2);
                        String m=time.substring(2,4);
                    %>
                        <tr style="text-align: center">
                            <td id="departTime" <%=Class%>><%=hr%>시 <%=m%>분</td>
                            <td colspan="4" id="Destination" <%=Class%>><%=FIDS_Info_AL.get(1)%></td>
                            <td id="FlightID" <%=Class%>><%=FIDS_Info_AL.get(2)%></td>
                            <td colspan="2" id="AirLine" <%=Class%>><%=FIDS_Info_AL.get(3)%></td>
                            <td id="Gate" <%=Class%>><%=FIDS_Info_AL.get(4)%></td>
                            <td colspan="2" id="Status" <%=Class%>><%=FIDS_Info_AL.get(5)%></td>
                            <td id="Delay" <%=Class%>><%=FIDS_Info_Map.size()%></td>
                        </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

