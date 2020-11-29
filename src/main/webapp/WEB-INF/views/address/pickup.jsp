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
					<div id="pickupMap"></div>
					
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
											<select id="region1" name="region1" onchange="regionChange(this)">
												<option>시/도</option>
												<c:forEach var="dto" items="${region1}">
													<option>${dto.region1}</option>
												</c:forEach>
													<option>강원</option>
													<option>충남</option>
													<option>충북</option>
													<option>대전</option>
													<option>경남</option>
													<option>경북</option>
													<option>대구</option>
													<option>전남</option>
													<option>전북</option>
													<option>광주</option>
													<option>울산</option>
													<option>부산</option>
													<option>제주</option>
													<option>세종특별자치시</option>
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
									<div class="form-item search" id="btnBranchSearch">
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
						<div id="brList"></div>
						<!-- ===== 매장 리스트 ] ===== -->
						
					</div> <!-- 탭 선택 최상위 div -->
				</div> <!-- store-map-area -->
			</div>	<!-- pop-content -->
			
		</div>	<!-- pop-wrap -->
	</div>	<!-- pop-layer -->
	<!-- 매장 상세보기 -->
<!-- 	<div id="brSelect"></div> -->
	<!-- 매장 상세보기 -->
	<!-- ===== 포장매장등록 popup html ===== -->	
	
</div><!-- container -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script type="text/javascript"> // 포장 매장 등록 popup open/close

	var viewSearch = document.getElementById("pop-map")
	 
	function popMap() {
		viewSearch.style.display = 'block'

		getMap() // 디폴트맵
		
		function getMap(){
			$.get("./pickupMap", function(data){
				$("#pickupMap").html(data)
			})
		}
		
	}
	
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script type="text/javascript">
	$("#btnBranchSearch").click(function(){
		var reg1val = $("#region1 option:selected").val()
		var reg2val = $("#region2 option:selected").val()
		
		$.ajax({
			url:"<%=request.getContextPath()%>/address/pickupMap",
			type:"GET",
			data:{"reg1":reg1val, "reg2":reg2val},
			success:function(result) {
				
				$.post( "./pickupSearchResult", function(result) {
					$("#pickupMap").html(result);
				});
						
			}
		})

		$.ajax({
			url:"<%=request.getContextPath()%>/address/pickupBrList",
			type:"GET",
			data:{"reg1":reg1val, "reg2":reg2val},
			success:function(result) {
				$("#brList").html(result)
			}
		})
		
	})
</script>

<script type="text/javascript">
	var region1 = document.getElementById("region1")
	
	function regionChange(e) {
		var region2_1 = ["구/군"]
		var region2_a = ["강남구", "강북구", "동대문구", "동작구", "마포구", "서초구", "용산구", "은평구", "중구"];
		var region2_b = ["계양구"];
		var region2_c = ["고양시", "과천시", "광명시", "성남시"];
		var target = document.getElementById("region2");
		
		// 선택된 값의 index를 불러오기
		var regindex = $("#region1 option").index($("#region1 option:selected"));

		if(regindex == 1) var d = region2_a;
		else if(regindex == 2) var d = region2_b;
		else if(regindex == 3) var d = region2_c;
		else if(regindex == 0) var d = region2_1;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}	
	}
	
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