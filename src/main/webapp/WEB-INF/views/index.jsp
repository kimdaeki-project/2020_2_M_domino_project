<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Dominos_t1</title>
  <meta charset="utf-8">
  <c:import url="./template/bootstrap.jsp"></c:import>
  <link href ="./resources/css/common/default.css" rel="stylesheet">
  <script src="./resources/js/header.js"></script>
</head>
<body>

<c:import url="./template/header.jsp"></c:import>

 <div id="myCarousel" class="carousel slide" data-ride="carousel">
	 <!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
		</ol>
			
	  <!-- Wrapper for slides -->
		<div class="carousel-inner">
		    <div class="item active">
			    <img src="./resources/images/index/main1.jpg" alt="" style="width:100%;">
			</div>
			
			<div class="item">
			    <img src="./resources/images/index/main2.jpg" alt="" style="width:100%;">
			</div>
			    
			<div class="item">
			     <img src="./resources/images/index/main3.jpg" alt="" style="width:100%;">
			</div>
			      
			<div class="item">
			     <img src="./resources/images/index/main4.jpg" alt="" style="width:100%;">
			</div>
			      
		    <div class="item">
			     <img src="./resources/images/index/main5.jpg" alt="" style="width:100%;">
			</div>
			
		    <div class="item">
			     <img src="./resources/images/index/main6.jpg" alt="" style="width:100%;">
			</div>
		 </div>
			
	    <!-- Left and right controls -->
			 <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			     <span class="glyphicon glyphicon-chevron-left"></span>
			     <span class="sr-only">Previous</span>
			 </a>
			 
			 <a class="right carousel-control" href="#myCarousel" data-slide="next">
			     <span class="glyphicon glyphicon-chevron-right"></span>
			     <span class="sr-only">Next</span>
			 </a>
</div>
  
<div class="container text-center">    
	  <div class="row">
	  
	  	 <div class="col-sm-6 order_wrap">
	  	  
	      <a href="${pageContext.request.contextPath}/address/delivery">
	      <img alt="" src="${pageContext.request.contextPath}/resources/images/index/order1.png" style="display: block;">
	      <span id="order1" class="order_text1">배달 주문 &ogt;</span></a>
	       <p class="order_text2">등급별 최대 30%</p>
	    </div>
	    
	     <div class="col-sm-6 order_wrap">
	      <a href="${pageContext.request.contextPath}/address/pickup">
	      <img alt="" src="${pageContext.request.contextPath}/resources/images/index/order2.png" style="display: block;">
	      <span id="order2" class="order_text1">포장 주문 &ogt;</span></a>
	      <p class="order_text2">등급별 최대 40%</p>
	    </div>
	    
	     <div class="col-sm-4 domichat_wrap">
	     <img alt="" src="${pageContext.request.contextPath}/resources/images/index/chat1.png" style="display: block;">
	      <a href="#"><span class="chat_text1">도미챗 주문 &ogt;</span></a>
	      <p class="chat_text2">빠르고 간편한 채팅 주문 서비스</p>
	    </div>
	    
	     <div class="col-sm-4 domichat_wrap">
	     <img alt="" src="${pageContext.request.contextPath}/resources/images/index/chat2.png" style="display: block;">
	      <a href="#"><span class="chat_text1">퀵오더 &ogt;</span></a>
	      <p class="chat_text2">자주이용하는 메뉴를 <br> 더 빠르게 준비해보세요! </p>
	    </div>
	    
	     <div class="col-sm-4 domichat_wrap">
	     <img alt="" src="${pageContext.request.contextPath}/resources/images/index/chat3.png" style="display: block;">
	      <a href="#"><span class="chat_text1">드라이빙 픽업주문 &ogt;</span></a>
	      <p class="chat_text2">고객님의 차로 직접 <br>피자를 가져다드립니다~</p>
	    </div>
	   </div>
</div>

<div class="jumbotron card_wrap">
  <div class="container text-center">
    <div class="row">
   			 <div class="col-sm-3 card_wrap_inner">
   			 
   			 	 <c:choose>
	      			<c:when test="${not empty member or not empty sessionScope.token or not empty sessionId}">
						<h3 id="mName">${member.member_name}님 현재등급</h3>
						<div class="myCheck"><p id="mLevel" style="font-weight: bold; font-size: 50px;">${member.member_level}</p></div>
					</c:when>
					
					<c:otherwise>
						<p class="card_text1">도미노피자의<br><strong>특별한 매니아 혜택</strong><br>누려보세요!</p>
		       			<div class="card_wrap_login">
							<a href="${pageContext.request.contextPath}/member/memberLogin" >로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
   			 </div>
    
			 <div class="col-sm-3 card_img" >
			    <a href="#"><img src="./resources/images/index/main_card1.png" class="img-responsive" style="width:100%" alt="Image"></a>
			 </div>
			    
			 <div class="col-sm-3 card_img">
			    <a href="#"><img src="./resources/images/index/main_card2.gif" class="img-responsive" style="width:100%" alt="Image"></a>
			 </div>
			    
			 <div class="col-sm-3 card_img">
			    <a href="#"><img src="./resources/images/index/main_card3.png" class="img-responsive" style="width:100%" alt="Image"></a>
			 </div>
	</div>
</div>
</div>
 
<div class="container text-center event_wrap">    
  <div class="row"> 
    <div class="col-sm-4">
      <a href="#"><img src="./resources/images/index/event1.jpg" class="img-responsive" style="width:100%" alt="Image"></a>
    </div>
    <div class="col-sm-4"> 
      <a href="#"><img src="./resources/images/index/event2.jpg" class="img-responsive" style="width:100%" alt="Image"></a>
    </div>
     <div class="col-sm-4"> 
      <a href="#"><img src="./resources/images/index/event3.jpg" class="img-responsive" style="width:100%" alt="Image"></a>  
    </div>
  </div>
</div>


<c:import url="./template/footer.jsp"></c:import>

</body>
</html>