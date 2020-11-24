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
	
	.update_input input{
		text-align:center; 
		width:400px; 
		height:42px;
	}

</style>

</head>
<body>
	<div class="container">
		<div class="order-title-wrap">
		<h2 class="order-title">나의정보</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="./memberPage">나의정보</a></li>
					<li><strong>정보수정</strong></li>
				</ol>
			</div>
		</div>
		
		
		<ul id="select" style="padding: 20px 0;">
			<li>
			<a href="./memberPage">매니아 등급</a> ㅣ 
			<a href="./memberOrder">주문 내역</a> ㅣ 
			<a href="#">쿠폰함</a> ㅣ 
			<a href="../memberInq/memberInquirly">1:1 문의</a> ㅣ 
			<a href="./memberCheck">정보 수정</a> 
			</li>
		</ul>
		
	<div class="myLevel">
		<div class="myCheck">개인 정보 입력 안내문</div>
		<div></div>
		<div class="myCheck2">회원정보를 정확히 기입하셔야 주문이나 이벤트에 대한 불이익이 없습니다.</div>
	</div>
	
	<form action="./memberUpdate" method="post" class="form-horizontal" id="frm">
		<div class="form-group update_input">
			<label for="name" class="labelUpdate">이름 </label>
			<input type="text" name="member_name" value="${member.member_name}" readonly="readonly">
		</div>
			
		<div class="form-group update_input">
			<label for="id" class="labelUpdate">아이디 </label>
			 <input type="text" name="member_id" value="${member.member_id}" readonly="readonly">
		</div>
			
		<div class="form-group update_input">
			<label for="pw" class="labelUpdate">현재 비밀번호 </label>
			<input type="password" id="pw" value="${member.member_pw}" readonly="readonly">
		</div>
			
		<div class="form-group update_input">
			<label for="pw2" class="labelUpdate">새 비밀번호 </label>
			<input type="password" id="pw1" placeholder="특수문자, 문자 , 숫자  8~15자리 이내의 암호">
		</div>
			
		<div class="form-group update_input">
			<label for="pw3" class="labelUpdate">새 비밀번호 확인 </label>
			<input type="password" name="member_pw" id="pw2" placeholder="특수문자, 문자 , 숫자  8~15자리 이내의 암호">
			<div id="pwSetResult"></div>
		</div>
			
		<div class="form-group update_input">
			<label for="pw4" class="labelUpdate">생년월일 </label>
			<input type="date" name="member_date" value="${member.member_date}">
		</div>
			
		<div class="form-group update_input">
			<label for="phone" class="labelUpdate">휴대전화 </label>
			<input type="text" name="member_phone" value="${member.member_phone}" id="phone"placeholder="ex) 010-0000-0000">
			 <input type="button" id="btnPhone" value="중복확인" class="checkButt" style="width: 110px;">
			 <div id="phoneResult"></div>
		</div>
			
		<div class="form-group update_input">
			<label for="email" class="labelUpdate">이메일 </label>
			<input type="email" name="member_email" value="${member.member_email}" id="email" placeholder="ex) aaaa@gmail.com">
			 <input type="button" id="btnEmail" value="중복확인" class="checkButt" style="width: 110px;">
			 <div id="emailResult"></div>
		</div>
			
		<div class="form-group">
			<label for="agg1" class="labelUpdate">정보수신동의 </label>
			<div id="labelCheck">
				<label><input type="checkbox" value=1 id="check4" class="chk" name="member_email_agg" checked="checked"> 이메일을 통한 제품 및 이벤트 정보수신에 동의합니다.(선택)</label><br>
				<label><input type="checkbox" value=1 id="check5" class="chk" name="member_post_agg" checked="checked"> DM을 통한 제품 및 이벤트 정보수신에 동의합니다.(최근 배달주소로 배송)(선택)</label><br>
				<label><input type="checkbox" value=1 id="check6" class="chk" name="member_msg_agg" checked="checked"> 문자(SMS,MMS 등)를 통한 제품 및 이벤트 정보수신에 동의합니다.(선택)</label><br>
			</div>
		</div>
		
		<div class="form-group">
			<label for="agg2" class="labelUpdate">개인정보 유효기간 선택 </label>
			<div style="display:inline-block; padding: 20px 0;">
			<label class="radio-inline"><input type="radio" name="member_pi_date" value=1>1년</label>
			<label class="radio-inline"><input type="radio" name="member_pi_date" value=3>3년</label>
			<label class="radio-inline"><input type="radio" name="member_pi_date" value=5>5년</label>
			</div>
		</div>

	<div style="text-align: center;">
		<input type="button" value="수정하기" id="btnUpdate" class="btn btn-default">
		<a href="./memberDelete" class="btn btn-default">회원탈퇴</a>
	</div>
	
	</form>
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>


