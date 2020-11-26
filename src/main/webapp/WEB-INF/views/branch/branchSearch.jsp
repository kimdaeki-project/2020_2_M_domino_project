
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
						
						<div id="branchMap"></div>
						
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
												<select id="region1" name="region1" onchange="regionChange(this)">
													<option>시/도</option>
													<c:forEach var="dto" items="${region1}">
														<option>${dto.region1}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-region">
											<div class="select-region">
												<select id="region2" name="region2">
													<option>구/군</option>
												</select>
											</div>
										</div>

										<div class="form-region" id="btn-search">
											<button type="button" class="btn-search" id="btnBranchSearch">
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
												
							<div id="brInfos"></div>
							
							
							<!-- ===== 매장 리스트 ] ===== -->
							
						</div> <!-- 탭 선택 최상위 div -->
					</div> <!-- store-map-area -->
				</div> <!-- store-wrap -->
			</div>
		</div>
	</div>
	<!-- ===== 전체매장보기 javascript ===== -->
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

<script type="text/javascript"> // 매장 지역 검색 search 버튼 결과 js
	$("#btnBranchSearch").click(function(){
		var reg1val = $("#region1 option:selected").val()
		var reg2val = $("#region2 option:selected").val()
		
		$.ajax({
			url:"<%=request.getContextPath()%>/branch/branchMap",
			type:"GET",
			data:{"reg1":reg1val, "reg2":reg2val},
			success:function(result) {
				console.log("test")
				$("#branchMap").html(result)
			}
		})
		
		$.ajax({
			url:"<%=request.getContextPath()%>/branch/branchInfos",
			type:"GET",
			data:{"reg1":reg1val, "reg2":reg2val},
			success:function(result) {
				$("#brInfos").html(result)
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

<!-- ===== 전체매장보기 javascript ===== -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script type="text/javascript" src="../resources/js/branchSearch/viewAllBranch.js"></script>

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

<!-- ===== 지도 ===== -->

<!-- ===== footer ===== -->
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>