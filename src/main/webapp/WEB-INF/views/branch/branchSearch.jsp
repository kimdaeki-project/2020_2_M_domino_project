
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
						<button type="button" class="btn-type v4" id="viewAll">전체매장 보기</button>	
					</div>
					<div class="store-map-area">
						<div class="store-map-wrap">
							<div class="store-map" id="map">
							<div id="map"></div>
							</div>
						</div>
						
						<!-- 탭 선택 최상위 div -->
						<div class="store-search">
							<!-- 탭 선택 -->
							<div class="tab">
							  <button class="tablinks search-tab t1" onclick="openSearch(event, 'search1')" id="defaultOpen">지역검색</button>
							  <button class="tablinks search-tab t2" onclick="openSearch(event, 'search2')">매장명</button>
							</div>
							<!-- 탭 선택 -->
							
							<!-- ===== [ 지역검색 ===== -->
							<div class="tabcontent" id="search1">
								<div class="address-wrap branch">
									<div class="form-group srch-type">
										<div class="form-region" id="form-region-first">
											<div class="select-region">
												<select id="region1" name="region1">
													<c:forEach var="dto" items="${dto.region1}">
														<option value="0" selected>시/도</option>
														<option value="1"></option>
														
													</c:forEach>
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
											<p>특별할인 진행 전체 매장</p>
										</div>
										<p class="spcl-info"><a href="#">이용안내</a></p>
									</div>
								</div>
							</div>
							<!-- ===== 지역검색 ] ===== -->
							
							<!-- ===== [ 매장명 검색 ===== -->
							<div class="tabcontent" id="search2">
								<div class="address-wrap branch">
									<div class="form-group srch-type">
										<div class="form-item" id="search_branch">
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
											<p>특별할인 진행 전체 매장</p>
										</div>
										<p class="spcl-info"><a href="#">이용안내</a></p>
									</div>
								</div>	
							</div><!--  -->
							<!-- ===== 매장명 검색 ] ===== -->
							
							<!-- ===== [ 매장 리스트 ===== -->
							<div class="row branch-addr-result">
								<div class="column branch-result-list">
									<dl>
										<dt></dt>
										<dd></dd>
										<dd></dd>
									</dl>
									<div class="salenames">
										<div class="sale1"></div>
										<div class="sale2"></div>
									</div>
									<div class="br-detail">
										<a href="#" class="btn type1">상세보기</button></a>
										<a href="#" class="btn type2">방문포장</button></a>
									</div>
								</div>
							</div>
							<!-- ===== 매장 리스트 ] ===== -->
							
						</div> <!-- 탭 선택 최상위 div -->
					</div> <!-- store-map-area -->
				</div> <!-- store-wrap -->
			</div>
		</div>
	</div>
	<div class="view-all-branch" id="view-all-branch">
		<div class="view-all-popup">
			<div class="view-all-header">
				<h2>전체 매장 보기</h2>
			</div>
			<div class="view-all-map">
				<div class="all-map-area" id="all-map"></div>
			</div>
		</div>
	</div>
</div> <!-- container -->

<!-- ===== 전체매장보기 javascript ===== -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script>

	var viewAllBranch = document.getElementById("view-all-branch")
	var btn = document.getElementById("viewAll");
	
	$("#viewAll").click(function(){
	
		viewAllBranch.style.display = "block";
		
		var mapContainer = document.getElementById("all-map"), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.564713, 126.993173), // 지도의 중심좌표
		    	level: 3 // 지도의 확대 레벨
			};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		/* */  
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: '개포점', 
		        latlng: new kakao.maps.LatLng(37.475518, 127.047214)
		    },
		    {
		        title: '논현점', 
		        latlng: new kakao.maps.LatLng(37.510734, 127.023298)
		    },
		    {
		        title: '미아점', 
		        latlng: new kakao.maps.LatLng(37.617072, 127.022029)
		    },
		    {
		        title: '번동점',
		        latlng: new kakao.maps.LatLng(37.635334, 127.030114)
		    },
		    {
		        title: '명동점',
		        latlng: new kakao.maps.LatLng(37.564713, 126.993173)
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
		
	}) 
	
	window.onclick = function(event) {
	  if (event.target == viewAllBranch) {
	    viewAllBranch.style.display = "none";
	  }
	}

</script>

<!-- ===== 검색탭 javascript ===== -->
<script type="text/javascript">

	function openSearch(evt, searchTab) {
		var i, tabcontent, tablinks;
		
		tabcontent = document.getElementsByClassName("tabcontent");
		
		for (i = 0; i < tabcontent.length; i++) {
		  tabcontent[i].style.display = "none";
		}
		
		tablinks = document.getElementsByClassName("tablinks");
		
		for (i = 0; i < tablinks.length; i++) {
		  tablinks[i].className = tablinks[i].className.replace("active", "");
		}
		
		document.getElementById(searchTab).style.display = "block";
		
		evt.currentTarget.className += " active";
	}
	
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
	
</script>
   
<!-- ===== 지도 javascript ===== -->
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
<!-- ===== 지도 ===== -->

<!-- ===== footer ===== -->
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>