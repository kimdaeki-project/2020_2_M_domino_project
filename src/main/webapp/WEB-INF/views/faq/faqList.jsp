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
  <script src="../resources/js/header.js"></script>

	<style type="text/css">
		.detail_page{
			margin-top: 2%;
			border-bottom: 2px solid black;
			margin-bottom: 1%;
		}		
		.detail_page span{
			float: right;
			font-size: 15px;
			padding: 1% 0;
		}
		
		.detail_page_Link {	
			text-align: left;
			color: black;
		}
		
		.detail_page_Link a{
			
		}
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container detail_page">
		<h2>고객센터<span>홈>매장검색</span></h2>
		
		<div class="container detail_page_Link">
		<a href="#">자주하는 질문</a> <a href="">온라인신문고</a>
		</div>
	</div>
	
	<div class="container">
	내용
	  <c:forEach items="${list}" var="dto" varStatus="vs">
	 	<tr>
	 		<td>${dto.board_num}</td>
	 		<td>${dto.board_title}</td>
	 		<td>${dto.board_writer}</td>
	 		<td>${dto.board_contents}</td>
	 	</tr>
 	</c:forEach>
	<div>
	
	</div>
	</div>
	
	<a href="./faqWrite" class="btn btn-danger">Write</a>
 	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>