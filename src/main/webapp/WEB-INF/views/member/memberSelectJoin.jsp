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
		<div><a href="${pageContext.request.contextPath}/member/memberJoin"><span class="glyphicon"></span>회원가입</a></div>
     
         <!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center">
			<a href="${url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
			</a>
		</div>		
	</div>
	
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>