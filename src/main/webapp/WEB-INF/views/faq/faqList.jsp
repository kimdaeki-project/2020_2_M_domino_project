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
		<p>도미노피자에 대한 궁금증을 바로 확인하실 수 있습니다.</p>
		<p class="txt_faq">도미노피자 고객만족센터 <a href="#">080-860-3082</a></p>
	</div>
	
	<div class="container">
		<div class="tab-type4 btn_tab_faq">
			<ul>
				<li class="active"><a href="#">피자 주문하기</a></li>
				<li><a href="#">주문확인</a></li>
				<li><a href="#">포장 주문</a></li>
				<li><a href="#">피자 선물하기</a></li>
				<li><a href="#">도미노콘</a></li>
				<li><a href="#">피자 상품권</a></li>
				<li><a href="#">홈페이지 관련</a></li>
				<li><a href="#">배달서비스 평가</a></li>
			</ul>
		</div>
	</div>
	
	<div class="container">
	<table class="table table-hover">
	 	<c:forEach items="${list}" var="dto" varStatus="vs">
		 	<tr>
	 		<td>${dto.board_title}</td>
	 		<td><a href="#" class="btn btn-danger">더보기</a></td>
	 		</tr>
	 		<tr>
	 			<td>${dto.board_contents}</td>
	 		</tr>
	 	</c:forEach>
 	</table>
	</div>
	
	<a href="./faqWrite" class="btn btn-danger">faqWrite</a>
 	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>