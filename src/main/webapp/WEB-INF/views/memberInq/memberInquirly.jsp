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
	
	.form-item{
		display: inline-block;
	}
	
	#msg{
		margin-left: 5px;
		margin-right: 5px;
	}
	
	#srcBtn{
		line-height: 50px;
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
		<div class="myCheck">${member.member_name}님께서 문의하신 내용입니다.</div>
		<div></div>
		<div class="myCheck2">${member.member_name}님께서 문의하신 내용은 총 0건입니다.</div>
	</div>
	
		<div class="col-sm-12" style="border-bottom: 2px solid black; padding:50px 0; ">
		  <form action="./memberInquirly">
		 	 <input type="hidden" name="curPage" id="curPage">
		       <div class="input-group" style="margin: 0 auto;">
		       
		       		<div class="form-item">
		       		<select class="col-sm-2" id="sel1" name="kind" style="width: 150px; height: 50px; border-color: #ddd; background-color: white;">
		       			<option value="title">제목</option>
		       			<option value="date">날짜</option>
		       			<option value="state">처리상태</option>
		       		</select>
		       		</div>
		       		
		       		<div class="form-item">
			        <input class="col-sm-6" id="msg" type="text" class="form-control" name="search"  style="width: 500px; height: 50px; border: 1px solid #ddd;">
			        </div>
			       
			        <div class="form-item" id="srcBtn">
				    <button type="submit" style="background-color: #222; width:50px; height: 50px;">
				        <img alt="" src="${pageContext.request.contextPath}/resources/images/index/srch.png">
				    </button>
				    </div>
			        
			       
		       </div>
		  </form>
  	  </div>
	
	<div>
	<table class="table table-hober">
		<tr>
			<td>번호</td><td>제목</td><td>등록일</td><td>처리상태</td>
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.inq_num}</td>
				<td><a href="./memberInquirlySelect?inq_num=${dto.inq_num}">${dto.inq_title}</a></td>
				<td>${dto.inq_date}</td>
				<td>${dto.inq_state}</td>
			</tr>
		</c:forEach>
	</table>
		<div>
  
  	<c:if test="${pager.beforeCheck}">
  	<a href="./memberInquirly?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${search}">[이전]</a>
  	</c:if>
  
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<a href="./memberInquirly?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${pager.nextCheck}">
  	<a href="./memberInquirly?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a>
  	</c:if>
  </div>
  
	<div style="text-align: center;">	
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="width: 120px;">
		문의하기
	</button>
	</div>

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">문의하기</h4>
        </div>
        <div class="modal-body">
        <form action="./memberInquirly" method="post">
         <table class="table table-hober">	
		<tr>
			<td>아이디</td><td><input type="text" name="member_name" value="${member.member_id}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>연락처</td><td><input type="text" name="member_id" value="${member.member_phone}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="text" id="email" value="${member.member_email}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>문의유형</td>
			<td>
				<select name="inq_type">
					<option value="/main?locale=선택">선택</option>
					<option value="제품관련">제품관련</option>
					<option value="배달서비스 관련">배달서비스 관련</option>
					<option value="직원서비스 관련">직원서비스 관련</option>
					<option value="콜센타 관련">콜센타 관련</option>
					<option value="칭찬">칭찬</option>
					<option value="제안">제안</option>
					<option value="단순문의">단순문의</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>매장선택</td>
			<td>
				<select name="inq_location">
					<option value="/main?locale=지역선택">지역선택</option>
					<option value="서울">서울</option>
				</select><br>
				<br>
				<select name="inq_shop">
					<option value="/main?locale=매장선택">매장선택</option>
					<option value="가락">가락</option>
					<option value="가산">가산</option>
					<option value="마포">마포</option>
					<option value="마포">강남</option>
				</select>
			</td>
		</tr>

		<tr>
			<td>제목</td><td><input type="text" name="inq_title"></td>
		</tr>
		<tr>
			<td>문의내용</td><td><textarea rows="10" cols="40" name="inq_contents"></textarea></td>
		</tr>		
		</table>
		
		<input type="text" name="member_num" value="${member.member_num}" class="none">
		<input type="text" name="inq_state" value="미처리" class="none">
		
		 <button type="submit">작성</button>
		</form>
		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#inq").click(function() {
		
	})
</script>
</html>