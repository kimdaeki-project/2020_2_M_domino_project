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
			margin-bottom: 1%;
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
		
		.detail_page_Link a{
			
		}
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container detail_page">
		<h2>고객센터<span>홈>매장검색</span></h2>
		
		<div class="container detail_page_Link">
		<a href="#">자주하는 질문</a> <a href="">온라인신문고</a>
		</div>
	</div>
	
	<div class="container">
		<p>도미노피자를 이용하시면서 느꼈던 불편한 점이나 건의사항, 제품에 대한 의견을 남겨주시면 성심껏 답변해드리겠습니다.</p>
		<p>※주문 취소/변경과 같은 긴급한 요청은 매장으로 연락 부탁드립니다.</p>
		<p class="txt_faq">도미노피자 고객만족센터 <a href="tel:080-860-3082">080-860-3082</a></p>
	</div>
	
	<div class="container">
	개인정보 수집 및 이용동의 
	
	</div>
	
	<div class="container">
		<form class="form-horizontal" action="./qnaWrite" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="board_writer">이름</label>
			    <div class="col-sm-10">
			       <input type="text" class="form-control" id="board_writer" name="board_writer" >
			    </div>
			  </div>
  
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="phone">휴대전화</label>
			     <div class="col-sm-10">
			     <input type="text" class="form-control" id="phone" name="phone">
			    </div>
			    </div>
  
			    <div class="form-group">
			    <label class="control-label col-sm-2" for="email">이메일</label>
			    <div class="col-sm-10">
			    <input type="text" class="form-control" id="email" name="email">
			    </div>
			    </div>
  
			    <div class="form-group">
			    <label class="control-label col-sm-2" for="qna_type">유형분류</label>
			    <div class="col-sm-10">
			    <input type="text" class="form-control empty" id="qna_type" name="qna_type">
			    </div>
			    </div>
  
			    <div class="form-group">
			    <label class="control-label col-sm-2" for="branch_info">매장선택</label>
			    <div class="col-sm-10">
			     <input type="text" class="form-control empty" id="branch_info" name="branch_info">
			    </div>
			    </div>
    
			    <div class="form-group">
			    <label class="control-label col-sm-2" for="order_num">주문번호</label>
			    <div class="col-sm-10">
			    <input type="text" class="form-control empty" id="order_num" name="order_num">
			    </div>
			    </div>
    
			    <div class="form-group">
			    <label class="control-label col-sm-2" for="board_title">제목</label>
			    <div class="col-sm-10">
			         <input type="text" class="form-control empty" id="board_title" name="board_title">
			    </div>
			    </div>
    
			    <div class="form-group">
			    <label class="control-label col-sm-2" for="board_contents">글작성</label>
			    <div class="col-sm-10">
			     <input type="text" class="form-control empty" id="board_contents" name="board_contents">
			    </div>
			    </div>
    
    
			    <div class="form-group">
			    <label class="control-label col-sm-2"  for="photo">첨부파일</label>
			    <div class="col-sm-10">
			    <input type="file" class="form-control" id="photo" name="photo">
			    </div>
			    </div>
			    
			    <button type="reset" class="btn btn-default">다시쓰기</button>
   				<button type="submit" class="btn btn-danger">보내기</button>
	</form>
	</div>
	
 	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>