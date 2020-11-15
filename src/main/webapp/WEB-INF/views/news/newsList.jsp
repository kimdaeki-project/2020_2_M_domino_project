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
	 
	<div class="container">
		<div class="row">
  <div class="col-sm-8">
		  <form action="./${news}List">
		  <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group">
		       		<select class="input-group-sm" id="sel1" name="kind">
		       			<option value="title">Title</option>
		       			<option value="writer">Writer</option>
		       			<option value="contents">Contents</option>
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
	
  <div class="container detail_page">
		<h2>고객센터<span>홈>매장검색</span></h2>
				
		<div class="container detail_page_Link">
			<a href="#">공지사항</a> <a href="">온라인신문고</a>
		</div>
</div>
			
<div class="container">
		<table class="table table-hover">
		<tr>
			<td>Num</td>
			<td>Title</td>
			<td>Date</td>
			<td>Hit</td>
			<td>Contents</td>
		</tr>
		
		<c:forEach items="${list}" var="dto" varStatus="vs">
		<tr>
			<td>${dto.board_num}</td>
			<td>${dto.board_title}</td>
			<td>${dto.regDate}</td>
			<td>${dto.hit}</td>
			<td>${dto.board_contents}</td>
		</tr>
		</c:forEach>
		</table>
</div>


	<div>
	 	<c:if test="${pager.beforeCheck}">
	 	<a href="./${news}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a>
	 	</c:if>
	 	
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<a href="./${news}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
		</c:forEach> 
		
		<c:if test="${pager.nextCheck}"> <!--true면 현재블럭이 마지막블럭이 아님 -->
		<a href="./${news}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
		</c:if>
 	</div>


 	<c:import url="../template/footer.jsp"></c:import>
 	</div>
</body>
</html>