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
  <link href ="../resources/css/common/board.css" rel="stylesheet">
<style type="text/css">
		.faqnav ul{
			background-color: #f5f5f5; 
			border: none;
			margin-bottom: 3px;
		}
		
		#msg{
			margin-left: 5px;
			margin-right: 5px;
		}
		
		.txt_faq{
			color: red;
		}
		
		.faqnav ul a{
			font-size: 16px;
			color: #888888;
		}
		
		.faq_control{
			width: 100px;
			height: 50px;
			background-color: #222222;
			text-align: center;
			line-height: 50px;
			font-size: 18px;
			margin-top: 10px;
		}
	
		.faq_control a{
			color: white;
			font-weight: bold;
		}
		
		.faq_question{
			border-bottom:  1px solid #888; height: 80px; padding: 15px 10px;
		} 
		
		 .faq_answer{
			border-bottom:  1px solid #888; height: 100px; padding: 15px 10px;
		} 
		
		#faq_selected {
			background-color: #333333;
			color: white;
		}
	</style>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	  <div class="order-title-wrap">
		<h2 class="order-title">고객센터</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=1">고객센터</a></li>
					<li><strong>자주하는질문</strong></li>
				</ol>
			</div>
		</div>
		
		<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
			<li>
				<a href="${pageContext.request.contextPath}/faq/faqList?faq_type=1">자주하는질문</a> ㅣ 
				<a href="${pageContext.request.contextPath}/qna/qnaWrite">온라인신문고</a>  
			</li>
		</ul>	
		

	  <div style="padding: 1% 0;">
		 <div style="border-bottom: 1px solid #888; margin-bottom: 3%; padding: 1% 0 2% 0;">
			<p>도미노피자에 대한 궁금증을 바로 확인하실 수 있습니다.</p>
			<p class="txt_faq">도미노피자 고객만족센터 <a href="#">080-860-3082</a></p>
		 </div>

					
		 <div class="faqnav">
			  <ul class="nav nav-pills nav-justified">
			   		<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=1" <% if ("1".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %> >피자 주문하기</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=2" <% if ("2".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %>>주문확인</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=3"<% if ("3".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %>>포장 주문</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=4" <% if ("4".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %>>피자 선물하기</a></li>
			  </ul>
		
			  <ul class="nav nav-pills nav-justified" style="background-color: #f5f5f5; border: none;">
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=5" <% if ("5".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %>>도미노콘</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=6" <% if ("6".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %>>피자 상품권</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=7" <% if ("7".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %> >홈페이지 관련</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList?faq_type=8" <% if ("8".equals(request.getParameter("faq_type"))) { %>id="faq_selected"<% } %>>배달서비스 평가</a></li>
			  </ul>
		 </div>
			
	</div>
	
	<div style="border-top: 2px solid black;" id="faq_result">
	
		<c:forEach items="${list}" var="dto" varStatus="vs">
		
		<div>
			<div class="col-sm-12 faq_question">
				 <div class="col-sm-12">
				 
				 	<c:if test="${not empty member and member.member_id eq 'admin'}">
					 	<a href="#a" id="faq_del_btn${dto.board_num}" class="faq_del_btn" title="${dto.board_num}">
					 		<img alt="" src="${pageContext.request.contextPath}/resources/images/common/remove.png">
					 	</a>
				 	</c:if>
				 	
				 	<strong style="color:#238ece; padding-right: 10px;">Q</strong> 
				 	<strong style="color:black;">${dto.board_title} </strong>
				 	<a href="#a" class="btn faq_more" id="faq_more${dto.board_num}" title="${dto.board_num}" style="float: right">&or;</a>
				 </div>
			 </div>	 
			 
			 <div class="col-sm-12 faq_answer" id="faq_answer${dto.board_num}" title="${dto.board_num}" style="background-color: #f5f5f5;">
			 	<div class="col-sm-12">
				 	<strong style="color:#ff143c;  padding-right: 10px;">A</strong>
				 	<strong style="color:black;"><span style="font-size: 12px;"> ${dto.board_contents}</span></strong>
				 </div>
			 </div>	
			 
		</div>	
		 </c:forEach>	
	</div>
	
	<c:if test="${not empty member and member.member_id eq 'admin'}">
		<div  class="faq_control" style="float: right;">
			<a href="./faqWrite">글작성</a>
		</div>
	</c:if>
	
	</div>

 	<c:import url="../template/footer.jsp"></c:import>
	
	<script>
	
		//faq Toggle
		var num = $(this).attr("title"); 
		
		$(document).ready(function(){
	  	$(".faqnav li a").click(function(){
	  		 $(this).attr("id","selected");
	   		 $(this).tab('show');
	  	});
	  	
	  	$('.faq_answer').hide();
		});
		
		$('.faq_more').click(function(){
				var num = $(this).attr("title"); 
				$('#faq_answer'+num).slideToggle();
			});
		
		
		//faq Delete
		$("#faq_result").on("click",".faq_del_btn", function(){
			var board_num = $(this).attr("title");
			var check= confirm("정말로 삭제하겠습니까?");
			
			if(check){
				$.post("./faqDelete",{board_num:board_num}, function(data){
					data=data.trim();
					if(data>0){		
						alert("삭제 성공했습니다.");
						location.reload();
					}
					else{
						alert("삭제 실패했습니다.");
					}
				});
			}
			else{
				return false;
			}
			
		});
		
	</script>
</body>
</html>