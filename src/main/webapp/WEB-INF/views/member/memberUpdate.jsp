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
	<h1>나의정보</h1>
	<br>
	
	<ul id="select">
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
	</div>
	
		
		<div class="container">
			<form action="./memberUpdate" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="name" class="labelUpdate">이름 </label>
				<input type="text" name="member_name" value="${member.member_name}" readonly="readonly" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="id" class="labelUpdate">아이디 </label>
			 	<input type="text" name="member_id" value="${member.member_id}" readonly="readonly" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="pw" class="labelUpdate">현재 비밀번호 </label>
				<input type="password" id="pw" value="${member.member_pw}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="pw2" class="labelUpdate">새 비밀번호 </label>
				<input type="password" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="pw3" class="labelUpdate">새 비밀번호 확인 </label>
				<input type="password" name="member_pw" id="pw2" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="pw4" class="labelUpdate">생년월일 </label>
				<input type="date" name="member_date" value="${member.member_date}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="phone" class="labelUpdate">휴대전화 </label>
				<input type="text" name="member_phone" value="${member.member_phone}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div class="form-group">
				<label for="email" class="labelUpdate">이메일 </label>
				<input type="email" name="member_email" value="${member.member_email}" style="text-align:center; width:500px; height:42px;">
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
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=1>1년</label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=3>3년</label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=5>5년</label>
			</div>

	<input type="submit" value="수정하기" id="btnUpdate" class="btn btn-default">
	<a href="./memberDelete" class="btn btn-default">회원탈퇴</a>
	</form>
	</div>
	
	
<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#btnUpdate").click(function () {
		if($("#pw2").val()=='') {
			$("#pw2").val($("#pw").val());
		}
	});
</script>
</html>
