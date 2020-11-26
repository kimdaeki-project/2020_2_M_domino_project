<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.level {
		display: none;
	}
	
	.join_input{
			border-bottom: 2px solid #f5f5f5;
			padding: 2% 0;
		}
		
	.join_input input{
		height: 42px;
	}
		
	.join_text{
		padding-left: 0;
		text-align: left;
		font-size: 17px;
	}
	
	#chkNotice{
		color: red;
	}
	
</style>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <link href ="../resources/css/common/member.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
 <c:import url="../template/header.jsp"></c:import>
</head>
<body>
	
	<div class="container">
	
		<div class="order-title-wrap" style="padding: 0 0 30px 0; border-bottom: 2px solid black">
		<h2 class="order-title">회원가입</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>회원가입</strong></li>
				</ol>
			</div>
		</div>
		
		<div style="padding: 0;">
		<form class="form-horizontal" action="./memberJoin" method="post" id="frm">
			
			<div class="col-sm-12 join_input">
			    <label class="col-sm-2 join_text" for="name">이름</label>
			    <div class="col-sm-4">
				   <input type="text" id="name" name="member_name" class="form-control empty">  
			       <div class="emptyResult"></div>
			    </div>
			 </div>
			 
			 <div class="col-sm-12 join_input">
			    <label class="col-sm-2 join_text" for="id">아이디</label>
			    <div class="col-sm-4">
	    
			     <input type="text" id="id" name="member_id" class="form-control empty" placeholder="숫자와 문자 포함   6~12자리">
			   
			      <div id="idResult"></div>
			    </div>
			 </div>
			 
			 <div class="col-sm-12 join_input">
			    <label class="col-sm-2 join_text" for="pw">비밀번호</label>
			    <div class="col-sm-4">
			       <input type="password" id="pw" name="member_pw" class="form-control empty" placeholder="특수문자 , 문자 , 숫자 포함  8~15자리 이내의 암호">
			    </div>
			 </div>
			 
			  <div class="col-sm-12 join_input">
			    <label class="col-sm-2 join_text" for="pw2">비밀번호 확인</label>
			    <div class="col-sm-4">
			       <input type="password" id="pw2" name="member_pw2" class="form-control empty" placeholder="특수문자 , 문자 , 숫자 포함  8~15자리 이내의 암호">
			       <div id="pwResult"></div>
			    </div>
			 </div>
			 
			 <div class="col-sm-12 join_input">
			    <label class="col-sm-2 join_text" for="date">생년월일</label>
			    <div class="col-sm-4">
			       <input type="date" id="date" name="member_date" class="form-contro lempty">
			       <div class="emptyResult"></div>
			    </div>
			 </div>
			 
			 <div class="col-sm-12 join_input">
			    <label class="col-sm-2 join_text" for="phone">휴대전화 </label>
			    <div class="col-sm-4">
			       <input type="text" name="member_phone" id="phone" placeholder="ex) 010-xxxx-xxxx">
			       <input type="button" id="btnPhone" value="중복확인" class="checkButt" style= "width:110px; height:42px;">
			      <div id="phoneResult"></div>
			    </div>
			 </div>
		
			  <div class="col-sm-12 join_input">

			     <label class="col-sm-2 join_text" for="email">이메일 </label>
			   <div class="col-sm-4">
				<input type="email" name="member_email" id="email" placeholder="ex) aaa@gmail.com">
			    <input type="button" id="btnEmail" value="중복확인" class="checkButt">
			    <div id="emailResult"></div>


			    </div>
			  </div>
			  	
			 <div class="form-group level">
				<label for="level" class="labelUpdate">등급 </label>
				<input type="text" name="member_level" value="REGULAR" style="text-align:center; width:500px; height:42px;">
			</div>

						

			<div style="padding: 15px;">
				<div class="form-group">
					<label for="agg" class="labelUpdate">개인정보 유효기간 선택 </label>
					<div class="radioSel">
	  					<label class="radio-inline"><input type="radio" name="member_pi_date" value=1>1년</label>
						<label class="radio-inline"><input type="radio" name="member_pi_date" value=3>3년</label>
						<label class="radio-inline"><input type="radio" name="member_pi_date" value=5>5년</label>
					</div>
				</div>
				
				<div class="form-group" style="height: 50px;">
					<label for="aggAll" class="labelUpdate">약관 및 광고성 정보수신 전체 동의 </label>
					<div class="memberAgg" id="chAll">
	  					<label><input type="checkbox" value=1 id="checkAll">전체 동의하기</label>
					</div>
				</div>	
					
				<div class="form-group">
						<label for="aggAll" class="labelUpdate">약관 전체동의</label>
						<div class="memberAgg">
						<span id="chkNotice">* 필수사항 미체크시 회원가입이 진행되지 않습니다.</span><br>
	  					<label><input type="checkbox" value=1 id="checkAll2">전체 동의하기</label><br>
	  					<label><input type="checkbox" value=1 id="check1" class="chk2" name="member_pi_agg">개인정보 수집 및 이용동의(필수)</label><br>
	 					<label><input type="checkbox" value=1 id="check2" class="chk2" name="member_clause_agg">이용약관 동의(필수)</label><br>
						<label><input type="checkbox" value=1 id="check3" class="chk2" name="member_locate_agg">위치기반 서비스 약관 동의(필수)</label>
						</div>
				</div>
					
				<div class="form-group">
					<label for="aggAll" class="labelUpdate">광고성 정보 수신 전체 동의 </label>
					<div class="memberAgg" id="aggAll">
	  					<label><input type="checkbox" value=1 id="checkAll3">전체 동의하기</label><br>
	  					<label><input type="checkbox" value=1 id="check4" class="chk" name="member_msg_agg">문자 메세지(선택)</label><br>
	 					 <label><input type="checkbox" value=1 id="check5" class="chk" name="member_email_agg">이메일(선택)</label><br>
	  					<label><input type="checkbox" value=1 id="check6" class="chk" name="member_post_agg">DM 우편(최근 배달주소로 배송)(선택)</label>	
				</div>
				</div>
			</div>
			
			<div style="text-align: center;">
			<input type="button" id="btn" value="가입하기" class="checkButt" style= "width:110px; height:42px;">
			</div>
			
		</form>
		</div>
	</div>

