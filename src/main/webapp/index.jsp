<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>제로베이스 Part1 과제</title>
    <style>
        th, td {
            width: 5%;
            height: 10%;
            border:solid 0.1px;
            text-align: center;
        }
        th {
            border-color: white;
        }
        #locationbtn {
            width: 125px;
            height: 20px;
            top: 15.2%;
            left: 22.2%;
            position: absolute;
        }
    </style>
</head>
<body>
    <h1>와이파이 정보 구하기</h1>
    </tr><a href="index.jsp">홈</a> |
    <a href="history.jsp">위치 히스토리 목록</a> |
    <a href="save.jsp">Open API 와이파이 정보 가져오기</a>
    <p></p>
    <form action="list.jsp" method="post" >
        LAT : <input type="number" step="0.0000001" id="lat", name="lat"> ,
        LNT : <input type="number" step="0.0000001" id="lnt", name="lnt">
        <input type="submit" value="근처 WIFI 정보 보기">
    </form>
    <button id="locationbtn" type="button" onclick="getLocation();">내 위치 가져오기</button>
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
    <p></p>
    <table>
        <thead>
            <tr bgcolor="#3cb371">
                <th><font color="white">거리(km)</font></th>
                <th><font color="white">관리번호</font></th>
                <th><font color="white">자치구</font></th>
                <th><font color="white">와이파이명</font></th>
                <th><font color="white">도로명주소</font></th>
                <th><font color="white">상세주소</font></th>
                <th><font color="white">설치위치(층)</font></th>
                <th><font color="white">설치유형</font></th>
                <th><font color="white">설치기관</font></th>
                <th><font color="white">서비스구분</font></th>
                <th><font color="white">망종류</font></th>
                <th><font color="white">설치년도</font></th>
                <th><font color="white">실내외구분</font></th>
                <th><font color="white">WIFI접속환경</font></th>
                <th><font color="white">X좌표</font></th>
                <th><font color="white">Y좌표</font></th>
                <th><font color="white">작업일자</font></th>
            </tr>
        </thead>
        <tbody>
            <tr>
            </tr>
        </tbody>
    </table>
</body>
</html>