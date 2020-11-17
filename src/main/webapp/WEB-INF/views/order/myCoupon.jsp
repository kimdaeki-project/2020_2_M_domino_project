<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href ="../resources/css/order/coupon.css" rel="stylesheet">

<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body onresize="parent.resizeTo(900,650)" onload="parent.resizeTo(900,650)">
	<div class="container">
		<div class="coupon-header">
			<div class="coupon-name">
				<h1>도미노 온라인 쿠폰</h1>
			</div>	
		</div>
		
		<div class="coupon-main">
			<div class="coupon-list">
				<div class="coupon-info">
							<div class="title-type"><h4>도미노 온라인 쿠폰</h4><br>
							<div class="form">
								<div class="form-item">
									<div class="chk-box">
											<input type="radio" id="coupon1" name="coupon">
											<label class="checkbox" for="coupon1"></label>
											<label for="coupon1">[REGULAR쿠폰] 배달 피자 20% 할인(유효기간: 2020-11-01 ~ 2020-11-30)</label>
										</div>
									<div class="chk-box">
											<input type="radio" id="coupon2" name="coupon">
											<label class="checkbox" for="coupon2"></label>
											<label for="coupon2"> [마이키친] REGULAR 배달 20% 할인(유효기간: 2020-11-01 ~ 2020-11-30)</label>
										</div>
									<div class="chk-box">
											<input type="radio" id="coupon3" name="coupon">
											<label class="checkbox" for="coupon3"></label>
											<label for="coupon3"> [첫 주문]스타 셰프 컬렉션 L 배달 1만원(유효기간: 2020-11-13 ~ 2021-01-07)</label>
										</div>
								</div>
							</div>
						</div>	
					</div>
					
					<div class="coupon-pay">
						<div class="total-wrap">
		                    <div class="total-step">
		                        <div class="title-type2"><h4>최종 결제 금액</h4></div>
		                        <dl>
		                            <dt>총 상품 금액</dt>
		                            <dd class="totalPrice">38,900원</dd>
		                        </dl>
		                        <dl class="discount">
		                            <dt>총 할인 금액</dt>
		                            <dd id="totalDiscount">10,000원</dd>
		                        </dl>
		                        <!--할인 적용한 쿠폰명-->
		                        <ul class="apply applyBox">
		                        	<li class="prmtName">-> [첫 주문]스타 셰프 컬렉션 L 배달 1만원</li>
		                           	 </ul>
		                        <!--//할인 적용한 쿠폰명-->
		                        <dl class="total">
		                            <dt>총 결제 금액</dt>
		                            <dd id="totalPricePay">28,900원</dd>
		                        </dl>
		                    </div>
		                    <div class="btn-wrap">
		                        <a href="#" class="btn-type1">쿠폰 적용하기</a>
		                    </div>
		                </div>
			
					</div>
			</div>	
		</div>
		<div id="myCupnInfo" class="notice_box" style="display: block;">
						<div class="text_type0">유의사항</div>
						<ul class="list_text_v2">
							<li>-피자 주문 시, 각 쿠폰에 따른 피자 구매 금액을 할인해 드리며 매니아 쿠폰은 피자 최대 4판까지만 할인이 적용됩니다. <br>(피자 판 이상 구매시 매니아 쿠폰 할인 적용불가)</li>
							<li>-ROYAL 및 VIP 등급에게만 발급되는 생일 50% 할인 쿠폰은 방문포장 전용이며, 피자 1판에만 적용 가능합니다. <br>(생일축하 50%할인 적용 후 피자를 2판이상 담을 경우 적용된 할인은 자동으로 취소됩니다.)</li>
							<li>-SET 메뉴 주문 시에는 쿠폰 사용이 불가능 합니다.</li>
						</ul>
					</div>
	</div>

</body>
</html>