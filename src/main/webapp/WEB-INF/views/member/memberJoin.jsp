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
	
</style>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <link href ="../resources/css/common/member.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>
	
	<div class="container">
		<h1>회원가입</h1>
		<form class="form-horizontal" action="./memberJoin" method="post" id="frm">
	
				<div class="form-group">
				<label for="name" class="labelUpdate">이름 </label>
				<input type="text" id="name" name="member_name" class="empty" style="text-align:center; width:500px; height:42px;"> 
				<div class="emptyResult"></div>
			</div>
			
			<div class="form-group">
				<label for="id" class="labelUpdate">아이디 </label>
				<input type="text" id="id" name="member_id" style="text-align:center; width:500px; height:42px;">
				<div id="idResult"></div>
			</div>
			
			<div class="form-group">
				<label for="pw" class="labelUpdate">비밀번호 </label>
				<input type="password" id="pw" name="member_pw" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="pw2" class="labelUpdate">비밀번호 확인 </label>
				<input type="password" id="pw2" name="member_pw2" style="text-align:center; width:500px; height:42px;">
				<div id="pwResult"></div>
			</div>
			
			<div class="form-group">
				<label for="date" class="labelUpdate">생년월일 </label>
				<input type="date" id="date" name="member_date" class="empty" style="text-align:center; width:500px; height:42px;">
				<div class="emptyResult"></div>
			</div>
			
			
			<div class="form-group">
				<label for="phone" class="labelUpdate">휴대전화 </label>
				<input type="text" name="member_phone" id="phone" style="text-align:center; width:500px; height:42px;">
				<input type="button" id="btnPhone" value="중복확인" class="checkButt" style= "width:110px; height:42px;">
				<div id="phoneResult"></div>
			</div>
			
			<div class="form-group">
				<label for="eamil" class="labelUpdate">이메일 </label>
				<input type="text" name="member_email" id="email" style="text-align:center; width:500px; height:42px;">
				<input type="button" id="btnEmail" value="중복확인" class="checkButt" style= "width:110px; height:42px;">
				<div id="emailResult"></div>
			</div>
			
			<div class="form-group level">
				<label for="level" class="labelUpdate">등급 </label>
				<input type="text" name="member_level" value="REGULAR" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="agg" class="labelUpdate">개인정보 유효기간 선택 </label>
  				<label class="radio-inline"><input type="radio" name="member_pi_date" value=1>1년</label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=3>3년</label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=5>5년</label>
			</div>
			
			<div class="form-group">
				<label for="aggAll" class="labelUpdate">약관 및 광고성 정보수신 전체 동의 </label>
				<div class="memberAgg">
  					<label><input type="checkbox" value=1 id="checkAll">전체 동의하기</label>
				</div>
			</div>	
				
				<div class="form-group">
					<label for="aggAll" class="labelUpdate">약관 전체동의</label>
					<div class="memberAgg">
  					<label><input type="checkbox" value=1 id="checkAll2">전체 동의하기</label><br>
  					<label><input type="checkbox" value=1 id="check1" class="chk2" name="member_pi_agg">개인정보 수집 및 이용동의(필수)</label><br>
 					<label><input type="checkbox" value=1 id="check2" class="chk2" name="member_clause_agg">이용약관 동의(필수)</label><br>
					<label><input type="checkbox" value=1 id="check3" class="chk2" name="member_locate_agg">위치기반 서비스 약관 동의(필수)</label>
					</div>
				</div>
				
			<div class="form-group">
				<label for="aggAll" class="labelUpdate">광고성 정보 수신 전체 동의 </label>
				<div class="memberAgg">
  					<label><input type="checkbox" value=1 id="checkAll3">전체 동의하기</label><br>
  					<label><input type="checkbox" value=1 id="check4" class="chk" name="member_msg_agg">문자 메세지(선택)</label><br>
 					 <label><input type="checkbox" value=1 id="check5" class="chk" name="member_email_agg">이메일(선택)</label><br>
  					<label><input type="checkbox" value=1 id="check6" class="chk" name="member_post_agg">DM 우편(최근 배달주소로 배송)(선택)</label>	
				</div>
			</div>
			<input type="button" id="btn" value="가입하기" class="checkButt" style= "width:110px; height:42px;">
		
		</form>
	</div>

<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">

	$("#checkAll2").click(function() {
		if($("#checkAll2").is(":checked")){
			$(".chk2").prop("checked",true);
		}else{
			$(".chk2").prop("checked",false);
		}
	});
	
	$("#checkAll3").click(function() {
		if($("#checkAll3").is(":checked")){
			$(".chk").prop("checked",true);
		}else{
			$(".chk").prop("checked",false);
		}
		
	});
	
	$("#checkAll").click(function() {
		if($("input:checkbox[id=checkAll]").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		}else {
			$("input[type=checkbox]").prop("checked", false);
		}
		
	});
	
	
	if($("input[type=checkbox]").prop("checked", false)) {
		$(".chk").val(0);
	}
	
	

	
	var idCheck=false;
	var pwCheck=false;
	var phoneCheck=false;
	var emailCheck=false;
	var emptyCheckResult=true;
	
	$("#btn").click(function() {
		emptyCheck();
		if(idCheck && pwCheck && phoneCheck && emailCheck && emptyCheckResult){
			$("#frm").submit();
		}else {
			alert("필수 항목을 입력해주세요.")
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
					str="사용 가능한 ID 입니다.";
					$("#idResult").removeClass("idCheck1").addClass("idCheck0");
					idCheck=true;
				}
				$("#idResult").html(str);
			});
		}else{
			$("#idResult").html("ID는  필수 항복입니다.")
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
					str="사용 가능한 전화번호 입니다.";
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
					str="사용 가능한 이메일 입니다.";
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