<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- branchList.jsp -->
<c:forEach items="${branch}" var="dto">
	<div class="row branch-addr-result">
		<div class="column branch-result-list">
			<dl>
				<dt>
					<span class="brName">${dto.branch_name}</span>
					<span class="tel">${dto.branch_phone}</span>
				</dt>
				<dd class="br-addr">${dto.region1} ${dto.region2} ${dto.street_address}</dd>
				<c:if test="${not empty dto.spcl_sale}">
					<dd class="hash">
						<span>${dto.spcl_sale}</span>
					</dd>
				</c:if>
			</dl>
			
			<div class="salenames">
				<div class="sale1">
					<span>${dto.salename1}</span>
				</div>
				<div class="sale2">
					<span>${dto.salename2}</span>
				</div>
			</div>
			<div class="br-detail">
				<a href="#" class="btn type1" onclick="popDetail()">상세보기</a>
				<a href="#" class="btn type2">방문포장</a>
			</div>
		</div>
		<input type="text" class="brLat" value="${dto.latitude}">
		<input type="text" class="brLon" value="${dto.longitude}">
	</div>

	
	<!-- 매장상세보기 -->
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
								<h3 id="branch-name">도미노피자 ${dto.branch_name}</h3>
								<p class="promotion">
									<span id="online-sale">${dto.salename1}</span>
									<span id="offline-sale">${dto.salename2}</span>
								</p>
								<div class="btn-wrap enter-order">
									<a href="../menu/list/pizzaList" class="btn-enter">선택</a>
								</div>
							</li>
							<li id="second-li">
								<dl>
									<dt>전화번호</dt>
									<dd>${dto.branch_phone}</dd>
								</dl>
								<dl>
									<dt>주소</dt>
									<dd>${dto.region1} ${dto.region2} ${dto.street_address}</dd>
								</dl>
								<dl>
									<dt>영업시간</dt>
									<dd>${dto.hours}</dd>
								</dl>
								<dl>
									<dt>주차정보</dt>
									<dd>${dto.parking_info}</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div id="selectMap"></div>
				</div>
			</div>
		</div>
	</div>

</c:forEach>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8359d6b1a5e0267b346e7ce57922d7f4&libraries=services"></script>
<script type="text/javascript">

	var viewDetail = document.getElementById("pop-store")
	
	function popDetail() {
		viewDetail.style.display = 'block'
		
		$.get("./brSelectMap", function(data) {
			$("#selectMap").html(data)
		})
		
	}
	
</script><!-- ===== 지도 ===== -->
