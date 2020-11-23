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
  <link href ="../resources/css/common/qna.css" rel="stylesheet">
  
  <style type="text/css">
 
  	.qna_control{
			width: 100px;
			height: 50px;
			background-color: #222222;
			text-align: center;
			line-height: 50px;
			font-size: 18px;
			margin-top: 10px;
		}
	
	  .qna_control a{
			color: white;
			font-weight: bold;
		}
		
	#qna_reply_btn{
		background-color: #222222;
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
					<li><a href="${pageContext.request.contextPath}/faq/faqList">고객센터</a></li>
					<li><strong>온라인신문고</strong></li>
				</ol>
			</div>
		</div>
	
		<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
			<li>
				<a href="${pageContext.request.contextPath}/faq/faqList">자주하는질문</a> ㅣ 
				<a href="${pageContext.request.contextPath}/qna/qnaWrite">온라인신문고</a>  
			</li>
		</ul>	

	<div style="margin-top:2%; padding: 0;">

			  <div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="board_writer">이름<span>*</span></label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control" id="board_writer" value="${dto.board_writer}" readonly="readonly">
			    </div>
			  </div>
  				
  			  <div class="col-sm-12 qna_input">
				  <label class="control-label col-sm-2" for="phone">휴대전화<span>*</span></label>
				  <div class="col-sm-6">
				  <input type="text" class="form-control" id="phone" value="${dto.phone}" readonly="readonly">
				  </div>
			  </div>
			 
  			  <div class="col-sm-12 qna_input">
				  <label class="control-label col-sm-2" for="email">이메일<span>*</span></label>
				  <div class="col-sm-6">
				  <input type="email" class="form-control" id="email" value="${dto.email}" readonly="readonly">
				  </div>
			   </div>
  			
  			  
  			   <div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="qna_type">유형분류<span>*</span></label>
				    <div class="col-sm-6">
					<input type="text" class="form-control" id="qna_type" value="${dto.qna_type}" readonly="readonly">  
				    </div>
			   </div>

  			   <div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="branch_info">매장선택<span>*</span></label>
				    <div class="col-sm-6">
					   <input type="text" class="form-control" id="branch_info" value="${dto.branch_info}" readonly="readonly">  
					</div>	   
			   </div>
    
    		  
    		  	<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="order_num">주문번호</label>
				    <div class="col-sm-4">
				    <input type="text" class="form-control" id="order_num" value="${dto.order_num}" readonly="readonly">
				    </div>
				</div>
    
    			<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="board_title">제목<span>*</span></label>
				    <div class="col-sm-6">
				         <input type="text" class="form-control empty" id="board_title" value="${dto.board_title}" readonly="readonly">
				    </div>
				</div>
    
    			<div class="col-sm-12 qna_input qna_contents">
				    <label class="control-label col-sm-2" for="board_contents">글작성<span>*</span></label>
				  
				    <div class="col-sm-6">
  						<textarea class="empty" rows="15" id="board_contents" style="width: 540px; overflow-y: scroll; border: 1px solid #ccc;" readonly="readonly">
  							 ${dto.board_contents} 
  						</textarea>
					</div>
			    </div>
			    
    			<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2"  for="photo">첨부파일</label>
				    
				    <c:forEach items="${dto.boardFileDTOs}" var="file">
			 			<a href="./fileDown?file_Name=${file.file_Name}&ori_Name=${file.ori_Name}">${file.ori_Name}</a>
			 			<br>
					</c:forEach>
					
				</div>
			    
			    <div class="col-sm-12" style="padding: 2%; text-align: center;">
				     <button type="button" id="qna_reply_btn" class="qna_btn">답변메일 쓰기</button>
   				</div>
	</div>
	
		<c:if test="${not empty member and member.member_id eq 'admin'}">
			<div  class="qna_control" style="float: right;">
				<a href="./qnaList">글목록</a>
			</div>
		</c:if>
	</div>
 	<c:import url="../template/footer.jsp"></c:import>
	
	<script type="text/javascript">
		$("#qna_reply_btn").click(function(){
			location.href="./qnaReply";
		})
	</script>	
	
</body>
</html>