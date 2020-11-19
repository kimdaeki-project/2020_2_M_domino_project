<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Insert title here</title>
    <meta charset="utf-8">
    <c:import url="../template/bootstrap.jsp"></c:import>
    <link href ="/t1/resources/css/common/default.css" rel="stylesheet">
    <script src="/t1/resources/js/header.js"></script>
    <style type="text/css">
 		tr{
 			border: 1px solid black;
 		}
 		td{
 			padding: 1px;
 			margin: auto 10px;
 		}
    </style>
  
</head>
<body>

<c:import url="../template/header.jsp"></c:import>
<div>	
	<div class="container">
		<h1>테스트 데이터 확인용</h1>
		

	
	</div>

	<div class="container">
		<h1>장바구니</h1>
		<table>
			<tr>
				<td>cart item id</td>
				<td>member num</td>
				<td>item id</td>
				<td>cart group id</td>
				<td>cart quantity</td>
				<td>item size</td>
			</tr>		
			<c:forEach items="${cartList}" var="dto">
			<tr>
				<td>${dto.cart_item_id}</td>
				<td>${dto.member_num}</td>
				<td>${dto.item_id}</td>
				<td>${dto.cart_group_id}</td>
				<td>${dto.cart_quantity}</td>
				<td>${dto.item_size}</td>				
			</tr>			
			</c:forEach>	
		</table>
	</div>
</div>	
	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript">	
	
	</script>


</body>
</html>