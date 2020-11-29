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
    <link href="/t1/resources/css/common/board.css" rel="stylesheet">
    <script src="/t1/resources/js/header.js"></script>
    <script src="/t1/resources/js/menu/detail.js"></script>

</head>
<body>
<c:import url="../../template/header.jsp"></c:import>
<div class="container" id="pdContainer">
	<div class="order-title-wrap">
		<h2 class="order-title">메뉴</h2>
		<div class="depth-area">
			<!-- 브레드크럼 -->
			<ol>
				<li><a href="http://localhost/t1">홈</a></li>
				<li><a href="${pageContext.request.contextPath}/menu/list/pizzaList">메뉴</a></li>
				<li><strong>${sideDish.item_name}</strong></li>						
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


	<div class="col-sm-6 item-desc-container">
		<div>
			<img src="/t1/resources/images/menu/sidedish/${sideDish.item_image}" alt="${sideDish.item_name}" class="main-item-image">	
		</div>
	</div>
	<div class="col-sm-6 item-option-container">
		<div class="title-wrap">
			<p style="font-weight: bold; font-size: 30px;">${sideDish.item_name}<p>
			<p>영양성분 및 알레르기 유발성분 ></p>	
		</div>
		<div class="option-box" id="size-option-wrap">
			<div class="option-title-wrap">
				<p class="option-text">옵션 선택</p>
			</div>
			<div class="option-item-wrap">
				<input type="radio" class="dough-checkbox" checked/>
				<label class="dough-info">
					<span> 일반가격 ${sideDish.item_price}원</span>								
				</label>							
			</div>										
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

<nav class="navbar navbar-fixed-bottom" id="item-cart-container">
	<div class="item-subtotal-container">
		<p class="subtotal-title">사이드디시</p>
		<p class="subtotal-item">${sideDish.item_name}(
			<span id="pizz-price">${sideDish.item_price}</span>
			원) x 
			<span id="pizza-quantity" value="1">1</span>
		</p>
	</div>
	<div class="item-subtotal-container">
		<p class="subtotal-title">음료&amp;기타</p>
		<div class="subtotal-box" id="etc-cart-box">
		
		</div>
	</div>
		<div class="item-subtotal-container">
		<p class="subtotal-title"></p>
		<div class="subtotal-box">
		
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
// item_id, item_name, cart_quantity, item_price, [item_size]
var sideDishCart = [["${sideDish.item_id}", "${sideDish.item_name}", 1, ${sideDish.item_price}]]
var etcCart = []

var totalPrice = updateTotalPrice()


function updateTotalPrice(){
	var sideDishSum = sideDishCart[0][3] * sideDishCart[0][2]
	var etcSum = getArrayPriceSum(etcCart)
	var tot = Number(sideDishSum) + Number(etcSum)
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

$("#pizza-quantity-btn-minus").click(function() {
	var quantity = $("#pizza-quantity-option").val()	
	if(quantity <= parseInt($(this).attr("min"))+1){
		$(this).attr("disabled", true)
	}		
	// update sideDish input box's value
	$("#pizza-quantity-option").val(quantity-1)
	// update sideDishCart
	sideDishCart[0][2] = quantity-1
	// update cart's sideDish quantity
	$("#pizza-quantity").text(sideDishCart[0][2])
	// update cart's total price
	totalPrice = updateTotalPrice()
})

$("#pizza-quantity-btn-plus").click(function() {
	var quantity = $("#pizza-quantity-option").val()
	$("#pizza-quantity-btn-minus").attr("disabled", false)	
	
	quantity = parseInt(quantity)+1
	// update sideDish input box's value
	$("#pizza-quantity-option").val(quantity)	
	// update sideDishCart
	sideDishCart[0][2] = quantity
	// update cart's sideDish quantity
	$("#pizza-quantity").text(sideDishCart[0][2])
	// update cart's total price
	totalPrice = updateTotalPrice()
})	

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
					if(result>0){
						addressPage += 'After'
					}
				}
			)
			
			$.post(
				"/t1/cart/addToCart/sideDish",{
					"orderType":"direct",
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
		if(member_num == ""){
				location.href = '/t1/member/memberLogin'
				alert("로그인이 필요한 기능입니다.")			
		}else{
			$.ajax({
				url : "/t1/cart/addToCart/sideDish",
				type : "post",
				data : {
					"orderType" : "toCart",
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