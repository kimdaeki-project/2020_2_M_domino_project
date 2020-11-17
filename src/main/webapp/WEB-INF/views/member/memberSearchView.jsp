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
				<a href="#">비밀번호 찾기</a> 
			</li>
		</ul>

		<h3>고객님의 정보와 일치하는 아이디 목록입니다.</h3><br>
		<h3>아이디 : ${dto.member_id}</h3><h3>가입일 : ${dto.member_date}</h3><br>
		<button type="button" class="btn btn-info btn-lg" id="logBtn">로그인</button>
			
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#logBtn").click(function() {
		location.href = "./memberLogin"
	})
</script>
</html>