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
<c:import url="../template/header.jsp"></c:import>
</head>
<body>

	<div class="container">
	<h1>회원 문의 정보</h1><br>
		

	
	
	<div class="container">
	<table class="table table-hober">
		<tr>
			<td>회원번호</td>
			<td>글 번호</td>
			<td>제목</td>
			<td>글 내용</td>
			<td>작성일</td>
			<td>처리상태</td>
			<td>문의유형</td>
			<td>매장명</td>
			<td>매장지역</td>
			<td>답변</td>			
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.member_num}</td>
				<td>${dto.inq_num}</td>
				<td><a href="./memberInquirlyUpdate?inq_num=${dto.inq_num}">${dto.inq_title}</a></td>
				<td>${dto.inq_contents}</td>
				<td>${dto.inq_date}</td>
				<td>${dto.inq_state}</td>
				<td>${dto.inq_type}</td>
				<td>${dto.inq_shop}</td>
				<td>${dto.inq_location}</td>
				<td>${dto.inq_reply}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	</div>

</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>