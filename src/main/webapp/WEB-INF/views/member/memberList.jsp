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

	<h1>Member List</h1>
	
	<div class="container">
	<table class="table table-hober">
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.member_id}</td>
				<td>${dto.member_pw}</td>
				<td>${dto.member_name}</td>
				<td>${dto.member_phone}</td>
			
			</tr>
		</c:forEach>
	
	</table>
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>