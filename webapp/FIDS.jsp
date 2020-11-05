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
            <% if(AirportNo == 1) {
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
        <div class="col-8">
            <div id="map_text">
            </div>
            <svg width="100%" id="map">
                <rect id="map_back" width="100%" height="800px">
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
                        <tr style="color: #b8daff">
                            <th>Time</th>
                            <th colspan="6">Destination</th>
                            <th>Flight</th>
                            <th>AirLine</th>
                            <th>Gate</th>
                            <th>Status</th>
                            <th>Delay</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%  String Class = null;
                        IncheonAirport Info = new IncheonAirport();
                        ArrayList<String> FIDS_Info_AL = new ArrayList<>();
                        HashMap<Integer, ArrayList<String>> FIDS_Info_Map = new HashMap<>();
                        FIDS_Info_Map = Info.getFIDS();
                        for(int i = 0; i<=10; i++){
                            if(i%2==0) Class = "class=\"bg-primary\"";
                            else Class = null;
                            if(AirportNo == 1) {
                                FIDS_Info_AL = FIDS_Info_Map.get(i);
                                %>
                        <tr>
                            <td id="departTime<%=i%>" <%=Class%>><%=FIDS_Info_AL.get(0)%></td>
                            <td colspan="6" id="Destination<%=i%>" <%=Class%>><%=FIDS_Info_AL.get(1)%></td>
                            <td id="FlightID<%=i%>" <%=Class%>><%=FIDS_Info_AL.get(2)%></td>
                            <td id="AirLine<%=i%>" <%=Class%>><%=FIDS_Info_AL.get(3)%></td>
                            <td id="Gate<%=i%>" <%=Class%>><%=FIDS_Info_AL.get(4)%></td>
                            <td id="Status<%=i%>" <%=Class%>>ExData: <%=i%></td>
                            <td id="Delay<%=i%>" <%=Class%>>ExData: <%=i%></td>
                        </tr>
                    <%
                            }
                    %>
                        <tr>
                            <td id="departTime<%=i%>" <%=Class%>>ExData: <%=i%></td>
                            <td colspan="6" id="Destination<%=i%>" <%=Class%>>ExDestinationData: <%=i%></td>
                            <td id="FlightID<%=i%>" <%=Class%>>ExData: <%=i%></td>
                            <td id="AirLine<%=i%>" <%=Class%>>ExData: <%=i%></td>
                            <td id="Gate<%=i%>" <%=Class%>>ExData: <%=i%></td>
                            <td id="Status<%=i%>" <%=Class%>>ExData: <%=i%></td>
                            <td id="Delay<%=i%>" <%=Class%>>ExData: <%=i%></td>
                        </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
            <script>
                var date = new Date();
                document.getElementById("map_text").innerHTML = getRecentDate();
                function getRecentDate(){
                    var dt = new Date();

                    var recentYear = dt.getFullYear();
                    var recentMonth = dt.getMonth() + 1;
                    var recentDay = dt.getDate();

                    if(recentMonth < 10) recentMonth = "0" + recentMonth;
                    if(recentDay < 10) recentDay = "0" + recentDay;

                    return recentYear + "-" + recentMonth + "-" + recentDay;
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>

