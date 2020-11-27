<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <link href ="../resources/css/common/member.css" rel="stylesheet">
  <link href ="../resources/css/common/qna.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
 <c:import url="../template/header.jsp"></c:import>

<style type="text/css">
	#select li a{
		font-size: 17px;
	}
</style>


</head>
<body>
	<div class="container">
	
	<div class="order-title-wrap">
		<h2 class="order-title">나의정보</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="../member/memberPage">나의정보</a></li>
					<li><strong>1:1문의</strong></li>
				</ol>
			</div>
		</div>
	
	<ul id="select" style="padding: 20px 0;">
		<li>
		<a href="../member/memberPage">매니아 등급</a> ㅣ 
		<a href="../member/memberOrder">주문 내역</a> ㅣ 
		<a href="#">쿠폰함</a> ㅣ 
		<a id="inq" href="./memberInquirly">1:1 문의</a> ㅣ 
		<a href="../member/memberCheck">정보 수정</a> 
		</li>
	</ul>
	
	<div class="myLevel">
		<div class="myCheck">${member.member_name}님께서 문의하신 내용입니다.</div>
	</div>
	
	<div style="margin-top:2%; border-top: 2px solid black; padding: 0;">
			
			<input type="number" value="${dto.inq_num}" name="inq_num" class="none">
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="member_name">이름</label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control empty" name="member_name" value="${member.member_name}" readonly="readonly" >
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="member_id">아이디</label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control empty" name="member_id" value="${member.member_id}" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="member_phone">연락처</label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control empty" name="member_phone" value="${member.member_phone}" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="member_email">이메일</label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control empty" name="member_email" value="${member.member_email}" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="inq_type">문의유형</label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control empty" value="${dto.inq_type}" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="inq_type">매장검색</label>
			    <div class="col-sm-4">
			       <input type="text" class="form-control empty" value="${dto.inq_shop} : ${dto.inq_location}" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="inq_title">제목</label>
			    <div class="col-sm-6">
			       <input type="text" class="form-control empty" name="inq_title" value="${dto.inq_title}" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="inq_contents">문의내용</label>
			    <div class="col-sm-6">
			    	<textarea rows="10" cols="40" name="inq_contents" class="divText" readonly="readonly">${dto.inq_contents}</textarea>
			    </div>
			</div>
			
			<div class="col-sm-12 qna_input">
			    <label class="control-label col-sm-2" for="inq_title">답변</label>
			    <div class="col-sm-6">
			    		<textarea rows="10" cols="40" name="inq_reply" class="divText" readonly="readonly"></textarea>
			    </div>
			</div>							
			</div>
			
			<div class="col-sm-12" style="padding: 2%; text-align: center;">		
				<input type="button" value="삭제" id="checkButt" style= "width:110px; height:42px;" class="inqDel">		
				<input type="button" value="목록" id="checkButt" style= "width:110px; height:42px;" class="inqList">		
			</div>
			
		</div>	
		<c:import url="../template/footer.jsp"></c:import>
	</body>
	
	<script type="text/javascript">
		$(".inqDel").click(function() {
			location.href = "./memberInquirlyDelete?inq_num=${dto.inq_num}";
		});
	
		$(".inqList").click(function() {
			location.href = "./memberInquirly";
		});
	
	</script>

</html>
