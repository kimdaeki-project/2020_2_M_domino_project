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
			border-bottom: 2px solid black;
			padding: 20px 0;
		}		
		.detail_page span{
			float: right;
			font-size: 15px;
			padding: 1% 0;
		}
		
		.detail_page_Link {	
			text-align: left;
			color: black;
			padding: 0;
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
		
		.privacy_chk *{
			display: inline-block;
		}
		
		
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	
	<div class="detail_page">
			<h2>고객센터<span style="font-size: 12px;">홈>고객센터>온라인 신문고</span></h2>
					
			<div class="detail_page_Link">
				<a href="#">자주하는 질문</a><a href="#">온라인신문고</a>
			</div>
	  </div>
	
	<div>
		<p style="font-weight: bold;">도미노피자를 이용하시면서 느꼈던 불편한 점이나 건의사항, 제품에 대한 의견을 남겨주시면 성심껏 답변해드리겠습니다.<br>
		※주문 취소/변경과 같은 긴급한 요청은 매장으로 연락 부탁드립니다.</p>
		<p class="txt_faq" style="color:red;">도미노피자 고객만족센터 <strong>080-860-3082</strong></p>
	</div>
	
	<div>
		<div class="col-sm-12" style="max-height: 180px; overflow-y: scroll; background: #f5f5f5; padding: 2%; font-size: 14px;">
			개인정보보호정책은 청오디피케이㈜에서 운영하는 도미노피자 홈페이지 서비스(이하 도미노)를 이용하는 고객님의 개인정보 보호를 위하여, 
			개인정보 수집의 목적과 그 정보의 정책적 , 시스템적 보안에 관한 규정입니다.<br><br>

			* 개인정보의 수집 및 이용목적<br><br>

			1. 도미노는 고객님께서 신문고 서비스를 이용하는데 있어, 원활하게 문의사항의 
			접수 및 답변이 이루어질 수 있도록 하기 위한 최소한의 정보를 수집합니다.<br><br>

			2. 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않습니다.<br><br>

			* 수집하는 개인정보의 항목<br><br>

			이름, 휴대전화, 이메일 : 고지의 전달 또는 원활한 의사소통 경로의 확보.<br><br>

			* 보유기간 및 이용기간<br><br>

			귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.<br><br>

			- 소비자의 불만 또는 분쟁처리에 관한 기록<br>
			보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
			보존 기간 : 3년<br><br>
						
			* 온라인 신문고 서비스 이용에 필요한 최소한의 개인정보 수집·이용에 동의하지 않을 권리가 있으며, 동의 거부 시 거부한 내용에 대해 서비스가 제한될 수 있습니다.
		</div>
		
		
		<div class="col-sm-12" style="padding-top: 1%;">
			<div class="privacy_chk" class="col-sm-3" style="float: right; padding: 0;">
				<div class="form">
					<div class="chk-box">
						<input type="radio" id="agree_yes" name="agree">
						<label for="agree_yes" class="checkbox"></label>
						<label for="agree_yes">동의함</label>
					</div>
						
					<div class="chk-box selected">
						<input type="radio" id="agree_no" name="agree" checked="checked">
						<label class="checkbox" for="agree_no"></label>
						<label for="agree_no">동의하지 않음</label>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
	<div style="margin-top:2%; border-top: 2px solid black; padding: 0;">
		<form class="form-horizontal" action="./qnaWrite" method="post" enctype="multipart/form-data">
			  
			  <div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="board_writer">이름<span>*</span></label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control" id="board_writer" name="board_writer" >
			    </div>
			  </div>
  				
  			  <div class="col-sm-12 qna_input">
				  <label class="control-label col-sm-2" for="phone">휴대전화<span>*</span></label>
				  <div class="col-sm-6">
				  <input type="text" class="form-control" id="phone" name="phone">
				  </div>
			  </div>
			 
  			  <div class="col-sm-12 qna_input">
				  <label class="control-label col-sm-2" for="email">이메일<span>*</span></label>
				  <div class="col-sm-6">
				  <input type="text" class="form-control" id="email" name="email">
				  </div>
			   </div>
  			
  			  
  			   <div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="qna_type">유형분류<span>*</span></label>
				    <div class="col-sm-6">
				    <input type="text" class="form-control empty" id="qna_type" name="qna_type">
				    </div>
			   </div>
  
  			 
  			   <div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="branch_info">매장선택<span>*</span></label>
				    <div class="col-sm-6">
				     <input type="text" class="form-control empty" id="branch_info" name="branch_info">
				    </div>
			   </div>
    
    		  
    		  	<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="order_num">주문번호</label>
				    <div class="col-sm-4">
				    <input type="text" class="form-control empty" id="order_num" name="order_num">
				    </div>
				</div>
    
    			<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="board_title">제목<span>*</span></label>
				    <div class="col-sm-6">
				         <input type="text" class="form-control empty" id="board_title" name="board_title">
				    </div>
				</div>
    
    			<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2" for="board_contents">글작성<span>*</span></label>
				    <div class="col-sm-6">
  						<textarea class="form-control" rows="15" id="board_contents" name="board_contents"></textarea>
					</div>
			    </div>
			    
    
    			<div class="col-sm-12 qna_input">
				    <label class="control-label col-sm-2"  for="photo">첨부파일</label>
				    <div class="col-sm-4 qna_input_file">
				    <input type="file" class="form-control" id="photo1" name="photo">
				    <input type="file" class="form-control" id="photo2" name="photo">
				    <input type="file" class="form-control" id="photo3" name="photo">
				    </div>
				</div>
			    
			    <div class="col-sm-12" style="padding: 2%; text-align: center;">
			    <button type="reset" class="btn btn-default">다시쓰기</button>
   				<button type="submit" class="btn btn-danger">보내기</button>
   				</div>
	</form>
	</div>
	</div>
	
 	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>