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
					<li><strong>매니아등급</strong></li>
				</ol>
			</div>
		</div>
		
		<ul id="select" style="padding: 20px 0;">
			<li>
				<a href="./memberPage">매니아 등급</a> ㅣ 
				<a href="../order/orderInfo">주문 내역 및 결제 </a> ㅣ 
				<a href="#">쿠폰함</a> ㅣ 
				<a href="../memberInq/memberInquirly">1:1 문의</a> ㅣ 
				<a href="./memberCheck">정보 수정</a> 
			</li>
		</ul>
		
	<div class="myLevel">
		<h4 id="mName">${member.member_name}님</h4>
		<div class="myCheck"><h1 id="mLevel">${member.member_level}</h1></div>
		<div></div>
		<div class="myCheck2">등급별 혜택보기></div>
	</div>
	<h4>PREMIUN 등급으로 업그레이드하려면?</h4>
	
	<div style="padding: 10px 0; border-top: 2px solid black;" >
		내용
	</div>
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>