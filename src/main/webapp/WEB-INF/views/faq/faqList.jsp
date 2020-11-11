<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>

	<style type="text/css">
		.detail_page{
			margin-top: 2%;
			border-bottom: 2px solid black;
		}		
		.detail_page span{
			float: right;
			font-size: 15px;
			padding: 1% 0;
		}
		
		.detail_page_Link {	
			text-align: left;
			color: black;
		}
	
		.faqnav ul{
			background-color: #f5f5f5; 
			border: none;
			margin-bottom: 3px;
		}
		
		.faqnav li{
			margin-right: 1px;
		}
		
		.faqnav ul a{
			font-size: 16px;
			color: gray;
			font-weight: bold;
		}
		
		.faqnav li.active a {
   			background: #222;
    		color: #fff;
   		}
	
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container detail_page">
		<h2>고객센터<span>홈>매장검색</span></h2>
		
		<div class="container detail_page_Link" style="padding-bottom: 2%;">
		<a href="#">자주하는 질문</a>|<a href="">온라인신문고</a>
		</div>
	</div>
	
	<div class="container" style="padding: 1% 0";>
		<div class="container" style="border-bottom: 1px solid #888; margin-bottom: 3%; padding: 1% 0 2% 0;">
			<p>도미노피자에 대한 궁금증을 바로 확인하실 수 있습니다.</p>
			<p class="txt_faq">도미노피자 고객만족센터 <a href="#">080-860-3082</a></p>
		</div>
		
		<div class="container faqnav">
		  <ul class="nav nav-pills nav-justified">
		   		<li class="active"><a href="#">피자 주문하기</a></li>
				<li><a href="#">주문확인</a></li>
				<li><a href="#">포장 주문</a></li>
				<li><a href="#">피자 선물하기</a></li>
		  </ul>
	
		  <ul class="nav nav-pills nav-justified" style="background-color: #f5f5f5; border: none;">
				<li><a href="#">도미노콘</a></li>
				<li><a href="#">피자 상품권</a></li>
				<li><a href="#">홈페이지 관련</a></li>
				<li><a href="#">배달서비스 평가</a></li>
		  </ul>
		</div>
	</div>
	
	<div class="container">
  <h2>Dynamic Tabs</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a href="#home">Home</a></li>
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
});
</script>
	
	<div class="container" style="border-top: 2px solid black;">
	
		<c:forEach items="${list}" var="dto" varStatus="vs">
			<div class="col-sm-12" style="border-bottom:  1px solid #888; height: 80px; padding: 1% 0;">
				 <div class="col-sm-12">
				 	${dto.board_title} <a href="#" class="btn faq_more" style="float: right">&or;</a>
				 </div>
			 </div>	 
			 
			 <div class="col-sm-12 faq_contents" style="background-color: #f5f5f5; height: 80px;">
				 	${dto.board_contents}
			</div>		
		 </c:forEach>	
		 </div>
	
	
	<a href="./faqWrite" class="btn btn-danger">faqWrite</a>
 	<c:import url="../template/footer.jsp"></c:import>
	
	<script type="text/javascript">
	 $(function(){
			$('.faq_contents').hide();
			$('.faq_more').click(function(){
				$('.faq_contents').slideToggle();
			});
		});
	</script>
</body>
</html>