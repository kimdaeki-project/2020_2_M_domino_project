<%@page import="org.springframework.web.servlet.ModelAndView"%>
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
	
	#join2_Go_main{
		margin: 0 auto;
		text-align: center;
		width: 300px;
		height: 50px;
		background-color: #ff143c;
		margin-bottom: 10px;
	}
	
	#join2_Go_main a{
		font-weight: bold;
		font-size: 18px;
		color: white;
		line-height: 50px;
	}
	
	#join2_text{
		text-align: center;
		margin: 20px 0;
	}

</style>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <link href ="../resources/css/common/member.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
</head>

<body>

	<c:choose>
		<c:when test="${empty sessionId}">
		
			<c:import url="../template/header.jsp"></c:import>
			
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
							      <input type="text" id="name" name="member_name" class="form-control" value="${sessionNick}" readonly="readonly" >
							   </div>
						</div>
							 
						<div class="col-sm-12 join_input">
							<label class="col-sm-2 join_text" for="id">아이디</label>
							    <div class="col-sm-4">
							       <input type="text" id="id" name="member_id" class="form-control" value="${sessionId}" readonly="readonly">
							    </div>
						</div>
							 
						<div class="col-sm-12 join_input">
							<label class="col-sm-2 join_text" for="pw">비밀번호</label>
							    <div class="col-sm-4">
							       <input type="password" id="pw" name="member_pw" class="form-control" value="${sessionId}" readonly="readonly" >
							    </div>
						</div>
							 
						<div class="col-sm-12 join_input">
							<label class="col-sm-2 join_text" for="date">생년월일</label>
							    <div class="col-sm-4">
							       <input type="date" id="date" name="member_date" class="form-control empty" >
							      	<div class="emptyResult"></div>
							    </div>
						</div>
							 
						<div class="col-sm-12 join_input">
							<label class="col-sm-2 join_text" for="phone">휴대전화 </label>
							    <div class="col-sm-4">
							       <input type="text" name="member_phone" id="phone">
							       <input type="button" id="btnPhone" value="중복확인" class="checkButt" style= "width:110px; height:42px;">
							      <div id="phoneResult"></div>
							    </div>
						</div>
						
						<div class="col-sm-12 join_input">
							 <label class="col-sm-2 join_text" for="email">이메일 </label>
							    <div class="col-sm-4">
							      <input type="email" name="member_email" id="email" value="${sessionEmail}" readonly="readonly">
							      <input type="button" id="btnEmail" value="중복확인" class="checkButt" style="visibility: hidden;">
							    </div>
						</div>
							 	 
						<div class="form-group level">
							<label for="level" class="labelUpdate">등급 </label>
							<input type="text" name="member_level" value="REGULAR" style="text-align:center; width:500px; height:42px;">
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
				</c:when>
			
	      	
	      	<c:when test="${not empty sessionId}">

	      		<script type="text/javascript">
	      			alert("이미 회원가입 되어있는 사용자 입니다.");
	      			location.href="${pageContext.request.contextPath}";	
	      		</script>
	      	   		 -->
	      	</c:when>	
		   
	      </c:choose>	
	      		
	      		<!-- 
	      		<div style="padding: 100px 0;">
	      			<div id="join2_text">
	      				<img src="${pageContext.request.contextPath}/resources/images/common/emoji.png">
						<h3>이미 회원가입이 되어있는 사용자입니다.</h3>
	      			</div>
	      			
		      		<div id="join2_Go_main">
		      			<a href="${pageContext.request.contextPath}">메인으로 </a>
		      		</div>

	      		</div>
	      		
	      		 -->      
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
	
	var phoneCheck=false;
	
	$("#btn").click(function() {
		emptyCheck();
		if(phoneCheck){
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
	
</script>
</html>