<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <link href ="../resources/css/common/member.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
  <link href ="../resources/css/common/tableList.css" rel="stylesheet">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
	
	<div class="order-title-wrap" style="padding: 0 0 30px 0; border-bottom: 2px solid black">
		<h2 class="order-title">회원문의 정보</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>회원문의 정보</strong></li>
				</ol>
			</div>
	</div>
		
	<div class="list_con">
			<table class="table table-hober">
				<tr>
					<td class="col-sm-1">회원번호</td>
					<td class="col-sm-2">글 번호</td>
					<td class="col-sm-5">제목</td>
					<td class="col-sm-2">작성일</td>
					<td class="col-sm-2">처리상태</td>	
				</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.member_num}</td>
				<td>${dto.inq_num}</td>
				<td class="newsTitle"><a href="./memberInquirlyUpdate?inq_num=${dto.inq_num}">${dto.inq_title}</a></td>
				<td>${dto.inq_date}</td>
				<td>${dto.inq_state}</td>
		</c:forEach>	
	</table>
	
	</div>

</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>