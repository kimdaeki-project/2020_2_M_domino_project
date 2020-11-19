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
 		.item-group-box{
 			border: 2px solid black;
 			margin: 20px;
 		}
 		.pizza-option-box{
 			border: 1px solid red;
 			margin-left: 30px;
 		}
    </style>
  
</head>
<body>

<c:import url="../template/header.jsp"></c:import>
<div>	
	<div class="container">
		<h1>장바구니 테스트 데이터 확인용</h1>
		<div>
			<h2>pizza + associated item List</h2>	
				<c:forEach items="${pizzaGroupList}" var="pizzaGroup">				
					<div class="item-group-box">
						<c:forEach items="${pizzaGroup}" var="dto">
							<div class="pizza-option-box">
							 	<span class="item-data">장바구니 그룹 id: ${dto.cart_group_id}</span>	
								<span class="item-data">이름: ${dto.item_name}</span>	
								<span class="item-data">카테고리: ${dto.item_category}</span>
								<span class="item-data">${dto.item_price}원</span>
								<span class="item-data">수량: ${dto.cart_quantity}</span>	
								<c:if test="${dto.item_size != null}">
									<span class="item-data">사이즈: ${dto.item_size}</span>	
								</c:if>
											
							</div>														
						</c:forEach>
			
					</div>			
				</c:forEach>
			<h2>피자와 무관한 제품들(사이드디시 + 음료&amp;기타)</h2>		
					<c:forEach items="${itemList}" var="dto">
						<div class="item-group-box">
							<span class="item-data">장바구니 그룹 id: ${dto.cart_group_id}</span>	
							<span class="item-data">이름: ${dto.item_name}</span>	
							<span class="item-data">카테고리: ${dto.item_category}</span>
							<span class="item-data">${dto.item_price}원</span>
							<span class="item-data">수량: ${dto.cart_quantity}</span>	
							<span class="item-data">사이즈: ${dto.item_size}</span>						
						</div>														
					</c:forEach>						
		</div>

	
	</div>
</div>	
	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript">	
	
	</script>


</body>
</html>