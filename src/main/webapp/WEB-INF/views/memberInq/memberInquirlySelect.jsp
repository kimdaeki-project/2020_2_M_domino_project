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
		<div class="myCheck">${member.member_name}님께서 문의하신 내용입니다</div>
		<div></div>
		<div class="myCheck2">${member.member_name}님께서 문의하신 내용은 총 0건입니다.</div>
	</div>
	<div class="memberCheck"></div><br>
			<div class="container">
			
			<input type="number" value="${dto.inq_num}" name="inq_num" class="none">
			
			<div>
			<div>
			<dl>
				<dt>이름</dt>
				<dd><input type="text" name="member_name" value="${member.member_name}" readonly="readonly" style="border: 0px;"></dd>
			</dl>
			
			<dl>
				<dt>아이디</dt>
				<dd><input type="text" name="member_id" value="${member.member_id}" readonly="readonly" style="border: 0px;"></dd>
			</dl>
			<dl>
				<dt>연락처</dt>
				<dd><input type="text" name="member_phone" value="${member.member_phone}" readonly="readonly" style="border: 0px;"></dd>
			</dl>
			<dl>
				<dt>이메일</dt>
				<dd><input type="text" name="member_email" value="${member.member_email}" readonly="readonly" style="border: 0px;"></dd>
			</dl>			
					
			<dl>
				<dt>문의유형</dt>
				<dd>
					${dto.inq_type}			
				</dd>
			</dl>

			<dl>
				<dt>매장검색</dt>
				<dd>
					${dto.inq_shop} : ${dto.inq_location}
				</dd>
			</dl>
			
			<dl>
				<dt>제목</dt>
				<dd>
					<div>
						<input type="text" name="member_email" value="${dto.inq_title}" readonly="readonly" style="border: 0px;">
					</div>
				</dd>
			</dl>
			
			<dl>
				<dt>문의내용</dt>
				<dd>
					<div>
						<textarea rows="10" cols="40" name="inq_contents" class="divText" readonly="readonly">${dto.inq_contents}</textarea>
					</div>
				</dd>
			</dl>

			<dl>
				<dt>답변</dt>
				<dd>
					<div>
						<textarea rows="10" cols="40" name="inq_reply" class="divText" readonly="readonly">${dto.inq_reply}</textarea>
					</div>
				</dd>
			</dl>								
			</div>
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
