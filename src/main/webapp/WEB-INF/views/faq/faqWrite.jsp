<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h2>faq Write Form</h2>
		  	<form action="./faqWrite" method="post">
		  
		    <div class="form-group">
		      <label for="title">Title:</label>
		      <input type="text" class="form-control" id="title" placeholder="Enter Title" name="board_title">
		    </div>
		    
		    <div class="form-group">
		      <label for="writer">Writer:</label>
		      <input type="text" class="form-control" id="writer" placeholder="Enter Writer" name="board_writer">
		    </div> 
		    
		    <div class="form-group">
		      <label for="contents">Contents:</label>
		      <textarea class="form-control" rows="20" cols="30" id="contents" name="board_contents"></textarea>
		    </div>
	
		    <button type="submit" class="btn btn-default form-control">faqWrite</button>
		  	</form>
			
		</div>
		 	<c:import url="../template/footer.jsp"></c:import>
			
</body>
</html>