<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	
	//필수사항 전체 체크
	$("#checkAll2").click(function() {
		if($("#checkAll2").is(":checked")){
			$(".chk2").prop("checked",true);
			
		}else{
			$(".chk2").prop("checked",false);
		}
	});
	//필수사항 전체 체크
	
	//선택사항 전체 체크
	$("#checkAll3").click(function() {
		if($("#checkAll3").is(":checked")){
			$(".chk").prop("checked",true);
		}else{
			$(".chk").prop("checked",false);
		}
		
	});
	//선택사항 전체 체크
	
	//전체 동의사항 체크
	$("#checkAll").click(function() {
		if($("input:checkbox[id=checkAll]").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		}else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	//전체 동의사항 체크
	

	


	
	//회원가입 id, pw, 이메일, 전화번호 중복 및 공백 검사

		var idCheck=false;
		var pwCheck=false;
		var phoneCheck=false;
		var emailCheck=false;
		var emptyCheckResult=true;	

	
	var aggCheck=false;
	
	$("#btn").click(function() {
		
		var check1 = $("#check1").prop("checked");
		var check2 = $("#check2").prop("checked");
		var check3 = $("#check3").prop("checked");

			aggCheck=false;
			
			if(check1 && check2 && check3){
				aggCheck=true;
			}else{
				aggCheck=false;
			}
			
		emptyCheck();
		
		if(idCheck && pwCheck && phoneCheck && emailCheck && emptyCheckResult && idExpCheck && pwExpCheck && phoneExpCheck && emailExpCheck && aggCheck){
			$("#frm").submit();
		}else {
			alert("필수 항목을 입력 및 입력 형식을 지켜주세요.")
		}
	});
	
	function emptyCheck() {
		emptyCheckResult=true;
		$(".emptyResult").removeClass("idCheck1")
		$(".emptyResult").html('');
		$(".empty").each(function() {
			var data = $(this).val();
			if(data==''){
				emptyCheckResult=false;
				$(this).next().html("필수 항목입니다.")
				$(".emptyResult").addClass("idCheck1");
			}	
		});
	}
	
	$("#pw2").blur(function() {
		var pw = $("#pw").val();
		var pw2 = $(this).val();
		pwCheck=false;
		
		if(pw2==''){
			$("#pwResult").html("Password를 입력하세요");
			$("#pwResult").removeClass("pwCheck0").addClass("pwCheck1");
		} else if(pw == pw2){
			$("#pwResult").html("Password가 일치 합니다");
			$("#pwResult").removeClass("pwCheck1").addClass("pwCheck0");
			pwCheck=true;
		}else {
			$("#pwResult").html("Password가 일치 하지 않습니다");
			$("#pwResult").removeClass("pwCheck0").addClass("pwCheck1");
		}
	});
	
	$("#id").blur(function () {
		idCheck=false;
		var id = $(this).val();
		if(id !=''){
			$.get("./memberIdCheck?member_id="+id,function(data){
				data=data.trim();
				var str = "중복된  ID 입니다."
				
				$("idResult").removeClass("idCheck0").addClass("idCheck1");
				if(data==0){
					str="중복되지 않은 ID 입니다.";
					$("#idResult").removeClass("idCheck1").addClass("idCheck0");
					idCheck=true;
				}
				$("#idResult").html(str);
			});
		}else{
			$("#idResult").html("ID는  필수 항목입니다.")
			$("#idResult").removeClass("idCheck0").addClass("idCheck1");
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

	//회원가입 id, pw, 이메일, 전화번호 중복 및 공백 검사
		
	
	//회원가입 유효성 검사
	
	var passRule = /^[A-Za-z0-9]{6,12}$/;//아이디 정규식 숫자와 문자 포함 형태의 6~12자리 이내의 아이디 정규식
	var regexPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;// 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;//핸드폰 번호 정규식
	
	
	
		var idExpCheck=false;
		var pwExpCheck=false;
		var phoneExpCheck=false;
		var emailExpCheck=false;

	

	$("#id").blur(function() {
		idExpCheck=false;
		if(!passRule.test($("input[id='id']").val())) {
			idExpCheck=false;
		 	alert("형식에 맞지않는 아이디입니다.")
	    
		}else{
			idExpCheck=true;
			alert("사용할 수 있는 아이디입니다.")
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
			alert("사용할 수 있는 전화번호 형식입니다.")
		}
	});
	
	
	$("#email").blur(function() {
		emailExpCheck=false;
		if(!regExpEmail.test($("input[id='email']").val())) {
			emailExpCheck=false;
		 	alert("형식에 맞지않는 이메일입니다.")
	    
		}else{
			emailExpCheck=true;
			alert("사용할 수 있는 이메일 형식입니다.")
		}
	});
	
	//회원가입 유효성 검사

</script>
</html>