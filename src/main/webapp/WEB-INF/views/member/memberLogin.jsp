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
	<h1>로그인</h1><br>
	<div class="memberCheck"></div>
	<br>
	<div class="login">
	<ul>
		<li class="logSelect" id="mLog">
		<a>회원 로그인</a>
		</li>
		
		<li class="logSelect" id="noLog">
		<a>비회원 주문</a>
		</li>
		
	</ul><br>
	<form action="./memberLogin" method="post" class="form-horizontal">
	<div>
		<input type="text" name="member_id" value="${cookie.remember.value}" class="login2" style="text-align:center; width:430px; height:42px;">
	</div>	
	<br>	
	<div>
		<input type="password" name="member_pw" class="login2" width="430" height="42" style="text-align:center; width:430px; height:42px;">
	</div>
	<br>
	<div class="checkbox">
	 	 <label><input type="checkbox" name="remember">아이디저장</label>
	 	 <div class="idpw">
	 	<a href="./memberSearch">아이디 찾기</a> 
	 	ㅣ
	 	
	 	<a href="">비밀번호 찾기</a>
	 	</div>
	</div>
		
	<button type="submit" style="text-align:center; width:430px; height:58px;" id="btnLog">로그인</button>
	<div></div><br>
	<button type="button" style="text-align:center; width:430px; height:58px;" id="btnJoin">회원가입</button>
	</form>
	</div>
	</div>
	
	
<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#btnJoin").click(function() {
		location.href = "./memberJoin";
	});
</script>

</html>