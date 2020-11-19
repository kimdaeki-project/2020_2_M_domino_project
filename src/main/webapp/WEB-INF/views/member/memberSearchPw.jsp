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
	
	#noneView{
		display: none;
	}
</style>

</head>
<body>

	<div class="container">
	<div class="order-title-wrap">
		<h2 class="order-title">아이디/비밀번호 찾기</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>아이디/비밀번호 찾기</strong></li>
				</ol>
			</div>
		</div>
		
		<ul id="select" style="padding: 20px 0; border-bottom: 2px solid black;">
			<li>
				<a href="./memberSearch">아이디 찾기</a> ㅣ 
				<a href="./memberSearchPw">비밀번호 찾기</a> 
			</li>
		</ul>
			
		<div class="loginType">
		<div>
			<ul>
				<li class="list">
					<div>
					<img alt="" src="../resources/images/member/msearch_ico.png">
					<p class="search">회원정보로 찾기</p>
					<div></div>
					<br>
						<input type="text" placeholder="아이디를 입력하세요" class="inputId">
					<div>
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">회원정보 인증</button>
						</div>
					</div>		
				</li>
					
				<li class="list" id="ul">
					<div>
					<img alt="" src="../resources/images/member/mphone_ico.png">
					<p class="search">본인인증(휴대전화)으로 찾기</p>
					<div></div>
					<br>
						<input type="text" placeholder="아이디를 입력하세요" class="inputId">
					<div>
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">본인 인증</button>
						</div>
					</div>		
				</li>
				
				<li class="list">
					<div>
					<img alt="" src="../resources/images/member/mipin_ico.png">
					<p class="search">아이핀(i-pin으로 찾기)</p>
					<div></div>
					<br>
						<input type="text" placeholder="아이디를 입력하세요" class="inputId">
					<div>
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">아이핀 인증</button>
						</div>
					</div>		
				</li>
						
			</ul>
			</div>
			
			<div class="sNotice">
				<ul class="noticeText">
					<li>
					 - 회원 가입 시 등록한 휴대폰번호와 현재 보유 휴대폰번호가 다를경우 본인인증/아이핀으로 찾기를 진행해주세요.
					</li>
					<li>
					 - 회원가입 시 아이핀으로 가입하신 회원님께서는 아이핀으로 인증하세요.
					</li>
					<li>
					 - 신용평가기관을 통해 한국도미노피자에 가입하신 아이디,비밀번호 찾기를 진행하며, 당사는 고객의 주민등록번호를 저장하지 않습니다.
					</li>
				
				</ul>
			</div>
			
		</div>
		
		  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원정보 인증</h4>
        </div>
        <div class="modal-body">
        <form action="./memberSearchPw" method="post">
        <table>
		<tr>
			<td>이름</td><td><input type="text" name="member_name"></td>
		</tr>
		<tr>
			<td>생년월일</td><td><input type="date" name="member_date"></td>
		</tr>
		<tr>
			<td>인증번호 발송</td>
			<td>
  				<label class="radio-inline"><input type="radio" name="asd">휴대전화</label>
				<label class="radio-inline"><input type="radio" name="asd">이메일</label>	
			</td>
		</tr>
		
		<tr>
			<td>휴대전화</td><td><input type="text" name="member_phone"></td>
		</tr>		
		</table>
		<button type="submit" class="btn-default">비밀번호 찾기</button>
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         
        </div>
      </div>
    </div>
  </div>
  
	<c:forEach items="${dto}" var="list">
		<input type="text" value="${list.member_id}" class="memId" id="noneView">
	</c:forEach>
	
<script type="text/javascript">
	$(".btn-lg").click(function() {
		var id = $(".inputId").val();
		var mid = $(".memId").val();
		
		if(id !== '' && id == mid){
			alert("존재하는 아이디입니다. 비밀번호 찾기를 진행합니다.")
			
		}else{
			alert("존재하는 아이디를 입력하세요")
			location.href = "./memberSearchPw";
		}
		
	});
	
</script>
	
	
	
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>