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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
		<h3 style="margin-top: 60px;">회원로그인</h3>
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
	</div>
	
	<div style="text-align: center;">
		<div style="display: inline-block;">
			 <a href = "https://kauth.kakao.com/oauth/authorize?client_id=a78c488c29324b1f75b218bf9e45e8b7&redirect_uri=http://localhost/t1/oauth&response_type=code">
		        	<img style="width:215px; height: 50px;"  alt="" src="${pageContext.request.contextPath}/resources/images/common/kakao_logo.png">
		     </a>
	     </div>
     
	     <div id="naver_id_login" style="display: inline-block;">
	     	<a href="${url}">
				<img style="width:215px; height: 50px;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
			</a>
		</div>

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