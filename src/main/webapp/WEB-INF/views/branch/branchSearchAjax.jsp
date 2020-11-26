<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${branch}" var="dto">
	<div class="row branch-addr-result">
		<div class="column branch-result-list">
			<dl>
				<dt>${dto.branch_name}
					<span class="tel">${dto.branch_phone}</span>
				</dt>
				<dd class="br-addr">매장 주소</dd>
				<dd class="hash">
					<span>
						특별 세일 1
						<br>
						특별 세일 2
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
				<a href="#" class="btn type1">상세보기</button></a>
				<a href="#" class="btn type2">방문포장</button></a>
			</div>
		</div>
	</div>
</c:forEach>