<script type="text/javascript">

	var pwCheck=false;
	var emailCheck=false;
	var phoneCheck=false;
	var idExpCheck=false;
	var pwExpCheck=true;
	var phoneExpCheck=true;
	var emailExpCheck=true;

	$("#btnUpdate").click(function () {
		if($("#pw2").val()=='') {
			$("#pw2").val($("#pw").val());
			pwCheck=true;
		}
		
		if(pwCheck && pwExpCheck && phoneExpCheck && emailExpCheck) {
			$("#frm").submit();
			alert("정보 수정이 완료되었습니다")
		}else{
			alert("비밀번호, 이메일, 전화번호를 확인해주세요")
		}
	});
	
	var passRule = /^[A-Za-z0-9]{6,12}$/;//아이디 정규식 숫자와 문자 포함 형태의 6~12자리 이내의 아이디 정규식
	var regexPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;// 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;//핸드폰 번호 정규식
	
	
	$("#pw2").blur(function() {
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		pwCheck=false;
		if(pw2==''){
			$("#pwSetResult").html("비밀번호를 변경하려면 입력하세요.");
			$("#pwSetResult").removeClass("pwCheck0").addClass("pwCheck1");
			pwCheck=true;
		}else if(pw1 == pw2){
			$("#pwSetResult").html("비밀번호가 일치 합니다");
			$("#pwSetResult").removeClass("pwCheck1").addClass("pwCheck0");
			pwCheck=true;
		}else {
			$("#pwSetResult").html("비밀번호가 일치 하지 않습니다");
			$("#pwSetResult").removeClass("pwCheck0").addClass("pwCheck1");
		}
	});
	
	$("#pw2").blur(function() {
		pwExpCheck=false;
		if(!regexPw.test($("input[id='pw2']").val())) {
			pwExpCheck=false;
		 	alert("형식에 맞지않는 비밀번호입니다.")
	    
		}else{
			pwExpCheck=true;
			alert("사용할 수 있는 비밀번호입니다.")
		}
		
	});
	
	$("#phone").blur(function() {
		phoneExpCheck=false;
		if(!regExpPhone.test($("input[id='phone']").val())) {
			phoneExpCheck=false;
		 	alert("형식에 맞지않는 전화번호입니다.")
	    
		}else{
			phoneExpCheck=true;
			alert("사용할 수 있는 전화번호입니다.")
		}
		
	});
	
	$("#email").blur(function() {
		emailExpCheck=false;
		if(!regExpEmail.test($("input[id='email']").val())) {
			emailExpCheck=false;
		 	alert("형식에 맞지않는 이메일입니다.")
	    
		}else{
			emailExpCheck=true;
			alert("사용할 수 있는 이메일입니다.")
		}
		
	});
	
	$("#btnPhone").click(function () {
		phoneCheck=false;
		var phone = $("#phone").val();
		if(phone !=''){
			$.get("./memberPhoneCheck?member_phone="+phone,function(data){
				data=data.trim();
				var str = "중복된  전화번호 입니다."
				
				$("phoneResult").removeClass("phoneCheck0").addClass("phoneCheck1");
				if(data==0){
					str="중복되지 않은 전화번호 입니다.";
					$("#phoneResult").removeClass("phoneCheck1").addClass("phoneCheck0");
					phoneCheck=true;
				}
				$("#phoneResult").html(str);
			});
		}else{
			$("#phoneResult").html("전화번호를  입력후 중복검사를 해주세요.");
			$("#phoneResult").removeClass("phoneCheck0").addClass("phoneCheck1");
		}
	});
	
	
	$("#btnEmail").click(function () {
		emailCheck=false;
		var email = $("#email").val();
		if(email !=''){
			$.get("./memberEmailCheck?member_email="+email,function(data){
				data=data.trim();
				var str = "중복된  이메일 입니다."
				
				$("emailResult").removeClass("emailCheck0").addClass("emailCheck1");
				if(data==0){
					str="중복되지 않은 이메일 입니다.";
					$("#emailResult").removeClass("emailCheck1").addClass("emailCheck0");
					emailCheck=true;
				}
				$("#emailResult").html(str);
			});
		}else{
			$("#emailResult").html("이메일을  입력후 중복검사를 해주세요.");
			$("#emailResult").removeClass("emailCheck0").addClass("emailCheck1");
		}
	});
	
</script>
</html>
