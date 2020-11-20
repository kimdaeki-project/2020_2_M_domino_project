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
    .content{
    	border-top: 1px black solid; 
    }
    .item-image-wrapper{
    	width: 90px;
    	height: 90px;
    	display: inline-block;
    }
	.item-image{
		width: 100%;
	}
	
	.desc-container{
		display: inline-block;
	}
    </style>
    
  
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
		<div class="content">
			<h3>장바구니 목록</h3>		
			<table class="table">
				<thead>
					<tr>
						<td>선택</td>
						<td>상품정보</td>
						<td>추가토핑</td>
						<td>수량</td>
						<td>금액</td>
						<td><button type="button" class="btn btn-warning">전체 삭제</button></td>
					</tr>	
				</thead>	
				<c:forEach items="${cartList}" var="dto">
					<c:if test="${dto.item_category != 'topping' && dto.item_category != 'dough'}">
						<tr>
							<td>
								<input type="checkbox"/>
							</td>
							<td>
								<div class="item-image-wrapper">
									<img src="/t1/resources/images/menu/${dto.item_category}/${dto.item_image}" class="item-image"/>
								</div>
								<div class="desc-container">
									<p>${dto.item_name}</p>
									<c:if test="${dto.item_category == 'pizza'}">
										<span class="dough-name-short"></span>
										<span>/${dto.item_size}</span>
									</c:if>
									<p>${dto.item_price}원</p>
								</div>
							</td>
							<td>
								<div class="topping-container">
									<ul>
									</ul>
								</div>
							</td>
							<td>
								<button>-</button>
								<input type="text" value="${dto.cart_quantity}"/>
								<button>+</button>
							</td>
							<td>${dto.item_price}원</td>
							<td><p class="item-delete">X</p></td>				
						</tr>
					</c:if>		
				</c:forEach>
					
			</table>
			<div>
				<div>
					총 금액 <span id="total-price"></span>
				</div>
			</div>
		</div>
		<div class="content">
			<button>+ 메뉴 추가하기</button>
			<button>주문하기</button>
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
	
	</script>


</body>
</html>