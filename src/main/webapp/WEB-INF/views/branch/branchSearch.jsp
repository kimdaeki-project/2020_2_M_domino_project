<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootstrap.jsp"></c:import>
<link href ="../resources/css/common/default.css" rel="stylesheet">
<link href ="../resources/css/branchSearch/branchSearch.css" rel="stylesheet">
<script src="../resources/js/header.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<div class="content">
		<div class="sub-type store">
			<div class="inner-box">
				<div class="page-title-wrap">
					<h2 class="page-title">매장검색</h2>
					<!-- <div class=""> 홈 > 매장검색
					
					</div> -->
				</div>
				<div class="store-wrap">
					<div class="btn-wrap">
						<a href="#"><button type="button" class="all-btn btn btn-dark">전체매장 보기</button></a>
					</div>
					<div class="store-map-area">
						<div class="store-map-wrap">
							<div class="store-map" id="map">
							<div id="map"></div>
							</div>
						</div>
						<div class="store-search">
							<div class="tab-type1 tab1">
								<ul style="background-color: silver;">
									<li style="background-color: olive; float: left;"><a href="#">지역검색</a></li>
									<li style="background-color: teal;"><a href="#">매장명</a></li>
								</ul>
							</div>
							<div class="tab-content" id="search1">
								<div class="address-wrap branch">
									<div class="form-group srch-type">
										<div class="form-region" id="form-region-first">
											<div class="select-region">
												<select id="region1">
													<option>시/도</option>
												</select>
											</div>
										</div>
										<div class="form-region">
											<div class="select-region">
												<select id="region2">
													<option>구/군</option>
												</select>
											</div>
										</div>
										<div class="form-region" id="btn-search">
											<button type="button" class="btn-search">
												<img src="../resources/images/branch/sp_search_t1.png">
											</button>
										</div>
									</div>
									<div class="spcl-sale-branch">
										<div class="switch-btn" id="spcl_toggle">
											<label class="switch">
											  <input type="checkbox">
											  <span class="slider round"></span>
											</label>
											<p>특별할인 진행 매장</p>
										</div>
										<p class="spcl-info"><a href="#">이용안내</a></p>
									</div>
								</div>
							</div>
							<div class="tab-content" id="search2">
								<div class="address-wrap branch">
									<div class="form-group srch-type">
										<div class="form-item" id="form-region-first">
											<input type="text" id="branch_name" placeholder="매장명을 입력하세요.">
										</div>
										<div class="form-region" id="btn-search">
											<button type="button" class="btn-search">
												<img src="../resources/images/branch/sp_search_t1.png">
											</button>
										</div>
									</div>
									<div class="spcl-sale-branch">
										<div class="switch-btn" id="spcl_toggle">
											<label class="switch">
											  <input type="checkbox">
											  <span class="slider round"></span>
											</label>
											<p>특별할인 진행 매장</p>
										</div>
										<p class="spcl-info"><a href="#">이용안내</a></p>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.564713, 126.993173), // 지도의 중심좌표
	    level: 2 // 지도의 확대 레벨
	};
	
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var imageSrc = '/t1/resources/images/branch/ico_spot.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(40, 52), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(0, 0)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(37.564713, 126.993173); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
</script>

<!-- ============ footer ============ -->
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>