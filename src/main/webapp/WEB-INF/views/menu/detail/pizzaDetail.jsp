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
    <link href="/t1/resources/css/common/shared.css" rel="stylesheet">
    <script src="/t1/resources/js/header.js"></script>
    <script src="/t1/resources/js/menu/detail.js"></script>

</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<div class="container" id="pdContainer">
<script type="text/javascript">
	// item_id, item_name, cart_quantity, item_price, [item_size]
 	var pizzaCart = ["${pizzaDTO.item_id}", "${pizzaDTO.item_name}", "1", "${pizzaDTO.pizza_price_l}", "L"]
	var doughCart = ["${doughList[0].item_id}","${doughList[0].dough_name_short}","1", "${doughList[0].item_price}"]
	var toppingCart = []
	var sideDishCart = []
	var etcCart = []
	
	var doughCount = 0
	var totalPrice = updateTotalPrice()

	
	function updateTotalPrice(){
		var toppingSum = getArrayPriceSum(toppingCart)
		var pizzaSum = pizzaCart[2]*(parseInt(pizzaCart[3]) + parseInt(doughCart[3]) + parseInt(toppingSum))
		var sideDishSum = getArrayPriceSum(sideDishCart)
		var etcSum = getArrayPriceSum(etcCart)
		var tot = pizzaSum + sideDishSum + etcSum
		$(document).ready(function(){
			$("#total-price").text(tot)
		})
		return tot
	}
	
	function updateCartArray(input, cart){
		var id = input.siblings(".item-id-data").val()
		var quantity = input.val()
		// 이미 담긴 제품은 수량만 변경 
		for(i=0; i < cart.length; i++){
			if(cart[i][0] == id){
				cart[i][2] = quantity
				return null
			}
		}
		// 처음 담긴 제품은 배열에 항목 추가 
		var name = input.siblings(".item-name-data").val()		
		var price = input.siblings(".item-price-data").val()	
		cart.push([id, name, quantity, price])
	}
	
	
	function updateCartBox(cartBox, cartArray){
		cartBox.empty()
		for(i=0; i < cartArray.length; i++){
			var item = cartArray[i]
			var name = item[1]
			var quantity = item[2]
			if(quantity < 1){
				continue
			}
			var price = item[3]
			cartBox.append('<p class="box-item">- '+name+'(+'+price+'원)x'+quantity+'</p>')
		}
	}
	
	function getCartArray(category){
		if(["main","cheese","after"].includes(category)){
			return toppingCart
		}else if(category == "side-dish-list"){
			return sideDishCart
		}else{
			return etcCart
		}
	}
	
	function getCartBoxId(category){
		if(["main","cheese","after"].includes(category)){
			return "topping-cart-box"
		}else if(category == "side-dish-list"){
			return "side-dish-cart-box"
		}else{
			return "etc-cart-box"
		}		
	}
	
	function getArrayPriceSum(arr){
		var tot = 0
		for(i=0; i < arr.length; i++){
			tot += arr[i][3] * arr[i][2]
		}
		return tot
	}
