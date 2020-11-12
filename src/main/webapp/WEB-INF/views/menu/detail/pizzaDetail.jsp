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
    <link href ="/t1/resources/css/menu/detail.css" rel="stylesheet">
    <script src="/t1/resources/js/header.js"></script>
    <script src="/t1/resources/js/menu/detail.js"></script>

</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<div class="container">

	<div class="col-sm-6 item-desc-container">
		<img src="/t1/resources/images/menu/pizza/${pizzaDTO.item_image}" alt="${pizzaDTO.item_name}" class="main-item-image">	
	</div>
	<div class="col-sm-6 item-option-container">
		<div class="title-wrap">
			<h2>${pizzaDTO.item_name }</h2>
			<span>${pizzaDTO.pizza_hashtag }</span>	
			<p>영양성분 및 알레르기 유발성분 ></p>	
		</div>
		<div class="option-box" id="size-option-wrap">
			<div class="option-title-wrap">
				<p>사이즈 선택</p>
			</div>
			<div>
				<form id="frm-size-option">
					<div class="btn-wrap">
						<input type="radio" value="l" name="item_size" class="size-checkbox" id="size_l" checked/>
						<label for="size_l" class="btn-size-option">L ${pizzaDTO.pizza_price_l}원</label>
					</div>
					<div class="btn-wrap">
						<input type="radio" value="m" name="item_size" class="size-checkbox" id="size_m"/>
						<label for="size_m" class="btn-size-option">M ${pizzaDTO.pizza_price_m}원</label>
					</div>				
				</form>
			
			</div>	
			
	<script type="text/javascript">	
		$(".btn-size-option").click(function(){
			if($(this).prev().attr("checked") != "checked"){
				$(this).prev().attr("checked", "checked")
							
			}
			if(!$(this).hasClass("checked")){
				$(this).addClass("checked")	
			}
			
		})
	</script>			
				
		</div>
		<div class="option-box" id="dough-option-wrap">
			<div class="option-title-wrap">
				<p>도우 선택</p>
			</div>			
			<div>
				<form id="frm-dough-option">
					<!-- default checked item: first item on the list -->
					<c:forEach items="${doughList}" var="dto">
						<div>
							<input type="radio" name="dough_id" value="${dto.dough_id}"/>
							<label class="dough-checkbox"></label>
							<label class="dough-info">
								<span>${dto.item_name}</span>							
									<c:if test="${dto.item_price > 0}">
										<em class="dough-option-price">+${dto.item_price}원</em>
									</c:if>		
							</label>							
						</div>
					</c:forEach>
				</form>				
			</div>
		
		</div>
		<div class="option-box" id="topping-option-wrap">
			<div class="option-title-wrap">
				<p>토핑 추가</p>
			</div>
			<div>
				<p>*토핑 추가는 피자 한 판당 5개까지 추가 가능</p>
				<ul class="nav nav-pills">
					<li class="col-sm-4 topping-tab active"><a data-toggle="tab" href="#main">메인</a></li>
					<li class="col-sm-4 topping-tab"><a data-toggle="tab" href="#cheese">치즈</a></li>
					<li class="col-sm-4 topping-tab"><a data-toggle="tab" href="#after">애프터</a></li>
				</ul>
				
				<div class="tab-content">
					<div id="main" class="tab-pane fade in active topping-list">
						<ul>
							<c:forEach items="${main}" var="dto">
								<li class="option-item">
									<div class="option-item-image-wrap col-sm-3">
										<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
									</div>
									<div class="option-item-content col-sm-9">
										<div class="option-item-info">
											<p>${dto.item_name}</p>
											<p>${dto.item_price}</p>
										</div>
										<div class="option-item-quantity">
											
										</div>
									</div>
									
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="cheese" class="tab-pane fade topping-list">
						<h3>cheese topping here</h3>
						<ul>
							<li>
								cheese 
							</li>
							<li>
								whooa
							</li>
						</ul>
					</div>
					<div id="after" class="tab-pane fade topping-list">
						<h3>after topping here</h3>
						<ul>
							<li>
								파마산  
							</li>
							<li>
								콰트로 치즈 퐁듀~~ 
							</li>
						</ul>
					</div>					
				</div>
			</div>
		</div>
		<div class="option-box" id="sidedish-option-wrap">
			<h1>aaaaaa</h1>
		</div>
	</div>
</div>	
<nav class="navbar navbar-fixed-bottom" id="item-cart-container">
	<div class="container">
		<h1>pizza time!!</h1>
	</div>
	<div class="container">
	</div>
	<div class="container">
	</div>
	<div class="container">
	</div>
</nav>




</body>
</html>