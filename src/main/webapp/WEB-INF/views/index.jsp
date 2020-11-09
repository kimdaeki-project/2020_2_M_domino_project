<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script language="JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href ="./resources/css/common/default.css" rel="stylesheet">

<script>
	$(function(){
		$('#sub_nav').hide();
		$('.nav_more').click(function(){
			$('#sub_nav').slideToggle();
		});
	});
</script>

<script>$(document).ready(function(){$('.rollimgs').bxSlider();});</script>

</head>
<body>
	<div class="container">
	
	
	<c:import url="./template/header.jsp"></c:import>

	<section id="content">
		<section id="section1">
			<div class="img_wrap">
				 <ul class="rollimgs">
               		<li><img src="./resources/images/index/main1.jpg"></img></li>
					<li><img src="./resources/images/index/main2.jpg"></img></li>
					<li><img src="./resources/images/index/main3.jpg"></img></li>
					<li><img src="./resources/images/index/main4.jpg"></img></li>
					<li><img src="./resources/images/index/main5.jpg"></img></li>
					<li><img src="./resources/images/index/main6.jpg"></img></li>
					</ul>
			</div>
		</section>
		
		<section id="section2" class="sections">
			<div id="section2_wrap" class="section_wraps">
				<div id="section2_inner1">
					<a href="#"><span class="text">배달 주문 &ogt;</span></a>
					<p class="delivery_box">등급별 최대 30%
					</p>
				</div>
				<div id="section2_inner2">
					<a href="#"><span class="text">포장 주문 &ogt;</span></a>
					<p class="delivery_box">등급별 최대 40%</p>
				</div>
			</div>
		</section>
		
		<section id="section3" class="sections">
			<div id="section3_wrap" class="section_wraps">
				<div id="section3_inner1">
					<a href="#"><span class="text">도미챗 주문 &ogt;</span></a>
					<p class="domichat_box">빠르고 간편한 채팅 주문 서비스</p>
				</div>
				
				<div id="section3_inner2">
					<a href="#" ><span class="text">퀵오더 &ogt;</span></a>
					<p class="domichat_box">자주이용하는 메뉴를 <br> 더 빠르게 준비해보세요! </p>
				</div>
				
				<div id="section3_inner3">
					<a href="#"><span class="text">드라이빙 픽업주문 &ogt;</span></a>
					<p class="domichat_box">고객님의 차로 직접 <br>피자를 가져다드립니다~</p>
				</div>
			</div>
		</section>
		
		<section id="section4" class="sections">
			<div id="section4_wrap" class="section_wraps">
				<div class="section4_inners1">
					<div class="login_before">
						<div class="title_wrap">
							<p>도미노피자의<br><strong>특별한 매니아 혜택</strong><br>누려보세요!</p>
						</div>
						<div class="btn_wrap">
							<a href="#" >로그인</a>
						</div>
					</div>
				</div>

				<div class="section4_inners2">
					<div class="card_box">
						<div>
							<a href="#"><img src="./resources/images/index/main_card1.png"></img></a>
						</div>
						<div>
							<a href="#"><img src="./resources/images/index/main_card2.gif"></img></a>
						</div>
						<div>
							<a href="#"><img src="./resources/images/index/main_card3.png"></img></a>
						</div>
						<div>
							<a href="#"><img src="./resources/images/index/main_card4.png"></img></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section id="section5">
			<div id="section5_wrap" >
				<div class="section5_inners">
					<a href="#"><img src="./resources/images/index/event1.jpg"></img></a>
				</div>
				<div class="section5_inners">
					<a href="#"><img src="./resources/images/index/event2.jpg"></img></a>
				</div>
				<div class="section5_inners">
					<a href="#"><img src="./resources/images/index/event3.jpg"></img></a>
				</div>
			</div>
		</section>

	</section>

	<c:import url="./template/footer.jsp"></c:import>
	</div>

	

</body>
</html>