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
			<div>${address.roadFullAddr}</div>
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
							<input type="checkbox" checked="checked" class="item-selected to-checkout"/>
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
								<!-- 사이즈에 따른 피자 기본 가격 + 도우에 따른 옵션 비용 -->
								<p>${pizzaGroup[0].item_price + pizzaGroup[1].item_price}원</p>
								<input type="number"class="pizza-price" value="${pizzaGroup[0].item_price + pizzaGroup[1].item_price}"/>
							</div>
						</td>
						<td>
							<div class="topping-container">
								<input type="number" value="0" class="topping-price-subtotal"/>
								<ul>
									<c:forEach items="${pizzaGroup}" var="topping" begin="2" varStatus="loop">
										<li class="topping-item">
											<p>${topping.item_name} (+${topping.item_price}) x <span>${topping.cart_quantity}</span><span class="delete-topping-btn">X</span></p>
											<input type="hidden" value="${topping.item_price * topping.cart_quantity}" class="topping-price"/>
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
								<input type="hidden" value=""  class="pizza-unit-price item-unit-price" />
								<input type="hidden" value="${pizzaGroup[0].cart_item_id}" class="cart-item-id" />
								<span class="input-group-btn">
									<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
								</span>	
							</div>						
						</td>
						<td class="item-subtotal-wrapper"><span class="item-subtotal"></span>원</td>
						<td><p class="delete-item-btn">X</p></td>				
					</tr>	
				</c:forEach>			
			<!-- Standalone items -->	
				<c:forEach items="${itemList}" var="item">		
					<tr value="${item.cart_group_id}" class="item-cart-group">
						<td>
							<input type="checkbox" checked="checked" class="item-selected to-checkout"/>
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
								<input type="hidden" value="${item.item_price}"  class="item-unit-price" />
								<input type="hidden" value="${item.cart_item_id}" class="cart-item-id" />
								<span class="input-group-btn">
									<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
								</span>	
							</div>							
						</td>
						<td class="item-subtotal-wrapper"><span class="item-subtotal"></span>원</td>
						<td><p class="delete-item-btn">X</p></td>				
					</tr>	
				</c:forEach>					
			</table>			

		<!-- 총 주문 금액: 체크박스에 체크 되어있는 항목만 합산 -->
			<div class="cart-total-price-container">
				<p class="cart-total-price-wrapper">
					총 금액 <em id="cart-total-price"></em>
				</p>
			</div>
		</div>
		
		<div class="content btn-box">
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
	
	// compute each pizza item's total topping price
	function setToppingPriceSubtotal(){
		$(".topping-price-subtotal").each(function(){
			var toppingSubtotal = $(this)
			$(this).next().find(".topping-price").each(function(){
				toppingSubtotal.val(Number(toppingSubtotal.val()) + Number($(this).val()))
			})
		})
	}

	// compute each pizza item's unit price(pizza + dough [+ topping])
	function setPizzaUnitPrice(){
		$(".pizza-unit-price").each(function(){
			var pizzaUnitSubtotal = $(this)
			var toppingPrice = pizzaUnitSubtotal.closest("tr").find(".topping-price-subtotal").val()
			var pizzaPrice = pizzaUnitSubtotal.closest("tr").find(".pizza-price").val()
			pizzaUnitSubtotal.val(Number(toppingPrice) + Number(pizzaPrice))
		})
	}
	
	// get subtotal for each item
	function setItemSubtotal(){
		$(".item-subtotal").each(function(){
			var itemSubtotal = $(this)
			var itemUnitPrice = itemSubtotal.closest("tr").find(".item-unit-price").val()
			var itemQuantity = itemSubtotal.closest("tr").find(".quantity-input").val()
			itemSubtotal.text(itemUnitPrice * itemQuantity)
		})
	}
	
	// get cart total price for checked items
	function setCartTotal(){
		var cartTotalPrice = 0
		$(".item-selected:checked").each(function(){
			var itemPrice = $(this).closest("tr").find(".item-subtotal").text()
			cartTotalPrice += Number(itemPrice)
		})
		$("#cart-total-price").text(cartTotalPrice)
	}
	
	$(document).ready(function(){
		setToppingPriceSubtotal()
		setPizzaUnitPrice()
		setItemSubtotal()
		// set minus buttons disabled status
		$(".btn-minus").each(function(){
			var quantity = $(this).closest("div").find(".quantity-input").val()
			var min = $(this).attr("min")
			console.log("q: " + quantity + ", min: " + min )
			if(quantity > min){
				$(this).prop("disabled", false)
			}
		})
		setCartTotal()
	})
	
	// item checkbox status change -> update total item price
	$(".item-selected").click(function(){
		setCartTotal()
	})
	
	// 토핑 삭제 
		$(".delete-topping-btn").click(function(){
			var deleteTopping = window.confirm("선택하신 토핑을 삭제하시겠습니까?")
			if(!deleteTopping){
				return
			}
			var cartItemId = $(this).parent().siblings(".topping-cart-item-id").val()
			$.ajax({
				url:"./delete/topping",
				type:"POST",
				data:{
					cart_item_id : cartItemId
				},
				success : function(result){
					result = result.trim()
					if(result > 0){
						$(this).closest("li").remove()
						window.location.reload()
					}else{
						alert("삭제에 실패했습니다.")
					}
				}
			})
		})

		
	// 항목 수량 변경
	function changeQuantity(btn, input, cartItemId, quantity){
		$.ajax({
			url:"./changeQuantity",
			type:"POST",
			data:{
				cart_item_id : cartItemId,
				cart_quantity : quantity
			},
			success : function(result){
				if(result < 1){
					alert("오류가 발생했습니다")					
					return
				}
				if(btn.hasClass("btn-minus")){
					if(quantity <= parseInt($(this).attr("min"))){
						btn.prop("disabled", true)
					}
				}else{
					btn.closest("div").find(".btn-minus").prop("disabled", false)					
				}
					input.val(quantity)
					setItemSubtotal()	
					setCartTotal()				
			}
		})
	}		

		$(".btn-quantity-controller").click(function(){
			var input = $(this).parent().siblings(".quantity-input")
			var quantity = input.val()	
			if($(this).hasClass("btn-minus")){
				quantity -= 1
			}else{
				quantity = Number(quantity) + 1
			}
			var cartItemId = $(this).parent().siblings(".cart-item-id").val()	
			changeQuantity($(this), input, cartItemId, quantity)
		})
		
		
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
		alert(pizzaGIdList.toString())
		alert(itemGIdList.toString())
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
		$.post(
			"/t1/cart/toAddressPage",
			{
				"pizzaGIdList" : pizzaGIdList.toString(),
				"itemGIdList" : itemGIdList.toString()
			},
			function(result){
	alert("insert result: " + result)
				if(result < 1){
					alert("오류가 발생했습니다. 문제가 지속될 경우 관리자에게 문의 바랍니다.")	
					return
				}				
			location.href = addressPage 
			}
		)		
	})
	</script>
</body>
</html>