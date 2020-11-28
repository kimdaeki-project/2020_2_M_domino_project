<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="store-map-wrap">
	<div class="store-map">
		<div id="map"></div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script>

	var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	
	mapOption = { 
	    center: new kakao.maps.LatLng(37.564713, 126.993173), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
		{
		    title: '개포점', 
		    latlng: new kakao.maps.LatLng(37.475518, 127.047214)
		}
	];
	
	var imageSrc = '/t1/resources/images/branch/ico_spot.png' // 마커이미지의 주소입니다    
	
	for (var i = 0; i < positions.length; i ++) {
	
		var imageSize = new kakao.maps.Size(40, 52), // 마커이미지의 크기입니다
		imageOption = {offset: new kakao.maps.Point(0, 0)}
		
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		
			// 마커가 지도 위에 표시되도록 설정합니다
			map: map,
			
			position: positions[i].latlng, // 마커를 표시할 위치
		    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		     
		    image: markerImage // 마커이미지 설정 
		})
	}
	

</script>