</script>
	<div class="col-sm-6 item-desc-container">
		<div>
			<img src="/t1/resources/images/menu/pizza/${pizzaDTO.item_image}" alt="${pizzaDTO.item_name}" class="main-item-image">	
		</div>
		
		<div class="toppings-info-wrap">
			<div class="toppings-info1">
				<h4>메인 토핑</h4>
				<div>${pizzaDTO.pizza_toppings}</div>			
			</div>
			<div class="toppings-info2">
				<h4>토핑 원산지</h4>
				<div>${pizzaDTO.pizza_origin}</div>			
			</div>
		</div>
	</div>
	<div class="col-sm-6 item-option-container">
		<div class="title-wrap">
			<p style="font-weight: bold; font-size: 30px;">${pizzaDTO.item_name}<p>
			<span>${pizzaDTO.pizza_hashtag }</span>	
			<p>영양성분 및 알레르기 유발성분 ></p>	
		</div>
		<div class="option-box" id="size-option-wrap">
			<div class="option-title-wrap">
				<p class="option-text">사이즈 선택</p>
			</div>
			<div style="text-align: center;">
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
				// update pizzaCart
				pizzaCart[3] = $(this).attr("value") //price
				pizzaCart[4] = $(this).prev().val() //size
				// update cart's pizza size info
				$("#pizza-price").text(pizzaCart[3])
				$("#size-option").text(pizzaCart[4])
			}
			totalPrice = updateTotalPrice()
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
							<input type="radio" name="dough-id" value="${dto.item_id}" class="dough-checkbox"/>
							<input type="hidden" class="dough-name-short" value="${dto.dough_name_short}"/>
							<input type="hidden" class="dough-price" value="${dto.item_price}"/>
							<label class="dough-info">
								<span> ${dto.item_name}</span>							
									<c:if test="${dto.item_price > 0}">
										<em class="dough-info-price">+${dto.item_price}원</em>
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
	var defaultName = $(".dough-item-wrap:eq(0)").find(".dough-name-short").val()
	var defaultPrice = $(".dough-item-wrap:eq(0)").find(".dough-price").val()
	$(document).ready(function(){
		changeDoughOptionOnCart(defaultName, defaultPrice)
	})
	
	
	$(".dough-checkbox").click(function(){
		$(".dough-checkbox").attr("checked", false)
		$(this).attr("checked", "checked")
		$(".dough-item-wrap").removeClass("checked")
		$(this).parent().addClass("checked")
		// update doughCart
		doughCart[0] = $(this).val()
		doughCart[1] = $(this).siblings(".dough-name-short").val()
		
		var price = $(this).siblings(".dough-price").val()
		if(price == null){
			price = 0
		}		
		doughCart[3] = price		
		//update cart's dough subtotal
		changeDoughOptionOnCart(doughCart[1], doughCart[3])
		//updata cart's total price
		totalPrice = updateTotalPrice()
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
				<div class="pizza-quantity-input-group input-group">
					<span class="input-group-btn">
						<button type="button" class="btn btn-quantity-controller" min="1" id="pizza-quantity-btn-minus" disabled>-</button>
					</span> 
					<input type="text" class="form-control pizza-quantity-input" value="1" id="pizza-quantity-option" style="text-align: center;" disabled/> 
					<span class="input-group-btn">
						<button type="button" class="btn btn-quantity-controller" id="pizza-quantity-btn-plus">+</button>
					</span>
				</div>

			</div>
<script>
	$("#pizza-quantity-btn-minus").click(function() {
		var quantity = $("#pizza-quantity-option").val()	
		if(quantity <= parseInt($(this).attr("min"))+1){
			$(this).attr("disabled", true)
		}		
		// update pizza input box's value
		$("#pizza-quantity-option").val(quantity-1)
		// update pizzaCart
		pizzaCart[2] = quantity-1
		// update cart's pizza quantity
		$("#pizza-quantity").text(pizzaCart[2])
		// update cart's total price
		totalPrice = updateTotalPrice()
	})
	
	$("#pizza-quantity-btn-plus").click(function() {
		var quantity = $("#pizza-quantity-option").val()
		$("#pizza-quantity-btn-minus").attr("disabled", false)	
		
		quantity = parseInt(quantity)+1
		// update pizza input box's value
		$("#pizza-quantity-option").val(quantity)	
		// update pizzaCart
		pizzaCart[2] = quantity
		// update cart's pizza quantity
		$("#pizza-quantity").text(pizzaCart[2])
		// update cart's total price
		totalPrice = updateTotalPrice()
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
				
				<div class="item-list-content tab-content">
					<div id="main" class="option-list tab-pane fade in active">
						<ul>
							<c:forEach items="${main}" var="dto">
								
								<li class="option-item row option-item-wrap">
										<div class="col-sm-12 cs12">
											<div class="option-item-image-wrap col-sm-3">
												<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
											</div>
											
											<div class="col-sm-9 cs9">
											<div class="option-item-content col-sm-6">
												<p>${dto.item_name}</p>
												<p class="item_price">${dto.item_price}</p>
											</div>
											<div class="option-item-quantity col-sm-6 cs6">
										<!-- quantity button -->
												<div class="input-group">
													<span class="input-group-btn">
														<button type="button" class="btn btn-quantity-controller btn-minus" min="0" disabled>-</button>
													</span>
													<input type="text" class="form-control quantity-input" value="0" disabled/>
													<input type="hidden" class="item-name-data" value="${dto.item_name }">
													<input type="hidden" class="item-price-data" value="${dto.item_price }">
													<input type="hidden" class="item-id-data" value="${dto.item_id }">
													<span class="input-group-btn">
														<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
													</span>	
												</div>
											</div>
										</div>
									</div>				
								</li>
							</c:forEach>
						</ul>
					</div>								
					
					<div id="cheese" class="option-list tab-pane fade ">
						<ul>
							<c:forEach items="${cheese}" var="dto">
							
								<li class="option-item row">
									<div class="col-sm-12 cs12">
										<div class="option-item-image-wrap col-sm-3">
											<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
										</div>
										
										<div class="col-sm-9 cs9">
											<div class="option-item-content col-sm-6">
												<p>${dto.item_name}</p>
												<p class="item_price">${dto.item_price}</p>
											</div>
											<div class="option-item-quantity col-sm-6 cs6">
										<!-- quantity button -->
												<div class="input-group">
													<span class="input-group-btn">
														<button type="button" class="btn btn-quantity-controller btn-minus" min="0" disabled>-</button>
													</span>
													<input type="text" class="form-control quantity-input" value="0" disabled/>
													<input type="hidden" class="item-name-data" value="${dto.item_name }">
													<input type="hidden" class="item-price-data" value="${dto.item_price }">
													<input type="hidden" class="item-id-data" value="${dto.item_id }">
													<span class="input-group-btn">
														<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
													</span>	
												</div>
												
												
											</div>
										</div>
									</div>					
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="after" class="option-list tab-pane fade">
						<ul>
							<c:forEach items="${after}" var="dto">
							
								<li class="option-item row">
									<div class="col-sm-12 cs12">
										<div class="option-item-image-wrap col-sm-3">
											<img src="/t1/resources/images/menu/topping/${dto.item_image}" alt="${dto.item_name}" class="option-item-image">
										</div>
										
										<div class="col-sm-9 cs9">
											<div class="option-item-content col-sm-6">
												<p>${dto.item_name}</p>
												<p class="item_price">${dto.item_price}</p>
											</div>
											<div class="option-item-quantity col-sm-6 cs6">
										<!-- quantity button -->
												<div class="input-group">
													<span class="input-group-btn">
														<button type="button" class="btn btn-quantity-controller btn-minus" min="0" disabled>-</button>
													</span> 
													<input type="text" class="form-control quantity-input" value="0" disabled /> 
													<input type="hidden" class="item-name-data" value="${dto.item_name }"> 
													<input type="hidden" class="item-price-data" value="${dto.item_price }"> 
													<input type="hidden" class="item-id-data" value="${dto.item_id }"> 
													<span class="input-group-btn">
														<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
													</span>
												</div>										
											</div>	
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
				<div id="side-dish-list" class="option-list item-list-content">
						<ul>
						<c:forEach items="${sideDishList}" var="dto">
	
							<li class="option-item row">
								<div class="col-sm-12 cs12">
									<div class="option-item-image-wrap col-sm-3">
										<img src="/t1/resources/images/menu/sidedish/${dto.item_image}"
											alt="${dto.item_name}" class="option-item-image">
									</div>
									
									<div class="col-sm-9 cs9">
										<div class="option-item-content col-sm-6">
											<p>${dto.item_name}</p>
											<p class="item_price">${dto.item_price}</p>
										</div>
										<div class="option-item-quantity col-sm-6 cs6">
											<!-- quantity button -->
											<div class="input-group">
												<span class="input-group-btn">
													<button type="button" class="btn btn-quantity-controller btn-minus" min="0" disabled>-</button>
												</span> 
												<input type="text" class="form-control quantity-input" value="0" disabled /> 
												<input type="hidden" class="item-name-data" value="${dto.item_name }"> 
												<input type="hidden" class="item-price-data" value="${dto.item_price }"> 
												<input type="hidden" class="item-id-data" value="${dto.item_id }"> 
												<span class="input-group-btn">
													<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
												</span>									
											</div>
										</div>
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
				<div id="etc-list" class="item-list-content option-list">
						<ul>
						<c:forEach items="${etcList}" var="dto">
	
							<li class="option-item row">
								<div class="col-sm-12 cs12">
										<div class="option-item-image-wrap col-sm-3">
											<img src="/t1/resources/images/menu/etc/${dto.item_image}"
												alt="${dto.item_name}" class="option-item-image">
										</div>
										
									<div class="col-sm-9 cs9">
										<div class="option-item-content col-sm-6">
											<p>${dto.item_name}</p>
											<p class="item_price">${dto.item_price}</p>
										</div>
										<div class="option-item-quantity col-sm-6 cs6">
											<!-- quantity button -->
											<div class="input-group">
												<span class="input-group-btn">
													<button type="button" class="btn btn-quantity-controller btn-minus" min="0" disabled>-</button>
												</span> 
												<input type="text" class="form-control quantity-input" value="0" disabled /> 
												<input type="hidden" class="item-name-data" value="${dto.item_name }"> 
												<input type="hidden" class="item-price-data" value="${dto.item_price }"> 
												<input type="hidden" class="item-id-data" value="${dto.item_id }"> 
												<span class="input-group-btn">
													<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
												</span>
											</div>
										</div>
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
		var input = $(this).parent().siblings(".quantity-input")
		var quantity = input.val()	
		if(quantity <= parseInt($(this).attr("min"))+1){
			$(this).attr("disabled", true)
		}
		quantity = quantity - 1
		input.val(quantity)
		// update item's cart array
		var category = $(this).closest(".option-list").attr("id")
		var cartArray = getCartArray(category)
		updateCartArray(input, cartArray)
		// update cart subtotal box
		var cartBox = $("#" + getCartBoxId(category))
		updateCartBox(cartBox, cartArray)
		totalPrice = updateTotalPrice()
	})
	
	
	$(".btn-plus").click(function(){
		var input = $(this).parent().siblings(".quantity-input")
		var quantity = input.val()	
		$(this).parent().parent().find(".btn-minus").attr("disabled", false)			
		input.val(parseInt(quantity)+1)		
		// update item's cart array
		var category = $(this).closest(".option-list").attr("id")
		var cartArray = getCartArray(category)
		updateCartArray(input, cartArray)
		// update cart subtotal box
		var cartBox = $("#" + getCartBoxId(category))
		updateCartBox(cartBox, cartArray)	
		totalPrice = updateTotalPrice()
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
		<div class="subtotal-box" id="topping-cart-box">		
		</div>
	</c:if>	
	</div>
	
	<div class="item-subtotal-container">
		<p class="subtotal-title">사이드디시</p>
		<div class="subtotal-box" id="side-dish-cart-box">
		
		</div>
	</div>
	<div class="item-subtotal-container">
		<p class="subtotal-title">음료&amp;기타</p>
		<div class="subtotal-box" id="etc-cart-box">
		
		</div>
	</div>
	<div class="item-total-container">
		<span class="subtotal-title">총 금액</span>
		<span id="total-price"></span>
		<span>원</span>
		<div id="order-btn">
			<div class="btn-checkout" id="btn-order-now">바로 주문</div>
			<div class="btn-checkout" id="btn-to-cart">장바구니 담기</div>
		</div>
	</div>
</nav>
<script type="text/javascript">
	
	$("#btn-order-now").click(function(){
		// 장바구니 데이터 DB 저장 + 어떤 제품인지 임시데이터 order_detail_temp도 함께 저장 
		var member_num = "${member.member_num}";
		// not logged in -> to login page
		console.log(member_num)
		if(member_num == ""){
		// not logged in -> to login page
				location.href = '/t1/member/memberLogin'
				alert("로그인이 필요한 기능입니다.")			
		}else{
		// logged in
			var addressPage = '/t1/address/delivery'
			$.get(
				'/t1/cart/hasAddress',
				function(result){
					alert('hasAddress: '+result)
					if(result>0){
						addressPage += 'After'
					}
				}
			)
			alert(pizzaCart.toString())
			alert(doughCart.toString())
			alert(toppingCart.toString())
			alert(sideDishCart.toString())
			alert(sideDishCart.toString())
			
			$.post(
				"/t1/cart/addToCart/pizza",{
					"orderType":"direct",
					"pizzaCart":pizzaCart.toString(),
					"doughCart":doughCart.toString(),
					"toppingCart":toppingCart.toString(),
					"sideDishCart":sideDishCart.toString(),
					"etcCart":etcCart.toString()
					},
					function(result){
						if(result < 1){
							alert("오류: 장바구니 담기에 실패했습니다. 문제가 지속될 경우 관리자에게 문의 바랍니다.")	
							return
						}
					location.href = addressPage
				}
			)//end of $.post	
		}//end of else(logged in) statement
	})
	
	$("#btn-to-cart").click(function(){
		var member_num = "${member.member_num}";
		// not logged in -> to login page
		console.log(member_num)
		if(member_num == ""){
				location.href = '/t1/member/memberLogin'
				alert("로그인이 필요한 기능입니다.")			
		}else{
			$.ajax({
				url : "/t1/cart/addToCart/pizza",
				type : "post",
				data : {
					"orderType" : "toCart",
					"pizzaCart" : pizzaCart.toString(),
					"doughCart" : doughCart.toString(),
					"toppingCart" : toppingCart.toString(),
					"sideDishCart" : sideDishCart.toString(),
					"etcCart" : etcCart.toString()
					},
				success :
					function(result){
						if(result < 1){
							alert("오류: 장바구니 담기에 실패했습니다. 문제가 지속될 경우 관리자에게 문의 바랍니다.")	
							return
						}
						var answer = window.confirm("물건이 장바구니에 담겼습니다. 지금 확인하시겠습니까?")
						if(answer){						
							location.href = "/t1/cart/detail"
							
						}else{
							location.href = "/t1/menu/list/pizzaList"
						}
					}
			})//end of $.ajax	
		}//end of else(logged in) statement
	})

</script>



</body>
</html>