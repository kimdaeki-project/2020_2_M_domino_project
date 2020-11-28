<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
				<a href="#" class="btn type1">상세보기</a>
				<a href="#" class="btn type2">방문포장</a>
			</div>
		</div>
		<input type="text" class="brLat" value="${dto.latitude}">
		<input type="text" class="brLon" value="${dto.longitude}">
	</div>
</c:forEach>
