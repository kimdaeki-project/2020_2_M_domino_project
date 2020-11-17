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

<style type="text/css">
	.detail_page{
			border-bottom: 2px solid black;
			padding: 20px 0;
	}
			
	.detail_page span{
		float: right;
		font-size: 15px;
		padding: 1% 0;
	}
	
	.login_top_text{
		width:430px; 
		height:42px;
		text-align: center;
	}
	
	.login_top_text span{
		 font-size: 20px; 
		 font-weight: bold;
		
	}
	
	#btnLog, #btnJoin, .login2{
		border: 1px solid #ddd;
	}
	
	.login{
		padding-top: 60px;
		padding-bottom: 40px;
	}
	
	.login2{
		padding-left: 5px;
	}
	
	.checkbox{
		padding: 10px 0;
	}
</style>

</head>
<body>

	
	<div class="container">
	
	<div class="detail_page">
		<h2>로그인<span style="font-size: 12px;">홈>로그인</span></h2>			
	</div>

	<div class="login">
	
	<div class="login_top_text">
		<span>회원 로그인</span>
	</div>	
	
	<br>
	<form action="./memberLogin" method="post" class="form-horizontal">
	<div>
		<input type="text" name="member_id" value="${cookie.remember.value}" class="login2" placeholder="아이디" style="width:430px; height:42px;">
	</div>	
	<br>	
	<div>
		<input type="password" name="member_pw" class="login2" width="430" height="42" placeholder="비밀번호" style="width:430px; height:42px;">
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