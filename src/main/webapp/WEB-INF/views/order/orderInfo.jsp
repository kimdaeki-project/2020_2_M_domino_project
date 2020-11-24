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
<link href="../resources/css/order/info.css" rel="stylesheet">
<script src="../resources/js/header.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {
				$("#recipient").change(
						function() {
							if ($("#recipient").is(":checked")) {
								$("#order_name").val("${member.member_name}")
										.attr('readonly', true);
								$(".tel1").val(
										"${member.member_phone}"
												.substring(4, 8)).attr(
										'readonly', true);
								$(".tel2").val(
										"${member.member_phone}".substring(9,
												14)).attr('readonly', true);
							} else {
								$("#order_name").val("")
										.attr('readonly', false);
								$(".tel1").val("").attr('readonly', false);
								$(".tel2").val("").attr('readonly', false);
							}
						});
			});

</script>


</head>

<body>
	<c:import url="../template/header.jsp"></c:import>

	<!-- 1depth 메뉴명 & 네비게이션 -->
	<div class="container">
		<div class="order-title-wrap">
			<h2 class="order-title">결제하기</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="/basket/detail">장바구니</a></li>
					<li><strong>결제하기</strong></li>
				</ol>
			</div>
		</div>


		<article class="pay">
			<form id="pay-list">
				<div class="step-wrap">
					<div class="title-wrap">
						<h3 class="title-type">
							<strong>수령인 정보</strong>
						</h3>
					</div>
					<!-- 배달 -->
					<div class="deli-info">
						<div class="address">${address.roadFullAddr}</div>
						<div class="store">
							<span>지점</span> 전화번호
						</div>
					</div>
				</div>

				<!--  주문자 정보-->
				<div class="deli-info form">
					<dl class="chk-wrap">
						<dd>
							<div class="form-group">
								<div class="form-item">
									<div class="chk-box v4" id="chk-box-a1">
										<input type="checkbox" name="order_type" id="recipient">
										<label class="checkbox" for="recipient"></label> <label
											for="recipient">주문자와 동일</label>
									</div>
								</div>
							</div>
						</dd>
					</dl>

					<dl>
						<dt class="dt1">이름</dt>
						<dd>
							<div class="form-item">
								<input type="text" id="order_name" name="order_name"
									maxlength="10">
							</div>
						</dd>
					</dl>

					<dl>
						<dt class="dt2">연락처</dt>
						<dd>
							<div class="form">
								<div class="form-group2 select-group">
									<div class="form-item">
										<input type="text" id="tel2" name="order_phone" value="010"
											readonly="readonly"> <input type="text" id="tel2"
											class="tel1" name="order_phone" maxlength="4"> <input
											type="text" id="tel2" class="tel2" name="order_phone"
											maxlength="4">
									</div>
								</div>
							</div>
						</dd>
					</dl>

					<dl>
						<dt class="dt3">요청사항</dt>
						<dd>
							<div class="form-item">
								<input type="text" id="order_request" name="order_request"
									value="" maxlength="50">
							</div>
						</dd>
					</dl>

					<dl id="dl2">
						<dt class="dt4">비대면 안전배달</dt>
						<dd style="margin-top: 1.3%;">
							<div class="form-item">
								<div class="chk-box v4" id="selectedSafe">
									<input type="checkbox" id="order_untact" name="order_untact"
										value="0"> <label class="checkbox" for="order_untact"></label>
									<label> "미리결제" 이용 필수</label>
								</div>
							</div>
						</dd>
					</dl>

					<div class="guide-box3">&#42;배달 시 고객님의 문 앞에 피자를 놓은 후 고객님께 확인
						연락(초인종 또는 전화) 드리는 서비스입니다.</div>
					<div class="guide-box3" id="guide-box3-v1">&#42;주류상품이 포함된 경우
						수령자의 신분증 확인을 위해 비대면 안전배달 서비스가 제한됩니다.</div>
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
							<li>
								<div class="menu">
									<!-- 피자 명  -->
									<strong class="goods_name">피자명,외 갯수</strong>
									<!-- //피자 명  -->
								</div>

								<div class="topping">
									<span style="display: none;" id="goods_name_brief">메인</span>
									<div class="item">
										<span>피자이름 (도우 )사이즈 x 갯수</span> <span>가격</span>원

										<!-- 토핑 -->
										<ul>
											<li></li>
										</ul>
										<!-- //토핑 -->
									</div>

									<!-- 사이드 메뉴 -->
									<span style="display: none;" id="goods_name_brief">사이드메뉴</span>
									<div class="item">
										<span>사이드메뉴 x 갯수</span> <span>가격</span>원
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 사이드메뉴 -->
				<!-- //주문내역 -->

				<!-- 할인 적용 -->
				<div class="step-wrap" id="dc_info">
					<div class="title-wrap">
						<h3 class="title-type">
							<strong>할인 적용</strong>
						</h3>
					</div>
					<div class="guide-box4">&#42;가장 높은 할인율의 혜택으로 자동 적용하였습니다.</div>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content coupon-main">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"
										style="text-align: center; font-size: 20px; font-weight: bold;">도미노
										온라인 쿠폰</h4>
								</div>

								<div class="col-sm-8"
									style="padding: 20px 0; background-color: #f2f2f2;">
									<div
										style="background-color: white; height: 350px; border: 20px solid #f2f2f2; border-bottom: 0;">
										<p
											style="font-size: 17px; font-weight: bold; padding-left: 30px; padding-top: 30px;">도미노
											온라인 쿠폰</p>
										<div class="form" style="padding: 20px 10">
											<div class="form-item">
											<c:forEach items="${couponList}" var="coupon" varStatus="i">
												<div class="chk-box" style="margin-left: 25px;">
													<input type="radio" id="coupon${i.index}" name="coupon"> <label
														class="checkbox" for="coupon${i.index}"></label> <label
														for="coupon${i.index}">${coupon.sale_name}(유효기간:${coupon.sale_date}~${coupon.sale_date_end})</label>
												</div>
											</c:forEach>
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-4"
									style="padding: 20px 0; background-color: #f2f2f2; text-align: center;">
									<div class="coupon-pay"
										style="background-color: white; height: 300px; border: 20px solid #f2f2f2;">
										<div class="title-type2">
											<h4>최종 결제 금액</h4>
										</div>
										<dl>
											<dt>총 상품 금액</dt>
											<dd class="totalPrice">38,900원</dd>
										</dl>
										<dl class="discount">
											<dt>총 할인 금액</dt>
											<dd id="totalDiscount">10,000원</dd>
										</dl>
										<hr>
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

									<div>
										<div class="btn-wrap"
											style="background-color: #ff143c; height: 50px; width: 260px; margin: 0 auto;">
											<a href="#" class="btn-type1"
												style="line-height: 50px; color: white; font-size: 18px;">쿠폰
												적용하기</a>
										</div>
									</div>

								</div>

								<div class="modal-footer" style="background-color: #f2f2f2;">
									<div class="col-sm-8" style="text-align: left; padding: 20px;">
										<div id="myCupnInfo" class="notice_box"
											style="display: block;">
											<div class="text_type0">유의사항</div>
											<h5>피자 주문 시, 각 쿠폰에 따른 피자 구매 금액을 할인해 드리며 매니아 쿠폰은 피자 최대
												4판까지만</h5>
											<h5>할인이 적용됩니다.(피자 판 이상 구매시 매니아 쿠폰 할인 적용불가) ROYAL 및 VIP
												등급에게만</h5>
											<h5>발급되는 생일 50% 할인 쿠폰은 방문포장 전용이며, 피자 1판에만 적용 가능합니다.</h5>
											<h5>(생일축하 50%할인 적용 후 피자를 2판이상 담을 경우 적용된 할인은 자동으로 취소됩니다.)
											</h5>
											<h5>SET 메뉴 주문 시에는 쿠폰 사용이 불가능 합니다.</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="discount-step">
						<ul>
							<li id="myCoupon" class="active"><a href="#"
								class="type-brd5" data-toggle="modal" data-target="#myModal">도미노
									온라인 쿠폰 선택</a></li>
							<li id="dcPrmt" class="active"><a
								href="javascript:changePrmt('dcPrmt');" class="type-brd5"><span>[고객감사]피자
										25%(배달)</span></a></li>
							<li id="mobile" class="active"><a
								href="javascript:changePrmt('mobile');" class="type-brd5">통신사
									및 카드사 제휴 프로모션 선택</a></li>
							<li id="voucher" class="active"><a
								href="javascript:changePrmt('voucher');" class="type-brd5 ">상품권
									및 쇼핑몰 쿠폰번호 입력</a></li>
						</ul>
					</div>
				</div>

				<!-- //할인 적용 -->

				<!-- 도착 예정시간 -->
				<div class="step-wrap" id="time_info">
					<div class="title-wrap">
						<div class="title-type">
							<strong>도착 예정시간</strong>
						</div>
					</div>
					<div class="time-step">
						<div class="type2" id="time-list">
							<ul class="col-free">
								<li class="cupon"><a href="#">바로주문</a></li>
								<li class="cupon"><a href="#">오늘예약</a></li>
								<li class="cupon"><a href="#">내일예약</a></li>
							</ul>
						</div>

						<!-- 바로주문 -->
						<div>
							<div class="time-info">
								<p class="text">
									지금 주문하시면,
									<br>
									<span>${orderTime}</span>
									배달될 예정입니다.
								</p>	
									<div class="guide-box4 guide-box4-2">*매장 상황에 따라 배달시간이 상이할 수 있습니다.</div>
								
								
								
								
								</div>
							</div>
						</div>
						<!-- // 바로주문 -->
					</div>
				

				<!-- 결제방법 -->
				<div class="step-wrap" id="pay_info">

					<div class="title-wrap">
						<h3 class="title-type">
							<strong>결제수단 선택</strong>
						</h3>
					</div>

					<div class="pay-step">
						<div class="pay-info">
							<div class="title-type2">미리결제</div>
							<div class="form">
								<div class="form-item">
									<div class="chk-box" id="pay-1">
										<input type="radio" id="pay1" name="pay" value="카드결제">
										<label class="checkbox" for="pay1"></label> <label for="pay1">카드결제</label>
									</div>
									<div class="chk-box" id="pay-2">
										<input type="radio" id="pay2" name="pay" value="네이버결제">
										<label class="checkbox" for="pay2"></label> <label for="pay2">네이버페이</label>
									</div>
									<div class="chk-box" id="pay-3">
										<input type="radio" id="pay3" name="pay" value="핸드폰결제">
										<label class="checkbox" for="pay3"></label> <label for="pay3">핸드폰결제</label>
									</div>
									<div class="chk-box" id="pay-4">
										<input type="radio" id="pay4" name="pay" value="카카오페이">
										<label class="checkbox" for="pay4"></label> <label for="pay4">카카오결제</label>
									</div>
									<div class="chk-box" id="pay-5">
										<input type="radio" id="pay5" name="pay" value="도미노결제">
										<label class="checkbox" for="pay5"></label> <label for="pay5">도미노페이</label>
									</div>
									<div class="chk-box" id="pay-6">
										<input type="radio" id="pay6" name="pay" value="페이코결제">
										<label class="checkbox" for="pay6"></label> <label for="pay6">페이코</label>
									</div>
									<div class="chk-box" id="pay-7">
										<input type="radio" id="pay7" name="pay" value="스마일페이 결제">
										<label class="checkbox" for="pay7"></label> <label for="pay7">스마일페이</label>
									</div>
									<div class="chk-box" id="pay-8">
										<input type="radio" id="pay8" name="pay" value="토스 결제">
										<label class="checkbox" for="pay8"></label> <label for="pay8">토스</label>
									</div>				
								</div>
							</div>
						</div>
						<div class="pay-info">
							<div class="title-type2">
								현장결제 <br>
								<div class="guide-box6" style="font-weight: bold;">&#42;
									코로나바이러스 확산에 따라 도미노피자는 '현금 없는 매장' 캠페인 일환으로 신용ㆍ체크카드 등 미리결제 사용을
									권유해 드리고 있습니다.</div>
							</div>
							<div class="form">
								<div class="form-item">
									<div class="chk-box" id="pay-9">
										<input type="radio" id="pay9" name="pay" value="현장 카드결제">
										<label class="checkbox" for="pay9"></label> <label for="pay9">현장카드결제</label>
									</div>
									<div class="chk-box" id="pay-10">
										<input type="radio" id="pay10" name="pay" value="현장 현금결제">
										<label class="checkbox" for="pay10"></label> <label
											for="pay10">현장현금결제</label>
									</div>
								</div>
							</div>
						</div>
						<div class="pay-info">
							<div class="form-item">
								<div class="chk-box v3">
									<input type="checkbox" id="final_payment"> <label
										class="checkbox" for="final_payment"></label> <label
										for="final_payment">기본 결제수단으로 등록</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- // 결제방법 -->

				<!-- 결제 금액, 결제 및 주문완료 -->
				<div class="step-wrap" id="final_pay_info">
					<div class="step-wrap">
						<div class="title-wrap">
							<h3 class="title-type">
								<strong>최종결제금액</strong>
							</h3>
						</div>

						<div class="total-step">
							<ul>
								<li>
									<p class="tit">총 상품 금액</p>
									<p class="price">
										총가격<em>원</em>
									</p>
								</li>
								<li class="math">-</li>
								<li class="discount">
									<p class="tit">총 할인 금액</p>
									<p class="price" style="color: red;">
										할인가격<em>원</em>
									</p>
								</li>
								<li class="math">=</li>
								<li class="total">
									<p class="tit">총 결제 금액</p>
									<p class="price">
										결제금액<em>원</em>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- // 결제 금액, 결제 및 주문완료 -->

				<!-- 주문하기 버튼 -->
				<div class="btn">
					<button type="submit" id="button">결제하기</button>
				</div>
			</form>
			<!-- //주문하기 버튼 -->
		</article>
		</div>

	<c:import url="../template/footer.jsp"></c:import>

	<script>
	
	// 카카오 페이

    $(document).ready(function () {
      $('#button').click(function () {
        // getter
        var radioVal = $('input[name="pay"]:checked').val();
        if(radioVal == '카카오페이'){
 
        	open('./orderPay')
        	
        	
        }else{
        	
        	alert(' 결제 준비중');
        	
        }
      });

    });
	
	
		$(document).ready(function() {
			// checkbox
			$("input[type='checkbox']").change(function() {
				if ($(this).is(':checked')) {
					$(this).parent().addClass('selected');
					$(this).attr('checked', true);
				} else {
					$(this).parent().removeClass('selected');
					$(this).attr('checked', false);
				}
			});
		});
		function myCoupon() {
			var url = "./myCoupon";
			var name = "popup test";
			var option = "width = 900px, height = 650px , top = 100px, left = 400px, location = no, scrollbars = no, toolbars = no, status = no"
			window.open(url, name, option);
		}
	</script>
</body>
</html>