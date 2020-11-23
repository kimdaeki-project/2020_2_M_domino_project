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
  <link href ="../resources/css/common/board.css" rel="stylesheet">
	<style type="text/css">

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
		  <div class="order-title-wrap">
		<h2 class="order-title">고객센터</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/faq/faqList">고객센터</a></li>
					<li><strong>온라인신문고</strong></li>
				</ol>
			</div>
		</div>
	
		<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
			<li>
				<a href="${pageContext.request.contextPath}/faq/faqList">자주하는질문</a> ㅣ 
				<a href="${pageContext.request.contextPath}/qna/qnaWrite">온라인신문고</a>  
			</li>
		</ul>	
			
	
  	  <div class="col-sm-12" style="border-bottom: 2px solid black; padding:50px 0; ">
		  <form action="./qnaList">
		 	 <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group" style="margin: 0 auto;">
		       
		       		<div class="form-item">
			       		<select class="col-sm-2" id="sel1" name="kind" style="width: 150px; height: 50px; border-color: #ddd; background-color: white;">
			       			<option value="title">제목</option>
			       			<option value="writer">작성자</option>
			       			<option value="contents">내용</option>
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
				<th class="col-sm-2">작성자</th>
				<th class="col-sm-2">등록일</th>
			</tr>
		
		<c:forEach items="${list}" var="dto" varStatus="vs">
			<tr>
				<td><strong>${dto.board_num}</strong></td>
				<td class="newsTitle"><a href="./qnaSelect?board_num=${dto.board_num}">
				<c:catch>
			 	<c:forEach begin="1" end="${dto.depth}">--</c:forEach>
			 	</c:catch>
				<strong>${dto.board_title}</strong></a></td>
				<td><strong>${dto.board_writer}</strong></td>
				<td><strong>${dto.regDate}</strong></td>
				
			</tr>
		</c:forEach>
		</table>
		
		<c:if test="${not empty member and member.member_id eq 'admin'}">
			<div class="list_write">
				<a href="./qnaWrite">QNA 글쓰기</a>
			</div>
		</c:if>
		
	</div>
</div>

 
	<div class="pageNum">
	 	<c:if test="${pager.beforeCheck}">
	 		<a href="./qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a>
	 	</c:if>
	 	
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<a href="./qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" id="pageNums">${i}</a>
		</c:forEach> 
		
		<c:if test="${pager.nextCheck}"> 
			<a href="./qnaList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
		</c:if>
 	</div>
	

 	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>