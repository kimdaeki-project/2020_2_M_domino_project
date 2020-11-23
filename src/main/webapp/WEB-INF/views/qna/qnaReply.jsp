<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <title>Dominos_t1</title>
 <c:import url="../template/bootstrap.jsp"></c:import>
 <link href ="../resources/css/common/default.css" rel="stylesheet">
 <script src="../resources/js/header.js"></script>
 <link href ="../resources/css/common/board.css" rel="stylesheet">
 <link href ="../resources/css/common/qna.css" rel="stylesheet">
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
					<li><strong>온라인신문고</strong></li>
				</ol>
			</div>
		</div>
	
		<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
			<li>
				<a href="${pageContext.request.contextPath}/faq/faqList?faq_type=1">자주하는질문</a> ㅣ 
				<a href="${pageContext.request.contextPath}/qna/qnaWrite">온라인신문고</a>  
			</li>
		</ul>	
		
	   <div>
	   <form action="${pageContext.request.contextPath}/mail/mailSending" method="post">
	    <div class="col-sm-12 qna_input">
				<label class="control-label col-sm-2" for="board_to">받는 분</label>
				<div class="col-sm-6">
					<input type="text" name="tomail" size="120" style="width:100%" class="form-control">
				</div>
		</div>
		
		<div class="col-sm-12 qna_input">
				<label class="control-label col-sm-2" for="board_title">제목</label>
				<div class="col-sm-6">
					 <input type="text" name="title" size="120" style="width:100%" class="form-control" >
				</div>
		</div>
		
		<div class="col-sm-12 qna_input">
				<label class="control-label col-sm-2" for="board_content">내용</label>
				<div class="col-sm-6">
					 <textarea name="content" style="width: 540px; height: 400px; overflow-y: scroll; resize:none" class="form-control">
					 </textarea>
				</div>
		</div>
		
		<div class="col-sm-12" style="padding: 2%; text-align: center;">
	   			<button type="submit" id="qna_mail_btn" class="qna_btn" style="background-color: #222222;">메일 보내기</button>
   		</div>
	    
	  </form>
	  </div>
	  
	</div>
	<c:import url="../template/footer.jsp"></c:import>
	
	<script type="text/javascript">
		
	
	
	</script>
</body>
</html> 