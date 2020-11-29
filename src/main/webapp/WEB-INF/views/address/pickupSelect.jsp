<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
