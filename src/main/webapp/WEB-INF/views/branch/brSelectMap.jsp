<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- brSelectMap.jsp -->
<div class="store-map-area">
	<div class="map-canvas store-loc" id="map-detail"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script type="text/javascript"> // brSelectMap.jsp
	
	var container = document.getElementById('map-detail') // 지도를 표시할 div 
	
	var lati = $(".brLat").val();
	var lon = $(".brLon").val();
	
	
	mapOptionDetail = { 
	    center: new kakao.maps.LatLng(lati, lon), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var mapDetail = new kakao.maps.Map(container, mapOptionDetail); 
	
	$(".type1").click(function() {
	    mapDetail.relayout();
	});
	
	var imageSrc = '/t1/resources/images/branch/ico_spot.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(40, 52), // 마커이미지의 크기입니다
	imageOption = {offset: new kakao.maps.Point(0, 0)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(lati, lon); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(mapDetail);
		
	///////////////////////////////////////
	/* 
	var viewDetail = document.getElementById("pop-store")
	
	$("#type1").click(function popDetail(){
		viewDetail.style.display = 'block'
	})
	
	function popDetail() {
		viewDetail.style.display = 'block'
	}
	
	 
	window.onclick = function(event) {
	  if (event.target == viewDetail) {
	    viewDetail.style.display = "none"
	  }
	}
	 */	
</script>