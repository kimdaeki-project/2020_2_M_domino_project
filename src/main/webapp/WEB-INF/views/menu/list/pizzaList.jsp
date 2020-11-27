<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Insert title here</title>
    <meta charset="utf-8">
    <c:import url="../../template/bootstrap.jsp"></c:import>
    <link href ="/t1/resources/css/common/default.css" rel="stylesheet">
    <link href ="/t1/resources/css/common/board.css" rel="stylesheet">
    <link href ="/t1/resources/css/menu/list.css" rel="stylesheet">
    <script src="/t1/resources/js/header.js"></script>
  
</head>
<body>

<c:import url="../../template/header.jsp"></c:import>
<div class="container">
	<div class="order-title-wrap">
		<h2 class="order-title">메뉴</h2>
			<div class="depth-area">
			<!-- 브레드크럼 -->
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/menu/list/pizzaList">메뉴</a></li>
					
						<c:choose>
							<c:when test="${category == 'pizza'}">
								<li><strong>피자</strong></li>
							</c:when>
							
							<c:when test="${category == 'sideDish'}">
								<li><strong>사이드디시</strong></li>
							</c:when>
							
							<c:otherwise>
								<li><strong>음료&amp;기타</strong></li>
							</c:otherwise>
							
						</c:choose>	
						
					</ol>
				</div>
			</div>
			<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
				<li>
					<a href="${pageContext.request.contextPath}/menu/list/pizzaList">피자</a> ㅣ 
					<a href="${pageContext.request.contextPath}/menu/list/sideDishList">사이드디시</a> | 
					<a href="${pageContext.request.contextPath}/menu/list/etcList">음료&amp;기타</a>
				</li>
			</ul>
				
	<!-- premium type pizza -->
	<div class="container" id="premium-pizza-container">	
	<h3 class="title-pizza-type">프리미엄</h3>
		<c:forEach items="${premium}" var="dto" varStatus="loop">
			<c:if test="${loop.index % 4 == 0}">
				<div class="row justify-content-start">
			</c:if>
			<div class="col-sm-3">
				<div class="item-thumbnail-container">
					<a href="../detail/pizzaDetail?pizza_id=${dto.pizza_id}">
						<img src="/t1/resources/images/menu/${category}/${dto.item_image}" alt="${dto.item_name}" class="item-thumbnail">
					</a>			
				</div>
				<div class="name-container">
					<span>${dto.item_name}</span>
					<c:if test="${dto.item_tag != null}">
						<span class="label label-special">${dto.item_tag}</span>
					</c:if>
				</div>				
				<div class="price-container">
					<span>
						<span class="size-text">L</span>
						<span class="price-text">${dto.pizza_price_l }원~</span>
					</span>
					<span>
						<span class="size-text">M</span>
						<span class="price-text">${dto.pizza_price_m }원~</span>
					</span>					 							
				</div>
				<div class="hashtag-container">
					<p>${dto.pizza_hashtag}</p>
				</div>				
			</div>
			<c:choose>
				<c:when test="${loop.index % 4 == 3}">
					</div>
				</c:when>
				<c:when test="${loop.last }">
					</div>
				</c:when>				
			</c:choose>
		</c:forEach>
	</div>
	
	<div class="container" id="half-pizza-container">	
	<h3 class="title-pizza-type">하프앤하프 시그니처</h3>
		<c:forEach items="${half}" var="dto" varStatus="loop">
			<c:if test="${loop.index % 4 == 0}">
				<div class="row justify-content-start">
			</c:if>
			<div class="col-sm-3">
				<div class="item-thumbnail-container">
					<a href="../detail/pizzaDetail?pizza_id=${dto.pizza_id}">
						<img src="/t1/resources/images/menu/${category}/${dto.item_image}" alt="${dto.item_name}" class="item-thumbnail">
					</a>			
				</div>
				<div class="name-container">
					<span>${dto.item_name}</span>
					<c:if test="${dto.item_tag != null}">
						<span class="label label-special">${dto.item_tag}</span>
					</c:if>
				</div>				
				<div class="price-container">
					<span>
						<span class="size-text">L</span>
						<span class="price-text">${dto.pizza_price_l }원~</span>
					</span>
					<span>
						<span class="size-text">M</span>
						<span class="price-text">${dto.pizza_price_m }원~</span>
					</span>					 							
				</div>
				<div class="hashtag-container">
					<p>${dto.pizza_hashtag}</p>
				</div>				
			</div>
			<c:choose>
				<c:when test="${loop.index % 4 == 3}">
					</div>
				</c:when>
				<c:when test="${loop.last }">
					</div>
				</c:when>				
			</c:choose>
		</c:forEach>
	</div>	
	
	<div class="container" id="classic-pizza-container">	
	<h3 class="title-pizza-type">클래식</h3>
		<c:forEach items="${classic}" var="dto" varStatus="loop">
			<c:if test="${loop.index % 4 == 0}">
				<div class="row justify-content-start">
			</c:if>
			<div class="col-sm-3">
				<div class="item-thumbnail-container">
					<a href="../detail/pizzaDetail?pizza_id=${dto.pizza_id}">
						<img src="/t1/resources/images/menu/${category}/${dto.item_image}" alt="${dto.item_name}" class="item-thumbnail">
					</a>			
				</div>
				<div class="name-container">
					<span>${dto.item_name}</span>
					<c:if test="${dto.item_tag != null}">
						<span class="label label-special">${dto.item_tag}</span>
					</c:if>
				</div>				
				<div class="price-container">
					<span>
						<span class="size-text">L</span>
						<span class="price-text">${dto.pizza_price_l }원~</span>
					</span>
					<span>
						<span class="size-text">M</span>
						<span class="price-text">${dto.pizza_price_m }원~</span>
					</span>						 							
				</div>
				<div class="hashtag-container">
					<p>${dto.pizza_hashtag}</p>
				</div>				
			</div>
			<c:choose>
				<c:when test="${loop.index % 4 == 3}">
					</div>
				</c:when>
				<c:when test="${loop.last }">
					</div>
				</c:when>				
			</c:choose>
		</c:forEach>
	</div>
	
</div>	
	<c:import url="../../template/footer.jsp"></c:import>
	<script type="text/javascript">	
	
	</script>


</body>
</html>