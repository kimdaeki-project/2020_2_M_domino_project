<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container.fluid" id="header_wrap">
<header class="text-center header1">    
	<nav class="container navbar navbar-inverse">
	 
	    <div class="navbar-header">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}"><img alt="" src="${pageContext.request.contextPath}/resources/images/common/logo.png"></a>
	    </div>
	    
	    <div class="collapse navbar-collapse" id="myNavbar1" style="padding: 0;">
	      <ul class="nav navbar-nav navbar-right">
	      <c:choose>
	      	<c:when test="${not empty member}">
	       		<li><a href="${pageContext.request.contextPath}/member/memberLogout"><span class="glyphicon"></span> 로그아웃</a></li>
	       		<li><a href="${pageContext.request.contextPath}/member/memberPage"><span class="glyphicon"></span> 나의정보</a></li>
	       		<li><a href="#"><span class="glyphicon"></span><img src="${pageContext.request.contextPath}/resources/images/common/cart_icon.png"></a></li> 	    		
	      	</c:when>
	      		
	      	<c:otherwise> 
	      		 ${sessionScope.token}
    			 <a href = "${pageContext.request.contextPath}/logout/">카카오로그아웃</a><br>
	      		<li><a href="${pageContext.request.contextPath}/member/memberLogin"><span class="glyphicon"></span> 로그인</a></li>
	       		<li><a href="${pageContext.request.contextPath}/member/memberJoin"><span class="glyphicon"></span> 회원가입</a></li>	
	      	</c:otherwise>
	      </c:choose>
	        
	      </ul>
	    </div>
	</nav>
</header>


<header class="header2 lnb" style="border-bottom: 1px solid #e4e4e4;">
	<div class="container text-center">
	<div class="col-sm-12" id="myNavbar2">
		  <ul id="myNavbar2_ul">
		        <li><a href="${pageContext.request.contextPath}/menu/list/pizzaList">메뉴</a></li>
		        <li><a href="#">e-쿠폰</a></li>
		        <li><a href="#">상품권 선물</a></li>
		        <li><a href="#">이벤트 제휴</a></li>
		        <li><a href="${pageContext.request.contextPath}/branch/branchSearch'">매장검색</a></li>
		        <li style="float: right; padding-right: 0;"><a href="#" id="nav_more">더보기&or;</a></li>
	      </ul>
	      
	      
	      <div id="sub_nav_wrap">	      
	      		<div class="col-sm-12" id="sub_nav">
			   		<div class="col-sm-2 myNavbar3">
			    		<a href="#" class="inners_title">도미노 서비스</a>
			    			<ul>
						        <li><a href="#">매니아 혜택</a></li>
								<li><a href="#">도미노 모멘트</a></li>
								<li><a href="#">퀵 오더</a></li>
								<li><a href="#">단체주문 서비스</a></li>
						    </ul>
			    	</div>
			    	
			    	<div class="col-sm-2 myNavbar3">
			    		<a href="#" class="inners_title">고객센터</a>
			    			<ul>
						       <li><a href="${pageContext.request.contextPath}/faq/faqList">자주하는 질문</a></li>
							   <li><a href="${pageContext.request.contextPath}/qna/qnaWrite">온라인 신문고</a></li>
						    </ul>
			    	</div>
			    	 
			    	<div class="col-sm-2 myNavbar3">
			    		<a href="#" class="inners_title">회사소개</a>
			    		    <ul>
						       <li><a href="#">한국도미노피자</a></li>
							   <li><a href="#">광고갤러리</a></li>
							   <li><a href="#">사회공헌활동</a></li>
							   <li><a href="#">가맹점 모집</a></li>
							   <li><a href="#">인재채용</a></li>
						   </ul>
			    	</div>
			    	
			    	<div class="col-sm-2 myNavbar3">
			    		<a href="${pageContext.request.contextPath}/dominoNews/dominoNewsList" class="inners_title">공지사항</a>
			    			<ul>
						      <li><a href="${pageContext.request.contextPath}/dominoNews/dominoNewsList">도미노뉴스</a></li>
							  <li><a href="${pageContext.request.contextPath}/press/pressList">보도자료</a></li>
						   </ul>
			    	</div>
		 	 </div> 
	 	 </div>
	</div>
	</div>

</header>
</div>
