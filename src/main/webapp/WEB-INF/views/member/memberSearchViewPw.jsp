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
	#select li a{
		font-size: 17px;
	}
	
	.changePw{
		margin: 0 auto;
		padding: 30px;
	}
	
	#pText{
		font-size: 32px;
		margin-bottom: 20px;
	}
</style>

</head>
<body>

	<div class="container">
		<div class="order-title-wrap">
		<h2 class="order-title">아이디/비밀번호 찾기</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>아이디/비밀번호 찾기</strong></li>
				</ol>
			</div>
		</div>
		
		<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
			<li>
				<a href="./memberSearch">아이디 찾기</a> ㅣ 
				<a href="./memberSearchPw">비밀번호 찾기</a> 
			</li>
		</ul>

		<form action="./setPassword" method="post" id="frm">
		<input type="text" value="${dto.member_id}" name="member_id" class="none">
		<div class="container">
			<div class="changePw">
				<p id="pText">비밀번호 변경</p>
				<p>새로 사용할 비밀번호를 입력하세요</p>
			</div>
			<div>
			<dl>
				<dt>새 비밀번호</dt>
				<dd><input placeholder="특수문자, 문자 , 숫자  8~15자리 이내의 암호" type="password" id="member_pw2" name="member_pw2" style="text-align:center; width:320px; height:42px;"></dd>
			</dl>
			<dl>
				<dt>새 비밀번호 확인</dt>
				<dd>
					<div>
						<input placeholder="특수문자, 문자 , 숫자  8~15자리 이내의 암호" type="password" id="member_pw" name="member_pw" style="text-align:center; width:320px; height:42px;"><input type="button" value="확인" id="checkButt" style= "width:110px; height:42px;">
						<div id="pwSetResult"></div>
					</div>
				</dd>
			</dl>
			</div>
		</div>
	</form>
		
			
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	
    var pwCheck=false;
    var pwExpCheck=false;
    var regexPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;// 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
    
	$("#member_pw").blur(function() {
		var pw = $("#member_pw").val();
		var pw2 = $("#member_pw2").val();
		pwCheck=false;
	
		if(pw==''){
			$("#pwSetResult").html("Password를 입력하세요");
			$("#pwSetResult").removeClass("pwCheck0").addClass("pwCheck1");
		} else if(pw == pw2){
			$("#pwSetResult").html("Password가 일치 합니다");
			$("#pwSetResult").removeClass("pwCheck1").addClass("pwCheck0");
			pwCheck=true;
		}else {
			$("#pwSetResult").html("Password가 일치 하지 않습니다");
			$("#pwSetResult").removeClass("pwCheck0").addClass("pwCheck1");
		}
	});
	
	$("#checkButt").click(function() {
		if(pwCheck && pwExpCheck){
			$("#frm").submit();
			alert("비밀번호를 재설정하였습니다. 로그인 페이지로 이동합니다.")
			
		}else{
			alert("비밀번호를 다시 확인해주세요.")
			
		}
	});
	
	$("#member_pw").blur(function() {
		pwExpCheck=false;
		if(!regexPw.test($("input[id='member_pw']").val())) {
			pwExpCheck=false;
		 	alert("형식에 맞지 않는 비밀번호입니다.")
	    
		}else{
			pwExpCheck=true;
			alert("사용할 수 있는 비밀번호입니다.")
		}
	});
	

</script>
</html>