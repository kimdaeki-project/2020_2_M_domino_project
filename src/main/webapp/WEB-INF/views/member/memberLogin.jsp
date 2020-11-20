<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
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
		<strong><h3 style="margin-top: 20px;">회원로그인</h3></strong>
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
	
	
	 <%
    	String clientId = "krd7qvibeLK_wDIuIQxt";//애플리케이션 클라이언트 아이디값";
    	String redirectURI = URLEncoder.encode("http://localhost/t1/callback", "UTF-8");
  	    SecureRandom random = new SecureRandom();
    	String state = new BigInteger(130, random).toString();
   	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
   		apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
        session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	
	
	</div>
	
	
	
<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#btnJoin").click(function() {
		location.href = "./memberJoin";
	});
</script>

</html>