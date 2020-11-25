<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 주문</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<c:import url="../template/bootstrap.jsp"></c:import>
<link href ="../resources/css/common/default.css" rel="stylesheet">
<link href ="../resources/css/address/address.css" rel="stylesheet">
<link href ="../resources/css/address/pickup_search.css" rel="stylesheet">
<script src="../resources/js/header.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<div class="content">
		<div class="sub-type store">
			<div class="inner-box">
				<div class="page-title-wrap">
					<h2 class="page-title">주문방법 선택</h2>
					<!-- <div class=""> 홈 > 매장검색
					
					</div> -->
					
				</div>
				<div class="sel-order-area">
					<div class="sel-order-wrap">
						<div class="sel-order-way" id="select"> 
							<div class="order-btn order1">
								<a href="./delivery">배달 주문</a>
							</div>
							<div class="mid-bar"></div>
							<div class="order-btn order2">
								<a href="./pickup" class="active">포장 주문</a>
							</div>
						</div>
					</div>
					<div class="tab-content" id="pickup">
						<div class="spot-area">
							<span class="spot left-spot">
								<img alt="" src="../resources/images/address/sp_driving_pu_t1.png" style="width: 27px; height: 19px;">도미노 드라이빙 픽업 서비스 이용
							</span>
							
							<a href="#" class="spot right-spot">
								<span>이용안함</span><i class="material-icons">chevron_right</i>
							</a>
						</div>
						<div class="addr-list">
							<ul>
								<li>
									<div class="notyet">
										<p class="title"><img alt="" src="../resources/images/address/sp_alert_t1.png">포장 매장을 등록해주세요.</p>
										<a href="#" class="btn-type-brd2" id="add_addr" onclick="popMap()">
											+ 포장 매장 등록
										</a>
									</div>
								</li>
							</ul>
							<div class="addr-limit">
								* 포장 매장은 최대 5개까지만 등록 가능합니다.
							</div>
						</div>
					</div>
				</div>	<!-- 배달/포장 -->
			</div>	<!-- 주문방법선택 -->	
		</div>			
	</div><!-- content -->
	
	<!-- ===== 포장매장등록 popup, pickup_search.css ===== -->
	<div class="pop-layer" id="pop-map">
		<div class="pop-wrap pop-regBranch">
			<div class="pop-title-wrap pop-header">
				<h2 class="pop-title">포장매장 등록</h2>
				<a href="#" class="closebtn" onclick="document.getElementById('pop-map').style.display='none'">&times;</a>
			</div>
			<div class="pop-content">
				<div class="store-map-area">
					<!-- map -->
					<div class="store-map-wrap">
						<div class="store-map">
							<div class="map-canvas" id="map"></div>
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
									<div class="form-item region" id="first">
										<div class="select-region">
											<select id="region1" name="region1">
												<c:forEach var="dto" items="${branch}">
													<option value="0" selected>시/도</option>
													<option value="1">${dto.region1}</option>
													
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-item region" id="second">
										<div class="select-region">
											<select id="region2">
												<option>구/군</option>
											</select>
										</div>
									</div>
									<div class="form-item search" id="btn-search">
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
										<input type="text" id="branch_name" placeholder="	매장명을 입력하세요.">
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
									<dt>매장명<span class="tel">매장전화번호</span></dt>
									<dd class="br-addr">매장 주소</dd>
									<dd class="hash">
										<span>
											특별 세일 1<!-- 
											<br>
											특별 세일 2 -->
										</span>
									</dd>
								</dl>
								<div class="salenames">
									<div class="sale1">
										<span>세일1<br>11<br>122</span>
									</div>
									<div class="sale2">
										<span>세일2<br>11<br>122</span>
									</div>
								</div>
								<div class="br-detail">
									<a href="#" class="btn" id="type1" onclick="popDetail()">상세보기</a>
									<a href="#" class="btn" id="type2">선택</a>
								</div>
							</div>
						</div>
						<!-- ===== 매장 리스트 ] ===== -->
						
					</div> <!-- 탭 선택 최상위 div -->
				</div> <!-- store-map-area -->
			</div>	<!-- pop-content -->
			
		</div>	<!-- pop-wrap -->
	</div>	<!-- pop-layer -->
	<%--  --%>
	<div class="pop-layer view-detail" id="pop-store">
		<div class="pop-wrap detail-info">
			<div class="pop-title-wrap pop-header">
				<h2 class="pop-title">매장 상세정보</h2>
				<a href="#" class="closebtn" onclick="document.getElementById('pop-store').style.display='none'">&times;</a>
			</div>
			<div class="pop-content details">
				<div class="store-view-detail">
					<div class="store-detail-box">
						<ul>
							<li id="first-li">
								<h3 id="branch-name">도미노피자 </h3>
								<p class="promotion">
									<span id="online-sale">online</span>
									<span id="offline-sale">offline</span>
								</p>
								<div class="btn-wrap">
									<a href="../menu/list/pizzaList" class="btn-type enter">선택</a>
								</div>
							</li>
							<li id="second-li">
								<dl>
									<dt>전화번호</dt>
									<dd>번호</dd>
								</dl>
								<dl>
									<dt>주소</dt>
									<dd>서울시</dd>
								</dl>
								<dl>
									<dt>영업시간</dt>
									<dd>0000</dd>
								</dl>
								<dl>
									<dt>주차정보</dt>
									<dd>가능</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="store-map-area">
						<div class="map-canvas store-loc" id="map-detail"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ===== 포장매장등록 popup html ===== -->	
	
</div><!-- container -->

<script type="text/javascript"> <!-- 팝업 모달 close -->
/* */
	var viewSearch = document.getElementById("pop-map")
	 
	function popMap() {
		viewSearch.style.display = 'block'
	}
	/* 
	window.onclick = function(event) {
	  if (event.target == viewSearch) {
	    viewSearch.style.display = "none";
	    viewDetail.style.display = "none";
	  }
	}
	 */
	/////////////// 매장 상세보기 ////////////////

</script>


<script type="text/javascript">	<!-- ===== 검색탭 javascript ===== -->

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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script type="text/javascript" src="../resources/js/address/pickup.js"><!-- ===== 지도 javascript ===== -->

</script><!-- ===== 지도 ===== -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script><!-- ===== 지도 javascript ===== -->

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
	mapOption = { 
	    center: new kakao.maps.LatLng(37.564713, 126.993173), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
    $("#add_addr").click(function() {
        map.relayout();
        map.setCenter(new daum.maps.LatLng(37.564713, 126.993173))
    });
    
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
	
</script><!-- ===== 지도 ===== -->


<script type="text/javascript">	<!-- 배달/포장 주문 버튼 활성화 -->
// Add active class to the current button (highlight it)
	var header = document.getElementById("select");
	var btns = header.getElementsByClassName("order-btn");
	for (var i = 0; i < btns.length; i++) {
	  btns[i].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
	  });
	}

</script>

<!-- ===== footer ===== -->
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>