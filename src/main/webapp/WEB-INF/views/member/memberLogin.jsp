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
	<form action="./memberLogin" method="post">
	
	<div>
		<input type="text" name="member_id" value="${cookie.remember.value}">
	</div>	
	
	<div>
		<input type="password" name="member_pw">
	</div>
	
	<div class="checkbox">
	 	 <label><input type="checkbox" name="remember">이이디저장</label>
	 	<a href="./memberSearch">아이디 찾기</a>
	 	<a href="">비밀번호 찾기</a>
	</div>
		
	<button type="submit">로그인</button>
	<a href="./memberJoin">회원가입</a>
	</form>
	</div>
	
	
<c:import url="../template/footer.jsp"></c:import>
</body>


</html>