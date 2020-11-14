<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${news} SelectPage</h3>
  	 <h3>${dto.board_num}</h3>
 	 <h3>Title : ${dto.board_title}</h3>
 	 <h3>Writer: ${dto.board_writer}</h3>
 	 <h3>Contents: ${dto.board_contents}</h3>
 	
 	
 	 <div>
 	 <c:forEach items="${dto.boardFileDTOs}" var="file">
 	 	<a href="./fileDown?file_Name=${file.file_Name}&ori_Name=${file.ori_Name}">${file.ori_Name}</a>
 	 	<hr>
 	 </c:forEach>
 	</div>
</body>
</html>