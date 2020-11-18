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
</head>
<body>

	<div class="container">
	<h1>회원 정보</h1>
		<div class="row">
  <div class="col-sm-8">
		  <form action="./memberList">
		  <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group">
		       		<select class="input-group-sm" id="sel1" name="kind">
		       			<option value="id">아이디</option>
		       			<option value="name">이름</option>
		       			<option value="phone">휴대전화</option>
		       		</select>
		       		
			        <input id="msg" type="text" class="form-control" name="search" placeholder="Additional Info">
			        <div class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            <i class="glyphicon glyphicon-search"></i>
			            </button>
			        </div>
		      </div>
		      
		  </form>
  </div>
  </div>
</div>
	
	
	<div class="container">
	<table class="table table-hober">
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>휴대전화</td>
			
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.member_id}</td>
				<td>${dto.member_pw}</td>
				<td>${dto.member_name}</td>
				<td>${dto.member_phone}</td>
			
			</tr>
		</c:forEach>
	
	</table>
	
	
<div>
  
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