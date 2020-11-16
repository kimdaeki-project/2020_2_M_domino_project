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
		<a href="./memberOrder">주문 내역</a>
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
		<div class="myCheck">개인 정보 입력 안내문</div>
		<div></div>
		<div class="myCheck2">회원정보를 정확히 기입하셔야 주문이나 이벤트에 대한 불이익이 없습니다.</div>
	</div>
	
	
			<div class="container">
			<form action="./memberUpdate" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="name" class="labelUpdate">이름 </label>
				<span>${member.member_name}</span>
			</div>
			
			<div class="form-group">
				<label for="id" class="labelUpdate">아이디 </label>
			 	<span>${member.member_id}</span>
			</div>
			
			<div class="form-group">
				<label for="email" class="labelUpdate">이메일 </label>
				<span>${member.member_email}</span>
			</div>	
			
			<div class="form-group">
				<label for="inqType" class="labelUpdate">문의유형 </label>
				<span>${dto.inq_type}</span>
			</div>
			
			<div class="form-group">
				<label for="shop" class="labelUpdate">매장 검색 </label>
				<span>${dto.inq_shop} : ${dto.inq_location}</span>
			</div>
			
			<div class="form-group">
				<label for="contents" class="labelUpdate">문의내용 </label>
				<span><textarea rows="10" cols="30" name="inq_contents" readonly="readonly" class="tAtea">${dto.inq_contents}</textarea></span>
			</div>
			
			<div class="form-group">
				<label for="reply" class="labelUpdate">답변 </label>
				<span><textarea rows="10" cols="30" name="inq_contents" readonly="readonly" class="tAtea"></textarea></span>
			</div>
			
	<a href="./memberInquirlyDelete" class="btn btn-default">삭제</a>
	<a href="./memberInquirly" class="btn btn-default">목록</a>

	</form>
	</div>
	
	
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>

</html>
