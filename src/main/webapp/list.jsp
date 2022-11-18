<%@ page import="com.example.zerobase_part1.service.WifiService" %>
<%@ page import="com.example.zerobase_part1.web.dto.request.CalculateDistanceRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.zerobase_part1.web.dto.response.PublicWifiResponse" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>제로베이스 Part1 과제</title>
    <style>
        th,td {
            width: 5%;
        }
        th, td {
            border:solid 1px #000;
        }
        th, td {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>와이파이 정보 구하기</h1>
    </tr><a href="index.jsp">홈</a> |
    <a href="history.jsp">위치 히스토리 목록</a> |
    <a href="save.jsp">Open API 와이파이 정보 가져오기</a>
    <p></p>
    <form action="list.jsp" method="post">
        LAT : <input type="number" step="0.0000001" id="lat", name="lat"> ,
        LNT : <input type="number" step="0.0000001" id="lnt", name="lnt">
        <input type="submit" value="근처 WIFI 정보 보기">
    </form>
    <button onclick="getLocation();">내 위치 가져오기</button>
    <p></p>
    내 위치 : (LAT : <span id="latitude"></span>, LNT : <span id="longitude"></span>)
    <script>
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (pos) {
                    const latitude = pos.coords.latitude;
                    const longitude = pos.coords.longitude;
                    document.getElementById("latitude").innerHTML=latitude;
                    document.getElementById("longitude").innerHTML=longitude;
                });
            } else {
                alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
            }
        }
    </script>
    <%
        String lat = request.getParameter("lat");
        String lnt = request.getParameter("lnt");

        WifiService wifiService = new WifiService();
        CalculateDistanceRequest calculateDistanceRequest = CalculateDistanceRequest.builder()
                .LAT(Float.valueOf(lat))
                .LNT(Float.valueOf(lnt))
                .build();
        wifiService.calculateDistance(calculateDistanceRequest);
    %>
    <p></p>
    <table>
        <thead>
        <tr>
            <th>거리(km)</th>
            <th>관리번호</th>
            <th>자치구</th>
            <th>와이파이명</th>
            <th>도로명주소</th>
            <th>상세주소</th>
            <th>설치위치(층)</th>
            <th>설치유형</th>
            <th>설치기관</th>
            <th>서비스구분</th>
            <th>망종류</th>
            <th>설치년도</th>
            <th>실내외구분</th>
            <th>WIFI접속환경</th>
            <th>X좌표</th>
            <th>Y좌표</th>
            <th>작업일자</th>
        </tr>
        </thead>
    <tbody>
        <tr>
            <%
                List<PublicWifiResponse> publicWifiResponseDtoList = wifiService.getClosest20();
                for (PublicWifiResponse publicWifiResponse : publicWifiResponseDtoList) {
                    out.write("<tr>");
                    out.write("<td>" + publicWifiResponse.getDistance() + "</td>");
                    out.write("<td>" + publicWifiResponse.getManageNo() + "</td>");
                    out.write("<td>" + publicWifiResponse.getBorough() + "</td>");
                    out.write("<td>" + publicWifiResponse.getWifiName() + "</td>");
                    out.write("<td>" + publicWifiResponse.getStreetAddress() + "</td>");
                    out.write("<td>" + publicWifiResponse.getDetailAddress() + "</td>");
                    out.write("<td>" + publicWifiResponse.getFloor() + "</td>");
                    out.write("<td>" + publicWifiResponse.getTypeOfInstall() + "</td>");
                    out.write("<td>" + publicWifiResponse.getCompanyOfInstall() + "</td>");
                    out.write("<td>" + publicWifiResponse.getWhichService() + "</td>");
                    out.write("<td>" + publicWifiResponse.getTypeOfNet() + "</td>");
                    out.write("<td>" + publicWifiResponse.getYearOfInstall() + "</td>");
                    out.write("<td>" + publicWifiResponse.getInOrOut() + "</td>");
                    out.write("<td>" + publicWifiResponse.getWifiCondition() + "</td>");
                    out.write("<td>" + publicWifiResponse.getLAT() + "</td>");
                    out.write("<td>" + publicWifiResponse.getLNT() + "</td>");
                    out.write("<td>" + publicWifiResponse.getWorkTime() + "</td>");
                    out.write("</tr>");
                }
        %>
    </tr>
    </tbody>
</table>
</body>
</html>