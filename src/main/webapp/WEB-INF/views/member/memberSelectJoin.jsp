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
		.select_join{
			padding: 100px 0;
		}
		
		#select_join_text{
			text-align: center;
			margin-bottom: 30px;
		}
	
		#default_join{
			margin: 0 auto;
			text-align: center;
			width: 300px;
			height: 50px;
			background-color: #ff143c;
			margin-bottom: 10px;
		}
		
		#default_join a{
			font-weight: bold;
			font-size: 18px;
			color: white;
			line-height: 50px;
		}
	
	</style>

</head>
<body>
	<div class="container select_join">
		
		<div id="select_join_text">
			<h4>회원가입 후 <strong>다양한 혜택</strong>을 누리세요!</h4>
		</div>
		
		<div id="default_join">
			<a href="${pageContext.request.contextPath}/member/memberJoin">
				<span class="glyphicon"></span>회원가입
			</a>
		</div>
     
         <!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center">
			<a href="${url}">
				<img width="300" height="50" src="${pageContext.request.contextPath}/resources/images/common/naverJoin.JPG">
			</a>
		</div>		
	</div>
	
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>