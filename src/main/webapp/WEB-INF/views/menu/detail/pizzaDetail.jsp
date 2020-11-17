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
<script type="text/javascript">
 






</script>
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
						<input type="radio" value="L" name="item_size" class="size-checkbox" id="size_l" checked="checked" hidden="hidden"/>
						<label for="size_l" class="btn-size-option checked-btn" value="${pizzaDTO.pizza_price_l}">L ${pizzaDTO.pizza_price_l}원</label>
					</div>
					<div class="btn-wrap">
						<input type="radio" value="M" name="item_size" class="size-checkbox" id="size_m" hidden="hidden"/>
						<label for="size_m" class="btn-size-option" value="${pizzaDTO.pizza_price_m}">M ${pizzaDTO.pizza_price_m}원</label>
					</div>				
				</form>
			
			</div>	
			
	<script type="text/javascript">	
		// default setting for size option: Large
		
		
		$(".btn-size-option").click(function(){
			if($(this).prev().attr("checked") != "checked"){
				$(".size-checkbox").attr("checked", false)
				$(this).prev().attr("checked", "checked")
				$(".btn-size-option").toggleClass("checked-btn")	
				$("#size-option").text($(this).prev().val())
				$("#pizza-price").text($(this).attr("value"))
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
						<div class="dough-item-wrap">
							<input type="radio" name="dough_id" value="${dto.dough_id}" class="dough-checkbox"/>
							
							<label class="dough-info">
								<span class="dough-info-name" value="${dto.item_name}"> ${dto.item_name}</span>							
									<c:if test="${dto.item_price > 0}">
										<em class="dough-info-price" value="${dto.item_price}">+${dto.item_price}원</em>
									</c:if>		
							</label>							
						</div>
					</c:forEach>
				</form>				
			</div>
<script type="text/javascript">
	// set the first item as default dough
	$(".dough-item-wrap:eq(0)").children(".dough-checkbox").attr("checked", "checked")
	$(".dough-item-wrap:eq(0)").addClass("checked")
	var defaultName = $(".dough-item-wrap:eq(0)").find(".dough-info-name").attr("value")
	var defaultPrice = $(".dough-item-wrap:eq(0)").find(".dough-info-price").attr("value")
	$(document).ready(function(){
		changeDoughOptionOnCart(defaultName, defaultPrice)
	})
	
	
	$(".dough-checkbox").click(function(){
		$(".dough-checkbox").attr("checked", false)
		$(this).attr("checked", "checked")
		$(".dough-item-wrap").removeClass("checked")
		$(this).parent().addClass("checked")
		// add dough to cart
		var name = $(this).next().find(".dough-info-name").attr("value")
		var price = $(this).next().find(".dough-info-price").attr("value")
		if(price == null){
			price = 0
		}
		changeDoughOptionOnCart(name, price)
	})
	
	// set dough price tag on the cart if price exists
	function changeDoughOptionOnCart(name, price){
		$("#dough-option-name").text(name)
		if(price > 0){
			$("#dough-option-price").text("(+"+price+"원)")
		}else{
			$("#dough-option-price").text("")
		}
	}
	
</script>		
		</div>
		<div class="option-box" id="quantity-option-wrap">
			<div class="option-title-wrap">
				<p>수량 선택</p>
			</div>
				<div class="input-group">
					<span class="input-group-btn">
						<button type="button" class="btn btn-default" min="1" id="pizza-quantity-btn-minus" disabled>-</button>
					</span> 
					<input type="text" class="form-control quantity-input" value="1" id="pizza-quantity-option" disabled /> 
					<span class="input-group-btn">
						<button type="button" class="btn btn-default" id="pizza-quantity-btn-plus">+</button>
					</span>
				</div>

			</div>
<script>
	// 나중에 꼭 증감 버튼 클릭 이벤트로 바꿔주기!!! 
	$("#pizza-quantity-btn-minus").click(function() {
		var quantity = $("#pizza-quantity-option").val()	
		if(quantity <= parseInt($(this).attr("min"))+1){
			$(this).attr("disabled", true)
		}
		$("#pizza-quantity-option").val(quantity-1)
		$("#pizza-quantity").text($("#pizza-quantity-option").val())

	})
	
	$("#pizza-quantity-btn-plus").click(function() {
		var quantity = $("#pizza-quantity-option").val()
		$("#pizza-quantity-btn-minus").attr("disabled", false)			
		$("#pizza-quantity-option").val(parseInt(quantity)+1)	
		$("#pizza-quantity").text($("#pizza-quantity-option").val())

	})	
</script>		
		
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
					<div id="main" class="tab-pane fade in active option-list">
						<ul>
							<c:forEach items="${main}" var="dto">
							
								<li class="option-item row">
									<div class="option-item-image-wrap col-sm-3">
										<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
									</div>
									<div class="option-item-content col-sm-5">
										<p>${dto.item_name}</p>
										<p>${dto.item_price}</p>
									</div>
									<div class="option-item-quantity col-sm-4">
								<!-- quantity button -->
										<div class="input-group">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default btn-minus" min="0" disabled>-</button>
											</span>
											<input type="text" class="form-control quantity-input" value="0" disabled/>
											<input type="hidden" name="item-name-data" value="${dto.item_name }">
											<input type="hidden" name="item-price-data" value="${dto.item_price }">
											<input type="hidden" name="item-id-data" value="${dto.item_id }">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default btn-plus">+</button>
											</span>	
										</div>
										
										
									</div>
													
								</li>
							</c:forEach>
						</ul>
					</div>								
					
					<div id="cheese" class="tab-pane fade option-list">
						<ul>
							<c:forEach items="${cheese}" var="dto">
							
								<li class="option-item row">
									<div class="option-item-image-wrap col-sm-3">
										<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
									</div>
									<div class="option-item-content col-sm-5">
										<p>${dto.item_name}</p>
										<p>${dto.item_price}</p>
									</div>
									<div class="option-item-quantity col-sm-4">
								<!-- quantity button -->
										<div class="input-group">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default btn-minus" min="0" disabled>-</button>
											</span>
											<input type="text" class="form-control quantity-input" value="0" disabled/>
											<input type="hidden" name="item-name-data" value="${dto.item_name }">
											<input type="hidden" name="item-price-data" value="${dto.item_price }">
											<input type="hidden" name="item-id-data" value="${dto.item_id }">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default btn-plus">+</button>
											</span>	
										</div>
										
										
									</div>
													
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="after" class="tab-pane fade option-list">
						<ul>
							<c:forEach items="${after}" var="dto">
							
								<li class="option-item row">
									<div class="option-item-image-wrap col-sm-3">
										<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
									</div>
									<div class="option-item-content col-sm-5">
										<p>${dto.item_name}</p>
										<p>${dto.item_price}</p>
									</div>
									<div class="option-item-quantity col-sm-4">
								<!-- quantity button -->
										<div class="input-group">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default btn-minus" min="0" disabled>-</button>
											</span>
											<input type="text" class="form-control quantity-input" value="0" disabled/>
											<input type="hidden" name="item-name-data" value="${dto.item_name }">
											<input type="hidden" name="item-price-data" value="${dto.item_price }">
											<input type="hidden" name="item-id-data" value="${dto.item_id }">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default btn-plus">+</button>
											</span>	
										</div>										
									</div>												
								</li>
							</c:forEach>
						</ul>
					</div>					
				</div>
			</div>
		</div>
			<div class="option-box" id="sidedish-option-wrap">
			
				<div class="option-title-wrap">
					<p>사이드디시</p>
				</div>
				<div class="option-list">
						<ul>
						<c:forEach items="${sideDishList}" var="dto">
	
							<li class="option-item row">
								<div class="option-item-image-wrap col-sm-3">
									<img src="/t1/resources/images/menu/sidedish/${dto.item_image}"
										alt="${dto.item_name}" class="option-item-image">
								</div>
								<div class="option-item-content col-sm-5">
									<p>${dto.item_name}</p>
									<p>${dto.item_price}</p>
								</div>
								<div class="option-item-quantity col-sm-4">
									<!-- quantity button -->
									<div class="input-group">
										<span class="input-group-btn">
											<button type="button" class="btn btn-default btn-minus"
												min="0" disabled>-</button>
										</span> <input type="text" class="form-control quantity-input"
											value="0" disabled /> <input type="hidden"
											name="item-name-data" value="${dto.item_name }"> <input
											type="hidden" name="item-price-data"
											value="${dto.item_price }"> <input type="hidden"
											name="item-id-data" value="${dto.item_id }"> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default btn-plus">+</button>
										</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>	
				</div>			
			</div>
			<div class="option-box" id="etc-option-wrap">		
				<div class="option-title-wrap">
					<p>음료&amp;기타</p>
				</div>
				<div class="option-list">
						<ul>
						<c:forEach items="${etcList}" var="dto">
	
							<li class="option-item row">
								<div class="option-item-image-wrap col-sm-3">
									<img src="/t1/resources/images/menu/etc/${dto.item_image}"
										alt="${dto.item_name}" class="option-item-image">
								</div>
								<div class="option-item-content col-sm-5">
									<p>${dto.item_name}</p>
									<p>${dto.item_price}</p>
								</div>
								<div class="option-item-quantity col-sm-4">
									<!-- quantity button -->
									<div class="input-group">
										<span class="input-group-btn">
											<button type="button" class="btn btn-default btn-minus"
												min="0" disabled>-</button>
										</span> <input type="text" class="form-control quantity-input"
											value="0" disabled /> <input type="hidden"
											name="item-name-data" value="${dto.item_name }"> <input
											type="hidden" name="item-price-data"
											value="${dto.item_price }"> <input type="hidden"
											name="item-id-data" value="${dto.item_id }"> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default btn-plus">+</button>
										</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>	
				</div>			
			</div>
		</div>
</div>	


<script type="text/javascript">
	
	$(".btn-minus").click(function(){
		var quantity = $(this).parent().siblings(".quantity-input").val()	
		if(quantity <= parseInt($(this).attr("min"))+1){
			$(this).attr("disabled", true)
		}
		$(this).parent().siblings(".quantity-input").val(quantity-1)
	})
	
	
	$(".btn-plus").click(function(){
		var quantity = $(this).parent().siblings(".quantity-input").val()
		$(this).parent().parent().find(".btn-minus").attr("disabled", false)			
		$(this).parent().siblings(".quantity-input").val(parseInt(quantity)+1)			
	})
</script>	


<nav class="navbar navbar-fixed-bottom" id="item-cart-container">
	<div class="item-subtotal-container">
	<c:if test="${category == 'pizza'}">
		<p class="subtotal-title">피자</p>
		<p class="subtotal-item">${pizzaDTO.item_name}(
		<!-- pizza-price: 피자 전체 가격 소계 역할 함 -->
			<span id="pizza-price">${pizzaDTO.pizza_price_l }</span>
			원) x 
			<span id="pizza-quantity" value="1">1</span>
		</p>
		<div>
			<p class="subtotal-item">- 도우/사이즈:
				<span id="dough-option">
					<span id="dough-option-name"></span>
					<span id="dough-option-price"></span>
				</span>
				/
				<span id="size-option">L</span>			
			</p>
		</div>
		<div id="topping-option">		
		</div>
	</c:if>	
	</div>
	
	<div class="item-subtotal-container">
		<p class="subtotal-title">사이드디시</p>
	</div>
	<div class="item-subtotal-container">
		<p class="subtotal-title">음료 &amp; 기타</p>
	</div>
	<div class="item-total-container">
		<span class="subtotal-title">총 금액</span>
		<span></span>
		<span>원</span>
		<div>
			<div class="btn-checkout" id="btn-order-now">바로 주문</div>
			<div class="btn-checkout" id="btn-to-cart">장바구니 담기</div>
		</div>
	</div>
</nav>
<script type="text/javascript">
	$("#btn-order-now").onclick(function(){
		
	})
	
	$("#btn-to-cart").onclick(function(){
		
	})

</script>



</body>
</html>