<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.pagingList{
		text-align: center;
	}
	
	.pagingList a{
		color: #888888;
	}
	
	.form-item{
		display: inline-block;
	}
	
	#msg{
		margin-left: 5px;
		margin-right: 5px;
	}
	
	.form-item{
		float: left;
		padding: 2px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/bootstrap.jsp"></c:import>
  <link href ="../resources/css/common/default.css" rel="stylesheet">
  <link href ="../resources/css/common/member.css" rel="stylesheet">
  <script src="../resources/js/header.js"></script>
<c:import url="../template/header.jsp"></c:import>
</head>
<body>

	<div class="container">
	<h1>회원 정보</h1>
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
</div>
	
	
	<div class="container">
	<table class="table table-hober">
		<tr>
			<td>회원 번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>휴대전화</td>
			<td>등급</td>
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.member_num}</td>
				<td><a href="./memberUpdateAdmin?member_num=${dto.member_num}">${dto.member_id}</a></td>
				<td>${dto.member_name}</td>
				<td>${dto.member_email}</td>
				<td>${dto.member_phone}</td>
				<td>${dto.member_level}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	
<div class="pagingList">
  
  	<c:if test="${pager.beforeCheck}">
  	<a href="./memberList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${search}">[이전]</a>
  	</c:if>
  
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<a href="./memberList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${pager.nextCheck}">
  	<a href="./memberList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
  	</c:if>
  </div>	
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>