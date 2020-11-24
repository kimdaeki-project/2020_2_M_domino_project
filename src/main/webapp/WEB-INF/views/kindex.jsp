<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="google-signin-scope" content="profile email"> 
<meta name="google-signin-client_id" content="My API KeyNumber.apps.googleusercontent.com"> 

<!-- KaKao Login Js --> 
<!--  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/kakao.js"></script> 
 -->
</head>

<body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- KaKao Login Btn --> 
<a id="login-form-btn" href="javascript:loginFormWithKakao()"> 
	<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="100%" height="auto" style="max-width:400px;max-height:60px"/>
 </a>

</body>

<script>

Kakao.init('ee481319bcf54376fe803d6dc751dc54'); 
function loginFormWithKakao() { 
	Kakao.Auth.loginForm({ 
		success: function(authObj) { 
			Kakao.API.request({ 
				url: '/v2/user/me', 
				success: function(res) { 
					console.log(res.kakao_account && res.kakao_account.email);
					console.log(res.kakao_account['email']) 
					console.log(res.id) 
					
					var id = res.id;
					var email = res.kakao_account.email;
				    var name = JSON.stringify(res.properties.nickname);

					$.ajax({
							Type:"get",
		                    url:"<%=request.getContextPath()%>/memberIdCheck?member_id="+id,
		                    data:{"id":id, email:"email", "name":name},
		                    success:function(data){

		                     // 가입된 사람은 로그인
		                    	 $.get("./memberIdCheck?member_id="+id,function(data){
		                 			data=data.trim();
		                 			alert("이미 회원가입되었습니다.")
		                    	 })
		                    },
		                    
		                    error: function(){
		                    if (confirm("카카오계정으로 가입되어진 정보가 없습니다. 카카오 계정으로 가입하시겠습니까?") {
	                   	      		location.href="member/memberJoin";
	                   		 	}
		                    }
		                 });
						
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

