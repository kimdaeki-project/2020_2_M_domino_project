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
					<li><a href="./memberPage">나의정보</a></li>
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
		<div class="myCheck">${member.member_name}님께서 문의하신 내용입니다</div>
		<div></div>
		<div class="myCheck2">${member.member_name}님께서 문의하신 내용은 총 0건입니다.</div>
	</div>
	<div class="memberCheck"></div><br>
			<div class="container">
			
			<input type="number" value="${dto.inq_num}" name="inq_num" class="none">
			<div class="form-group">
				<label for="name" class="labelUpdate">이름 </label>
				<span>${member.member_name}</span>
			</div>
			
			<div class="form-group">
				<label for="id" class="labelUpdate">아이디 </label>
			 	<span>${member.member_id}</span>
			</div>
			
			<div class="form-group">
				<label for="email" class="labelUpdate">이메일 </label>
				<span>${member.member_email}</span>
			</div>	
			
			<div class="form-group">
				<label for="inqType" class="labelUpdate">문의유형 </label>
				<span>${dto.inq_type}</span>
			</div>
			
			<div class="form-group">
				<label for="shop" class="labelUpdate">매장 검색 </label>
				<span>${dto.inq_shop} : ${dto.inq_location}</span>
			</div>
			
			<div class="form-group">
				<label for="title" class="labelUpdate">제목 </label>
				<span>${dto.inq_title}</span>
			</div>
			
			<div class="form-group">
				<label for="contents" class="labelUpdate" id="inqCon">문의내용 </label>
				<div class="divText"><textarea rows="10" cols="30" name="inq_contents" readonly="readonly" class="tArea">${dto.inq_contents}</textarea></div>
			</div>
			
			<div class="form-group">
				<label for="reply" class="labelUpdate" id="inqCon2">답변 </label>
			   <div class="divText"><textarea rows="10" cols="30" name="inq_contents" readonly="readonly" class="tArea"></textarea></div>
			</div>
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
