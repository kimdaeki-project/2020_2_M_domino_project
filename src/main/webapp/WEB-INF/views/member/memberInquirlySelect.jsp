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
	<h3 id="inq_num" class="none">${dto.inq_num}</h3>
	<table class="memberCheck">
	
		<tr>
			<td>아이디</td><td>${member.member_id}</td>
		</tr>
		<tr>
			<td>연락처</td><td>${member.member_phone}</td>
		</tr>
		<tr>
			<td>이메일</td><td>${member.member_email}</td>
		</tr>
		<tr>
			<td>문의유형</td><td>${dto.inq_type}</td>
		</tr>
		<tr>
			<td>문의내용</td><td><textarea rows="10" cols="40" name="inq_contents" readonly="readonly">${dto.inq_contents}</textarea></td>
		</tr>
		<tr>
			<td>답변</td><td><textarea rows="10" cols="40" name="inq_contents" readonly="readonly"></textarea></td>
		</tr>
		
		
	</table>
	</div>
	<input type="button" value="삭제">
	<input type="button" value="목록">

	
	
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>

</html>
