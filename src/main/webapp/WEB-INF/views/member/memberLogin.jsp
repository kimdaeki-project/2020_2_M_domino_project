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
  <script src="../resources/js/header.js"></script>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>

	
	<div class="container">
	<form action="">
	
	<div>
		<input type="text" name="member_id">
	</div>	
	
	<div>
		<input type="password" name="member_pw">
	</div>	
	<button>로그인</button>
	</form>
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>