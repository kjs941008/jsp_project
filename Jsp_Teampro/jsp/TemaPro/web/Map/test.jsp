<%@page import="Map.MapDBManage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>    
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:500px;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f2742810f51fd185f367e60d19d4d07&libraries=clusterer"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
    

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
<%
String addr = request.getParameter("addr");
MapDBManage mdb = new MapDBManage();
ArrayList<String> list = mdb.SearchMap("대구");

for(int i=0;i<list.size();i++){%>

geocoder.addressSearch('<%=list.get(i)%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        var imageSrc = '../img/maker.jpg', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
          
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

        
        // 결과값으로 받은 위치를 마커로 표시합니다
		var imageSize = new kakao.maps.Size(35,35);
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            image: markerImage
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       // map.setCenter(coords);
    } 
});
<%}%>
</script>
<button id = "index" onclick = "location.href='../index.jsp'">메인으로</button>
</body>
</html>