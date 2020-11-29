<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<meta charset="utf-8">

<c:import url="../template/bootstrap.jsp"></c:import>
<link href="../resources/css/common/default.css" rel="stylesheet">
<link href="../resources/css/common/member.css" rel="stylesheet">
<link href="../resources/css/order/info.css" rel="stylesheet">
<script src="../resources/js/header.js"></script>
<style type="text/css">

	#select li a{
		font-size: 17px;
	}
	
	.menuSearchBtn {
	width:100%;
	margin: 0 auto;
	padding: 30px 0;
	text-align: center;
	}
	
</style>

</head>

<body>
	<c:import url="../template/header.jsp"></c:import>

<div class="container">
		<div class="order-title-wrap">
		<h2 class="order-title">주문 내역</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="./memberPage">나의정보</a></li>
					<li><strong>주문 내역</strong></li>
				</ol>
			</div>
		</div>
		
		<ul id="select" style="padding: 20px 0;">
			<li>
				<a href="./memberPage">매니아 등급</a> ㅣ 
				<a href="./memberOrder">주문 내역 </a> ㅣ 
				<a href="#">쿠폰함</a> ㅣ 
				<a href="../memberInq/memberInquirly">1:1 문의</a> ㅣ 
				<a href="./memberCheck">정보 수정</a> 
			</li>
		</ul>
		
	<div class="myLevel">
		<div class="myCheck"><h1 id="mLevel">${member.member_name}님이 주문하신 내역입니다.</h1></div>
		<div></div>
		<div class="myCheck2">주문을 취소하시려면 해당 매장으로 전화하셔야 합니다.</div>
	</div>
				<!-- 주문내역  ★for문사용★ -->
				<div class="step-wrap">

					<div class="title-wrap">
						<div class="title-type">
							<strong>주문내역</strong>
						</div>
					</div>
					<div class="order-step">
						<ul>
									<c:forEach items="${orderList}" var="order" varStatus="i">
										<li>
										<div class="menu">
											<h3>주문번호 : ${order.order_view_num}</h3>
											<h3>주문일   : ${order.order_date}</h3>
											<p>결제금액 : ${order.order_total}</p>
											<p>배달주소 : ${order.order_adress}</p>
											<p>${i.index}</p>
											<c:forEach items="${orderItemList[i.index]}" var="item">
												<div>
													<h3>${item.order_detail_name}</h3>
													<p>${item.order_detail_category}</p>
												</div>	
												<hr>								
											</c:forEach>			
										</div>
										</li>
									</c:forEach>										
							
						</ul>
					</div>
				</div>



				<!-- 다른 제품 보러가기 버튼 -->
				<div class="menuSearchBtn">
					<button type="button" id="button">다른 제품 보러가기</button>
				</div>
		
			<!-- //다른 제품 보러가기 버튼 -->
		
	</div>

	<c:import url="../template/footer.jsp"></c:import>

<script type="text/javascript">
	$("#button").click(function () {
		location.href = "../menu/list/pizzaList";
	});
	
</script>
</body>
</html>