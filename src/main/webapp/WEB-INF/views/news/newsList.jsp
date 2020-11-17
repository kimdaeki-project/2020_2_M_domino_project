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
			padding: 2px;
		}
		
		th{
			text-align: center;
			height: 50px;
			color: black;
			font-weight: bold;
		}
		
		td{
			text-align: center;
			height: 50px;
		}
		
		.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    		padding: 15px;
   		    line-height: 1.42857143;
            vertical-align: top;
            border-top: 1px solid #ddd;
		}
		
		.list_con strong{
			color:  black;
		}
		
		.newsTitle{
			text-align: left;
		}
		
		.newsTitle strong{
			padding-left: 70px;
		}
		
		.list_write{
			width: 100px;
			height: 50px;
			background-color: #222222;
			float: right;
			text-align: center;
			line-height: 50px;
			
		}
		
		.list_write a{
			color: white;
			font-size: 17px;
		}
		
		.pageNum{
			text-align: center;
		}
		
		.pageNum a{
			color: #888888;
		}
		
		#pageNums{
			padding: 5px;
		}
		
	
	</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	 
	<div class="container">
	
	  <div class="detail_page">
			<c:choose>
			<c:when test="${news eq 'dominoNews'}">
				<h2>공지사항<span style="font-size: 12px;">홈>공지사항>도미노뉴스</span></h2>
			</c:when>
			<c:when test="${news eq 'press'}">
				<h2>공지사항<span style="font-size: 12px;">홈>공지사항>보도자료</span></h2>
			</c:when>
		</c:choose>	
					
			<div class="detail_page_Link">
				<a href="${pageContext.request.contextPath}/dominoNews/dominoNewsList">도미노 뉴스</a>
				<a href="${pageContext.request.contextPath}/press/pressList">보도자료</a>
			</div>
	  </div>
	
  	  <div class="col-sm-12" style="border-bottom: 2px solid black; padding:50px 0; ">
		  <form action="./${news}List">
		 	 <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group" style="margin: 0 auto;">
		       
		       		<div class="form-item">
		       		<select class="col-sm-2" id="sel1" name="kind" style="width: 150px; height: 50px; border-color: #ddd; background-color: white;">
		       			<option value="title">제목</option>
		       			<option value="contents">내용</option>
		       			<option value="tc">제목+내용</option>
		       		</select>
		       		</div>
		       		
		       		<div class="form-item">
			        <input class="col-sm-6" id="msg" type="text" class="form-control" name="search"  style="width: 500px; height: 50px; border: 1px solid #ddd;">
			        </div>
			       
			        <div class="form-item">
				    <button type="submit" style="background-color: #222; width:50px; height: 50px;">
				        <img alt="" src="${pageContext.request.contextPath}/resources/images/index/srch.png">
				    </button>
				    </div>
			        
			       
		       </div>
		  </form>
  	  </div>
  
			
	<div class="list_con">
		<table class="table table-hover">
			<tr>
				<th class="col-sm-1">번호</th>
				<th class="col-sm-7">제목</th>
				<th class="col-sm-2">등록일</th>
				<th class="col-sm-2">조회</th>
			</tr>
		
		<c:forEach items="${list}" var="dto" varStatus="vs">
			<tr>
				<td><strong>${dto.board_num}</strong></td>
				<td class="newsTitle"><a href="./${news}Select?board_num=${dto.board_num}"><strong>${dto.board_title}</strong></a></td>
				<td><strong>${dto.regDate}</strong></td>
				<td><strong>${dto.hit}</strong></td>
			</tr>
		</c:forEach>
		</table>
		
		<div class="list_write">
			<a href="./${news}Write">글쓰기</a>
		</div>
		
	</div>
</div>

	<div class="pageNum">
	 	<c:if test="${pager.beforeCheck}">
	 		<a href="./${news}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a>
	 	</c:if>
	 	
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<a href="./${news}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}" id="pageNums">${i}</a>
		</c:forEach> 
		
		<c:if test="${pager.nextCheck}"> <!--true면 현재블럭이 마지막블럭이 아님 -->
			<a href="./${news}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
		</c:if>
 	</div>
 	
 	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>