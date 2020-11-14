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
		
		.form-item{
			float: left;
			margin: 0 auto;
			height: 40px;
			background-color: yellow;
		}
	
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	 
	<div class="container">
	
	  <div class="detail_page">
			<h2>공지사항<span style="font-size: 12px;">홈>공지사항>도미노뉴스</span></h2>
					
			<div class="detail_page_Link">
				<a href="#">도미노 뉴스</a><a href="#">보도자료</a>
			</div>
	  </div>
	
  	  <div class="col-sm-12" style="border-bottom: 1px solid black; padding:50px 0; ">
		  <form action="./${news}List">
		 	 <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group col-sm-12">
		       
		       		<div class="form-item">
		       		<select class="col-sm-2" id="sel1" name="kind">
		       			<option value="title">제목</option>
		       			<option value="writer">내용</option>
		       			<option value="contents">제목+내용</option>
		       		</select>
		       		</div>
		       		
		       		<div class="form-item">
			        <input class="col-sm-6" id="msg" type="text" class="form-control" name="search">
			        </div>
			       
			        <div class="form-item">
				    <button type="submit" style="background-color: #222;">
				        <img alt="" src="${pageContext.request.contextPath}/resources/images/index/srch.png">
				    </button>
				    </div>
			        
			       
		       </div>
		  </form>
  	  </div>
  
			
	<div>
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>조회</th>
			</tr>
		
		<c:forEach items="${list}" var="dto" varStatus="vs">
			<tr>
				<td>${dto.board_num}</td>
				<td><a href="./${news}Select?board_num=${dto.board_num}">${dto.board_title}</a></td>
				<td>${dto.regDate}</td>
				<td>${dto.hit}</td>
			</tr>
		</c:forEach>
		</table>
		
		<a href="./${news}Write" class="btn btn-danger">Write</a>
	</div>
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
</body>
</html>