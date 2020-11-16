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
		<a href="./memberLevel">매니아 등급</a> ㅣ 
		<a href="./memberOrder">주문 내역</a> ㅣ 
		<a href="#">쿠폰함</a> ㅣ 
		<a href="./memberInquirly">1:1 문의</a> ㅣ 
		<a href="./memberCheck">정보 수정</a> 
		</li>
	</ul>
	<div class="myLevel">
		<div class="myCheck">개인 정보 입력 안내문</div>
		<div></div>
		<div class="myCheck2">회원정보를 정확히 기입하셔야 주문이나 이벤트에 대한 불이익이 없습니다.</div>
	</div>
	
	
		<form action="./memberUpdate" method="post">
		<div class="container">
		
			<div>
			<label for="name">이름 </label>
			<input type="text" name="member_name" value="${member.member_name}" readonly="readonly" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
			<label for="name">아이디 </label>
		 	<input type="text" name="member_id" value="${member.member_id}" readonly="readonly" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
			<label for="name">현재 비밀번호 </label>
			<input type="password" id="pw" value="${member.member_pw}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div></div>
			<label for="name">새 비밀번호 </label>
			<input type="password" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
			<label for="name">새 비밀번호 확인 </label>
			<input type="password" name="member_pw" id="pw2" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
			<label for="name">생년월일 </label>
			<input type="date" name="member_date" value="${member.member_date}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
			<label for="name">휴대전화 </label>
			<input type="text" name="member_phone" value="${member.member_phone}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
			<label for="name">이메일 </label>
			<input type="email" name="member_email" value="${member.member_email}" style="text-align:center; width:500px; height:42px;">
			</div>
			
			<div>
				<label for="name">정보수신동의 </label>
				<label><input type="checkbox" value=1 id="check4" class="chk" name="member_msg_agg">문자 메세지(선택)</label><br>
				<label><input type="checkbox" value=1 id="check5" class="chk" name="member_email_agg">이메일(선택)</label><br>
				<label><input type="checkbox" value=1 id="check6" class="chk" name="member_post_agg">DM 우편(최근 배달주소로 배송)(선택)</label><br>
			</div>
		
			<div>
				<label for="name">개인정보 유효기간 선택 </label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=1>1년</label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=3>3년</label>
				<label class="radio-inline"><input type="radio" name="member_pi_date" value=5>5년</label>
			</div>

	<input type="submit" value="수정하기" id="btnUpdate" class="btn btn-default">
	<a href="./memberDelete" class="btn btn-default">회원탈퇴</a>
	
	</div>
	</form>
	
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
