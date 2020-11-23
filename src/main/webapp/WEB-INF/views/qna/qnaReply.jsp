<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <title>Dominos_t1</title>
 <c:import url="../template/bootstrap.jsp"></c:import>
 <link href ="../resources/css/common/default.css" rel="stylesheet">
 <script src="../resources/js/header.js"></script>
 <link href ="../resources/css/common/board.css" rel="stylesheet">
 <link href ="../resources/css/common/qna.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h4>메일 보내기</h4>
  <form action="${pageContext.request.contextPath}/mail/mailSending" method="post">
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" size="120" style="width:100%" placeholder="상대의 이메일" class="form-control" >
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control"></textarea>
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</div>
</body>
</html> 