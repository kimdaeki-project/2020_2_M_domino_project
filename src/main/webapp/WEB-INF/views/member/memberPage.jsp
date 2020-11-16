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
	<h1>나의정보</h1>
	<br>
	
	<ul id="select">
		<li class="list2">
		<a href="./memberPage">매니아 등급</a>
		</li>
		
		<li class="list2">
		 ㅣ 
		 </li>
		 
		 <li class="list2">
		<a href="#">주문 내역</a>
		 </li> 
		 
		 <li class="list2">
		 ㅣ 
		 </li>
		   
		 <li class="list2">
		<a href="#">쿠폰함</a>
		 </li>
		  
		<li class="list2"> 
		ㅣ 
		</li> 
		
		<li class="list2">
		<a href="./memberInquirly">1:1 문의</a>
		</li> 
		
		<li class="list2">
		 ㅣ 
		 </li> 
		 
		 <li class="list2">
		<a href="./memberCheck">정보 수정</a> 
		</li>
	</ul>
	<div class="myLevel">
		<h4 id="mName">${member.member_name}님</h4>
		<div class="myCheck"><h1 id="mLevel">${member.member_level}</h1></div>
		<div></div>
		<div class="myCheck2">등급별 혜택보기></div>
	</div>
	<h4>PREMIUN 등급으로 업그레이드하려면?</h4>
	<div class="memberCheck"></div>
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>