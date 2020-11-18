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
		margin-top: 5px;
	}
	
	.login{
		padding-top: 60px;
		padding-bottom: 40px;
	}
	
	.login2{
		padding-left: 5px;
	}
	
	.checkbox{
		margin: 0 auto;
		width: 430px;
	}
	
	.checkbox label{
		float: left;
	}
	
	
	
	
</style>

</head>
<body>

	
	<div class="container">
	
	<div class="order-title-wrap" style="padding: 0 0 30px 0; border-bottom: 2px solid black">
		<h2 class="order-title">로그인</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>로그인</strong></li>
				</ol>
			</div>
	</div>

	<div class="text-center">
		<h3 style="margin-top: 20px;">회원로그인</h3>
		<form action="./memberLogin" method="post" class="form-horizontal" style="padding: 20px;">
		<div>
			<input type="text" name="member_id" value="${cookie.remember.value}" class="login2" placeholder="아이디" style="width:430px; height:42px;">
		</div>	
		<br>	
		<div>
			<input type="password" name="member_pw" class="login2" width="430" height="42" placeholder="비밀번호" style="width:430px; height:42px;">
		</div>
		<br>
		
		<div>
		<div class="checkbox" style="text-align: center;">
		 	 <label><input type="checkbox" name="remember">아이디저장</label>
		 	 <div class="idpw">
		 		<a href="./memberSearch">아이디 찾기</a> 
		 		ㅣ
		 		<a href="">비밀번호 찾기</a>
		 	</div>
		</div>
		</div>
			
		<button type="submit" style="text-align:center; width:430px; height:58px;" id="btnLog">로그인</button>
		<div></div><br>
		<button type="button" style="text-align:center; width:430px; height:58px;" id="btnJoin">회원가입</button>
		</form>
		
	
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=e1f63ee684f17ca5170508741bb253d4&redirect_uri=http://localhost/t1/kakao/kakaoLogin&response_type=code">
		카카오</a>


<!--  

		 <c:if test="${userId eq null}">
	        <a href="https://kauth.kakao.com/oauth/authorize?client_id=e1f63ee684f17ca5170508741bb253d4&redirect_uri=http://localhost/t1/kakao/kakaoLogin&response_type=code">
		          	카카오
		    </a>
	    </c:if>
	    
	    <c:if test="${userId ne null}">
	        <h1>로그인 성공입니다</h1>
	        <input type="button" value="로그아웃" onclick="location.href='/logout'">
   		 </c:if>
		
		-->
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