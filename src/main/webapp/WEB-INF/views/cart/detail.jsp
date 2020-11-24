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
    <link href="/t1/resources/css/cart/detail.css" rel="stylesheet">
    <link href="/t1/resources/css/common/shared.css" rel="stylesheet">
    <script src="/t1/resources/js/header.js"></script>  
  
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>	

	<div class="container">
		<div class="page-title">
			<h2>장바구니</h2>
		</div>
		<div class="content">
			<h3>배달주문</h3>
			<div>대표주소는 여기에 노출??</div>
		</div>
		<div class="content" id="cart-list-container">
			<h3>장바구니 목록</h3>		
			<table class="table">
				<thead>
					<tr>
						<td>선택</td>
						<td>상품정보</td>
						<td>추가토핑</td>
						<td>수량</td>
						<td>금액</td>
						<td><button type="button" class="btn btn-warning" id="btn-empty-cart">전체 삭제</button></td>
					</tr>	
				</thead>	
			<!-- pizza group items -->
				<c:forEach items="${pizzaGroupList}" var="pizzaGroup">
					<tr value="${pizzaGroup[0].cart_group_id}" class="pizza-cart-group">
						<td>
							<input type="checkbox" checked="checked" class="to-checkout"/>
						</td>
						<td>
							<div class="item-image-wrapper">
								<img src="/t1/resources/images/menu/pizza/${pizzaGroup[0].item_image}" class="item-image"/>
							</div>
							<div class="desc-container">
								<p>${pizzaGroup[0].item_name}</p>
								<p>	
									<span class="dough-name-short">${pizzaGroup[1].dough_name_short}</span>
									<span>/${pizzaGroup[0].item_size}</span>
								</p>
								<p class="pizza-price">${pizzaGroup[0].item_price}원</p>
							</div>
						</td>
						<td>
							<div class="topping-container">
								<ul>
									<c:forEach items="${pizzaGroup}" var="topping" begin="2">
										<li class="topping-item">
											<p>${topping.item_name} (+${topping.item_price}) x <span>${topping.cart_quantity}</span><span class="delete-topping-btn">X</span></p>
											<input type="hidden" value="${topping.item_price}" class="topping-price"/>
											<input type="hidden" value="${topping.cart_quantity}" class="topping-quantity"/>
											<input type="hidden" value="${topping.cart_item_id}" class="topping-cart-item-id"/>
										</li>
									</c:forEach>
								</ul>
							</div>
						</td>
						<td>
							<div class="input-group">
								<span class="input-group-btn">
									<button type="button" class="btn btn-quantity-controller btn-minus" min="1" disabled>-</button>
								</span>
								<input type="text" class="form-control quantity-input" value="${pizzaGroup[0].cart_quantity}" disabled/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
								</span>	
							</div>						
						</td>
						<td><span class="item-price"></span>원</td>
						<td><p class="delete-item-btn">X</p></td>				
					</tr>	
				</c:forEach>
				
			<!-- Standalone items -->	
				<c:forEach items="${itemList}" var="item">		
					<tr value="${item.cart_group_id}" class="item-cart-group">
						<td>
							<input type="checkbox" checked="checked" class="to-checkout"/>
						</td>
						<td>
							<div class="item-image-wrapper">
								<img src="/t1/resources/images/menu/${item.item_category}/${item.item_image}" class="item-image"/>
							</div>
							<div class="desc-container">
								<p>${item.item_name}</p>
								<p>${item.item_price}원</p>
							</div>
						</td>
						<td>
							<div class="topping-container">
								<ul>
								</ul>
							</div>
						</td>
						<td>
							<div class="input-group">
								<span class="input-group-btn">
									<button type="button" class="btn btn-quantity-controller btn-minus" min="1" disabled>-</button>
								</span>
								<input type="text" class="form-control quantity-input" value="${item.cart_quantity}" disabled/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
								</span>	
							</div>							
						</td>
						<td><span class="item-price"></span>원</td>
						<td><p class="delete-item-btn">X</p></td>				
					</tr>	
				</c:forEach>					
			</table>
		<!-- 총 주문 금액: 체크박스에 체크 되어있는 항목만 합산 -->
			<div>
				<div>
					총 금액 <span id="total-price"></span>
				</div>
			</div>
		</div>
		
		<div class="content">
			<button id="btn-menu-list">+ 메뉴 추가하기</button>
			<button id="btn-checkout">주문하기</button>
		</div>
		
		<div>
			<div class="col-sm-3">
				<p>유의사항</p>
			</div>
			<div class="col-sm-9">
				<p>* 할인 적용은 다음 단계에서 가능합니다.</p>
				<p>* 피클&amp;소스 기본 제공 안내</p>
				<p> - L : 피클 L (120g) 1개 / 핫소스 2개 / 갈릭디핑소스 15g 2개, M : 피클 M (75g) 1개 / 핫소스 1개 / 갈릭디핑소스 15g 1개</p>
				<p> - 씬 도우, 더블크러스트 이베리코 피자는 갈릭디핑소스 미 제공</p>
				<p> - 메뉴 > 음료&amp;기타 추가 구매 가능</p>
			</div>
		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript">	

	if(${isCartEmpty} == 1){
		setEmptyCart()
	}	
	
	function setEmptyCart(){
		$.ajax({
			url : "./cartEmpty",
			type : "get",
			success : function(content){
				$("#cart-list-container").html(content)
				$("#btn-checkout").remove()
			}
		})	 
	}
	
	$("#btn-menu-list").click(function(){
		location.href="/t1/menu/list/pizzaList"
	})
	
	$(".btn-minus").click(function(){
		var input = $(this).parent().siblings(".quantity-input")
		var quantity = input.val()	
		if(quantity <= parseInt($(this).attr("min"))+1){
			$(this).attr("disabled", true)
		}
		quantity = quantity - 1
		input.val(quantity)

		// update cart subtotal box
/* 		var cartBox = $("#" + getCartBoxId(category))
		updateCartBox(cartBox, cartArray)
		totalPrice = updateTotalPrice() */
	})
	
	
	$(".btn-plus").click(function(){
		var input = $(this).parent().siblings(".quantity-input")
		var quantity = input.val()	
		$(this).parent().parent().find(".btn-minus").attr("disabled", false)			
		input.val(parseInt(quantity)+1)		

		// update cart subtotal box
/* 		var cartBox = $("#" + getCartBoxId(category))
		updateCartBox(cartBox, cartArray)	
		totalPrice = updateTotalPrice() */
	})
	
	// 장바구니 비우기 버튼
	$("#btn-empty-cart").click(function(){
		var emptyCart = window.confirm("모든 제품을 삭제하시겠습니까?")
		if(!emptyCart){
			return
		}
		$.get(
			"./delete/emptyCart",
			function(result){
				result = result.trim()
				if(result<1){
					alert("장바구니 비우기에 실패했습니다.")
					return
				}
				setEmptyCart()
				window.location.reload()	
			}
		)
		
	})
	
	// 제품 삭제 버튼 
		$(".delete-item-btn").click(function(){
			var deleteItem = window.confirm("해당 제품을 장바구니에서 삭제하시겠습니까?")
			if(!deleteItem){
				return
			}		
			var cartGroupId = $(this).closest("tr").attr("value")
			$.ajax({
				url:"./delete/item",
				type:"POST",
				data:{
					cart_group_id : cartGroupId
				},
				success : function(result){
					result = result.trim()
					alert(result)
					if(result > 0){
						$(this).parent().remove()
						window.location.reload()
					
					}else{
						alert("삭제에 실패했습니다.")
					}				
				}
			})		
		})
		
	// 토핑 삭제 
		$(".delete-topping-btn").click(function(){
			var deleteTopping = window.confirm("선택하신 토핑을 삭제하시겠습니까?")
			if(!deleteTopping){
				return
			}
			var cartItemId = $(this).parent().siblings(".topping-cart-item-id").val()
			
			alert(cartItemId)
			$.ajax({
				url:"./delete/topping",
				type:"POST",
				data:{
					cart_item_id : cartItemId
				},
				success : function(result){
					result = result.trim()
					alert(result)
					if(result > 0){
						$(this).closest("li").remove()
					}else{
						alert("삭제에 실패했습니다.")
					}
				}
			})
		})	
		
	
	
	// 계산하러 가기 
	$("#btn-checkout").click(function(){
		var pizzaGIdList = []
		var itemGIdList = []
		$('.to-checkout:checked').each(function(){
			var tr = $(this).closest('tr')
			if(tr.attr('class') == 'pizza-cart-group'){
				pizzaGIdList.push(tr.attr('value'))
			}else{
				itemGIdList.push(tr.attr('value'))
			}

		})
		console.log(pizzaGIdList.toString())
		console.log(itemGIdList.toString())
		$.post(
			"./toCheckout",
			{
				"pizzaGIdList" : pizzaGIdList.toString(),
				"itemGIdList" : itemGIdList.toString()
			},
			function(){
				location.href="/t1/order/orderInfo"
			}
		)		
	})
	</script>
</body>
</html>