<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#order_main{
		margin: 0 auto;
		width: 80%;
		height: 2550px;
		background-color: yellow;
	}
	
	#order_header{
		
		width: 100%;
		height: 35px;
		background-color: white;
		position: relative;
   		 margin-top: 50px;
	}
	
	#page_title{
		font-size: 32px;
    	color: #111;
    	font-weight: 400;
	
	}
	
	.depth-area{
	    position: absolute;
    	right: 0;
    	top: 16px;
	
	
	}	
	.depth-area li{
		display: inline-block;
    	font-size: 13px;
    	color: #888888;

	
	}
	
</style>
<c:import url="../template/bootstrap.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<div id="order_main">
			<div id="order_header">
				<h2 id="page_title">결제하기</h2>
				<div class="depth-area">
					<ol>
						<li><a href="#">홈</a></li>
						<li><a href="#">장바구니</a></li>
						<li><strong>결제하기</strong></li>					
					</ol>		
				</div>
			</div>		
		</div>		
	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>