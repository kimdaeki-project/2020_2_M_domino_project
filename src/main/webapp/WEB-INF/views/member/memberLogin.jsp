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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">

	.login_top_text{
		width:430px; 
		height:42px;
		text-align: center;
	}
	
	.login_top_text span{
		 font-size: 20px; 
		 font-weight: bold;
		
	}
	
	#btnLog, #btnJoin, .login2{
		border: 1px solid #ddd;
		margin-top: 5px;
	}
	
	.login{
		padding-top: 60px;
		padding-bottom: 40px;
	}
	
	.login2{
		padding-left: 5px;
	}
	
	.checkbox{
		margin: 0 auto;
		width: 430px;
	}
	
	.checkbox label{
		float: left;
	}

</style>

</head>
<body id="bodyContents">
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	
	<div class="order-title-wrap" style="padding: 0 0 30px 0; border-bottom: 2px solid black">
		<h2 class="order-title">로그인</h2>
			<div class="depth-area">
				<ol>
					<li><a href="http://localhost/t1">홈</a></li>
					<li><strong>로그인</strong></li>
				</ol>
			</div>
	</div>

	<div class="text-center">
		<h3 style="margin-top: 60px;">회원로그인</h3>
		<form action="./memberLogin" method="post" class="form-horizontal" style="padding: 20px;">
		<div>
			<input type="text" name="member_id" value="${cookie.remember.value}" class="login2" placeholder="아이디" style="width:430px; height:42px;">
		</div>	
		<br>	
		<div>
			<input type="password" name="member_pw" class="login2" width="430" height="42" placeholder="비밀번호" style="width:430px; height:42px;">
		</div>
		<br>
		
		<div>
		<div class="checkbox" style="text-align: center;">
		 	 <label><input type="checkbox" name="remember">아이디저장</label>
		 	 <div class="idpw">
		 		<a href="./memberSearch">아이디 찾기</a> 
		 		ㅣ
		 		<a href="./memberSearchPw">비밀번호 찾기</a>
		 	</div>
		</div>
		</div>
			
		<button type="submit" style="text-align:center; width:430px; height:58px;" id="btnLog">로그인</button>
		<div></div><br>
		<button type="button" style="text-align:center; width:430px; height:58px;" id="btnJoin">회원가입</button>
		</form>
	</div>
	
	<div style="text-align: center;">
		<div style="display: inline-block;">
		     <a id="login-form-btn" href="javascript:loginFormWithKakao()"> 
				<img src="${pageContext.request.contextPath}/resources/images/common/kakao_logo.png" width="100%" height="auto" style="max-width:400px;max-height:60px"/>
 			</a>
	     </div> 
	</div>
	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	$("#btnJoin").click(function() {
		location.href = "./memberJoin";
	});
</script>


<!-- 카카오 로그인 js -->
<script>
Kakao.init('ee481319bcf54376fe803d6dc751dc54'); 
function loginFormWithKakao() { 
	Kakao.Auth.loginForm({ 
		success: function(authObj) { 
			Kakao.API.request({ 
				url: '/v2/user/me', 
				success: function(res) { 
					console.log(res.id) 
					
					var id = res.id;
					var email = res.kakao_account.email;

				    if(id !=''){
						$.ajax({
			                    url:"<%=request.getContextPath()%>/member/memberIdCheck?member_id="+id,
			                    Type:"get",
			                    success:function(data){
			                    	console.log("1 = 중복o / 0 = 중복x : "+ data);	
			                    	
			                    	if(data==1){
			                    		alert("이미 회원가입된 아이디 입니다.")
			    						$.ajax({
			    							url:"<%=request.getContextPath()%>/member/memberSocialLogin",
			    								data:{"id":id},
			    							type:"get",
			    							success:function(data){
			    								console.log("소셜로그인 성공");
			    								location.href="<%=request.getContextPath()%>"
			    							}	
			    						})		                    		
			                    	}
			                    	
			                    	else{
			                    		alert("소셜 회원 가입 창으로 이동합니다.")
			                    		$.ajax({
			                    			url:"<%=request.getContextPath()%>/member/memberJoin",
			                    			type:"get",
			                    			data:{"id":id, "email":email},
			                    			success:function(data){
			                    				console.log(id);
			                    				console.log(email);
			                    			
			                    				console.log("아이디 넘기기 성공");
			                    				 $('#bodyContents').children().remove();
			                    		         // Contents 영역 교체
			                    		         $('#bodyContents').html(data);	
			                    			}
			                    		});
			                    	}
			                    },
			                    error:function(){
			                    	alert("오류가 발생 하였습니다. 관리자에게 문의해주세요")
			                    	location.href="<%=request.getContextPath()%>"
			                    }
	
			                 });
						}
						
		              },
		              
		           fail: function(error){
		               alert(JSON.stringify(error));
		           }
		});
		}
	});
}
</script>

</html>