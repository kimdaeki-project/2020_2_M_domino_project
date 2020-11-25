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
  	.write_control{
		width: 100px;
		height: 50px;
		background-color: #222222;
		color: white;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
		margin-right: 5px;
	}

  </style>	
	
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h2 style="text-align: center;">FAQ 글 작성</h2>
		  	<form id="frm" action="./faqWrite" method="post" style="padding: 10px 0;">
		  	<div class="form-group">
		      <label for="title">FaqType</label>
		      <select name="faq_type" style="width:120px; height: 40px;">
		      	<option value="1">피자주문하기</option>
		      	<option value="2">주문확인</option>
		      	<option value="3">포장주문</option>
		      	<option value="4">피자선물하기</option>
		      	<option value="5">도미노콘</option>
		      	<option value="6">피자상품권</option>
		      	<option value="7">홈페이지관련</option>
		      	<option value="8">배달서비스평가</option>
		      </select>
		    </div>

		    <div class="form-group">
		      <label for="title">Title</label>
		      <input type="text" class="form-control empty" id="title" name="board_title" title="제목">
		    </div>
		    
		    <div class="form-group">
		      <label for="writer">Writer</label>
		      <input type="text" class="form-control" id="writer" name="board_writer" value="${member.member_id}" readonly="readonly">
		    </div> 
		    
		    <div class="form-group">
		      <label for="contents">Contents</label>
		      <textarea class="form-control empty" rows="20" cols="30" id="contents" name="board_contents" title="내용"></textarea>
		    </div>
	
			<div id="faq_submit_btn" style="float: right;" >
			 	 <input type="button" class="write_control" value="글작성">
			</div>
		  	</form>
			
		</div>
		 	
		<c:import url="../template/footer.jsp"></c:import>
		 	
		 <script>
			 var emptyCheckResult = true;
				$("#faq_submit_btn").click(function(){
					emptyCheck();
					if(emptyCheckResult){
						$("#frm").submit();
					}
				});
			
			function emptyCheck(){
				emptyCheckResult=true;
				$(".empty").each(function(){
					var data = $(this).val();
					if(data==''){
						emptyCheckResult=false;
						var title = $(this).attr("title");
						alert(title+"을 입력하세요");
					}
				});
			}
			
		 </script>
			
</body>
</html>