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
		<div class="myCheck">본인여부 확인</div>
		<div></div>
		<div class="myCheck2">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시한번 확인합니다.</div>
	</div>
	<div class="memberCheck"></div><br>
	<form action="./memberCheck" method="post">
	<div class="container">


		<div>
		<dl>
			<dt>아이디</dt>
			<dd><input type="text" name="member_id" value="${member.member_id}" readonly="readonly" style="text-align:center; width:300px; height:42px;"></dd>
		</dl>
		<dl>
			<dt>비밀번호</dt>
			<dd>
				<div>
					<input type="password" name="member_pw" style="text-align:center; width:300px; height:42px;"><input type="submit" value="확인" id="checkButt" style= "width:110px; height:42px;">
				</div>
			</dd>
		</dl>
		
			

		</div>
	</div>
	</form>
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>