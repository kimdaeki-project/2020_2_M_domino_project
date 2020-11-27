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
					<li><a href="${pageContext.request.contextPath}/menu/list/etcList">메뉴</a></li>
					
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
				
	<div class="container" id="etc-container">	
		<c:forEach items="${etc}" var="dto" varStatus="loop">
			<c:if test="${loop.index % 4 == 0}">
				<div class="row justify-content-start">
			</c:if>
			<div class="col-sm-3 item-wrapper">
				<div class="item-thumbnail-container">
					<img src="/t1/resources/images/menu/${category}/${dto.item_image}" alt="${dto.item_name}" class="item-thumbnail">			
				</div>
				<div class="name-container">
					<span>${dto.item_name}</span>
					<c:if test="${dto.item_tag != null}">
						<span class="label label-special">${dto.item_tag}</span>
					</c:if>
				</div>				
				<div class="price-container">
					<span>
						<span class="price-text">${dto.item_price }원</span>
					</span>				 							
				</div>	
					<div class="input-group quantity-controller-wrapper">
						<span class="input-group-btn">
							<button type="button" class="btn btn-quantity-controller btn-minus" min="0" disabled>-</button>
						</span>
						<input type="text" class="form-control quantity-input" value="0" disabled/>

						<span class="input-group-btn">
							<button type="button" class="btn btn-quantity-controller btn-plus">+</button>
						</span>	
					</div>	
					<div class="to-cart-btn">
						<span>주문</span>
					</div>		
					<input type="hidden" value="${dto.item_id}" class="item-id" />					
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

	$(".btn-quantity-controller").click(function(){
		var btn = $(this)
		var input = btn.closest("div").find(".quantity-input")
		var quantity = input.val()	

		if(btn.hasClass("btn-minus")){
			quantity -= 1
		}else{
			quantity = Number(quantity) + 1
		}	
		input.val(quantity)
		
		// minus button disabled control
		if(btn.hasClass("btn-minus")){
			if(quantity <= Number(btn.attr("min"))){
				btn.prop("disabled", true)
			}
		}else{
			btn.closest("div").find(".btn-minus").prop("disabled", false)					
		}				
	})
	
	$(".to-cart-btn").click(function(){
		// 로그인 여부부터 확인하기 
		var member_num = "${member.member_num}";
		// not logged in -> to login page
		console.log(member_num)
		if(member_num == ""){			
				alert("로그인이 필요한 기능입니다.")		
				location.href = '/t1/member/memberLogin'
		}else{
			var itemId = $(this).next().val()
			var itemQuantity = $(this).closest(".item-wrapper").find(".quantity-input").val()
			var orderType = 'fromEtcList'
			
			var sideDishCart = []
			var etcCart = [[itemId, "etc", itemQuantity, 0]]
		
			// to cart
			$.ajax({
				url : "/t1/cart/addToCart/sideDish"	,
				type : "post",
				data : {
					"orderType" : orderType,
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
			})				
		}
	})




</script>
</body>
</html>