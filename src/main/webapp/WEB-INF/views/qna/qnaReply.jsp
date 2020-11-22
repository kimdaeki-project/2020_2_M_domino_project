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
		a{
	color: black;
}	

.order-title-wrap{
	position: relative;
    margin-top: 50px;
}

.order-title{
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	font-size: 32px;
	color: black;
	font-weight: 400;
}

.depth-area{
	position: absolute;
	right: 0;
	
}

.depth-area > ol{
	font-size: 0;
		
}

.depth-area li{
	display: inline-block;
    font-size: 13px;
    color: #888888;	
}

.depth-area > strong{	
	color: #111;	
}

.depth-area li:before{	
	display: inline-block;
    content: '';
    margin: 3px 8px 2px 6px;
    display: inline-block;
    width: 6px;
    height: 6px;
    border-style: solid;
    border-color: transparent #888888 #888888 transparent;
    border-width: 0 1px 1px 0;
    -webkit-transform: rotate(-45deg);
    -ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.depth-area li:nth-child(1):before{
	
	display: none;
}


#select li a{
	font-size: 17px;
}	

		
		.qna_input{
			border-bottom: 2px solid #f5f5f5;
			padding: 2% 0;
		}
		
		.qna_input .control-label{
			padding: 0.5% 0 0 2%;
			text-align: left;
			font-size: 17px;
		}
		
		.qna_input .control-label span{
			color: rgb(255, 20, 60);
		}
		
		.privacy_chk input{
			background: red;
		}
		
		.qna_input .form-control{
			height: 42px;
		}
		
		.qna_input_file input{
			float: right;
			}
		
		.emptyResult{
			padding: 10px 0;
		}
		
		.qna_btn{
			width: 240px;
			height: 50px;
			text-align: center;
			line-height: 50px;
			border: 1px solid #ccc;
			color: white;
		}
		
		#qna_reset_btn{
			background-color: #222222;
		}
		
   		#qna_write_btn{
   			background-color: #ff143c;
   		}
   		
		.privacy_chk *{
			display: inline-block;
		}
	
		.Check0{
			color: blue;
		}
		.Check1{
			color: red;
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
		<form class="form-horizontal" name="a" action="./qnaReplyMail" method="post">

    		<label>업체명</label><input type="text" name="company">
			<label>담당자</label><input type="text" name="name">
			<label>연락처</label><input type="text" name="number">
			<label>이메일</label><input type="text" name="email">
			<label>제목</label><input type="text" name="subject">
			<label>내용</label><input type="text" name="content">
			<input type="button" value="메일발송" onclick="check()">
			<input type="hidden" name="to" value="nam1738@naver.com"> // 여기에 자신의 이메일 계정
			<input type="hidden" name="from" value="nam1738@naver.com">// 여기에 자신의 이메일 계정	           
	</form>
	
	</div>
	</div>
	<a href="./qnaList">목록</a>
 	<c:import url="../template/footer.jsp"></c:import>
	
		<script>  
 		function check() {
   		 document.a.submit();
			}
		</script>
	
</body>
</html>