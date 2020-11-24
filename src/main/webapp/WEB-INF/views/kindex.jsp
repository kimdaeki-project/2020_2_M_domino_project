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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/kakao.js"></script> 

<!-- Google Login Js 
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> 
<script src="https://apis.google.com/js/platform.js?onload=triggerGoogleLoaded"></script> 
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> 
<script src="/자신의경로/자신의경로/platform.js" async defer></script> --> 

<!-- Naver Login Js --> 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

</head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body>
 
<!-- Naver Login Btn --> 
<div id="naverIdLogin" > <a id="naverIdLogin_loginButton"> 
<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" width="100%" height="auto" style="max-width:400px;max-height:60px"/> </a> 
</div> 

<!-- KaKao Login Btn --> 
<a id="login-form-btn" href="javascript:loginFormWithKakao()"> 
<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="100%" height="auto" style="max-width:400px;max-height:60px"/>
 </a>

</body>

<script type="text/javascript">



 var naverLogin = new naver.LoginWithNaverId({
		clientId: "clientId",
		callbackUrl: "callbackUrl",
		isPopup: false,
		/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
	});
	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				console.log(naverLogin.accessToken.accessToken)
				var email = naverLogin.user.getEmail();
				var profileImage = naverLogin.user.getProfileImage();
				var name = naverLogin.user.getName();
				var uniqId = naverLogin.user.getId();
				if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}else if( name == undefined || name == null){
					alert("회원이름은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else{
                	retrun "redirect:/";
				}
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
	});
});
	
Kakao.init('ee481319bcf54376fe803d6dc751dc54'); 
function loginFormWithKakao() {
    Kakao.Auth.loginForm({
		success: function(authObj) {
			Kakao.API.request({
         	    url: '/v2/user/me',
	  			success: function(res) {
	  				console.log(res.kakao_account['email'])
	  				console.log(res.id)
	  				
	  				 if(checkSnsJoin(snsGubun, id)=='Y') // 가입된 사람은 로그인
				      {
				       snsLoginProcess(snsGubun, id);
				      }
				      else // 가입
				      {
					     if ( confirm("카카오계정으로 가입되어진 정보가 없습니다. 카카오 계정으로 가입하시겠습니까?") ) {
					       snsJoinProcess(snsGubun, id, email , snsName);
						 }
				      }
	  				
	  			}
	  		})
	  	},
		fail: function(err) {
		  alert(JSON.stringify(err))
		},
	})
}
$(document).ready(function(){
	
})
$(function(){
	$('#login').on("click",function(){
		js_login();
	})
	$('#naverIdLogin_loginButton').on("click",function(){
		var email = $('#naver_email').val();
		var password = $('#naver_password').val();
		$('.email').val(email);
		$('.password').val(password);
	});
});
function googleSign(){
	
}
function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
//     console.log("ID: " + profile.getId());
//     console.log('Full Name: ' + profile.getName());
//     console.log('Given Name: ' + profile.getGivenName());
//     console.log('Family Name: ' + profile.getFamilyName());
//     console.log("Image URL: " + profile.getImageUrl());
//     console.log("Email: " + profile.getEmail());
}


</script>




</html>