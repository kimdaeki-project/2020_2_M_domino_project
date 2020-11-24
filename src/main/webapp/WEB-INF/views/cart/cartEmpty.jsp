<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$("#to-menu-list").click(function(){
		window.location.href = "/t1/menu/pizza"
	})
</script>
<div id="empty-cart-content">
	<img src="${pageContext.request.contextPath}/resources/images/common/cart_icon.png" id="image-empty-cart">
	<h1>장바구니가 비어있습니다.</h1>
	<p>도미노피자의 맛있는 메뉴를 마음껏 골라 담으세요</p>
</div>
