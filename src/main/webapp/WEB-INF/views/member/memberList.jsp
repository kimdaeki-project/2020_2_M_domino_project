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
  <link href ="../resources/css/common/tableList.css" rel="stylesheet">
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	
	<div class="order-title-wrap" style="padding: 0 0 30px 0; border-bottom: 2px solid black">
		<h2 class="order-title">회원정보</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>회원정보</strong></li>
				</ol>
			</div>
	</div>



	<div class="col-sm-12" style="border-bottom: 2px solid black; padding:50px 0;">
		  <form action="./memberList">
		 	 <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group" style="margin: 0 auto;">
		       
		       		<div class="form-item">
		       		<select class="col-sm-2" id="sel1" name="kind" style="width: 150px; height: 50px; border-color: #ddd; background-color: white;">
		       			<option value="id">아이디</option>
		       			<option value="name">이름</option>
		       			<option value="phone">전화번호</option>
		       		</select>
		       		</div>
		       		
		       		<div class="form-item">
			        <input class="col-sm-6" id="msg" type="text" class="form-control" name="search"  style="width: 500px; height: 50px; border: 1px solid #ddd;">
			        </div>
			       
			        <div class="form-item">
				    <button type="submit" style="background-color: #222; width:50px; height: 50px;" id="srcBtn">
				        <img alt="" src="${pageContext.request.contextPath}/resources/images/index/srch.png">
				    </button>
				    </div>   
		       </div>
		  </form>
  	  </div>
	
	  <div class="list_con">
			<table class="table table-hober">
				<tr>
					<td>회원 번호</td>
					<td>아이디</td>
					<td>패스워드</td>
					<td>이름</td>
					<td>휴대전화</td>
					
				</tr>
				
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.member_num}</td>
						<td><a href="./memberUpdateAdmin?member_num=${dto.member_num}">${dto.member_id}</a></td>
						<td>${dto.member_pw}</td>
						<td>${dto.member_name}</td>
						<td>${dto.member_phone}</td>
					
					</tr>
				</c:forEach>
			</table>
	  </div>
	

<div class="pageNum">
  	<c:if test="${pager.beforeCheck}">
  		<a href="./memberList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a>
  	</c:if>
  
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<a href="./memberList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" id="pageNums">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${pager.nextCheck}">
  		<a href="./memberList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
  	</c:if>
</div>
    
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>