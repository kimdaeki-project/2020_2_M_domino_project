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

				    if(id !=''){
						$.ajax({
			                    url:"<%=request.getContextPath()%>/member/memberIdCheck?member_id="+id,
			                    Type:"get",
			                   // data:{"id":id},
			                    success:function(data){
			                    	console.log("1 = 중복o / 0 = 중복x : "+ data);	
			                    	
			                    	if(data==1){
			                    		alert("이미 소셜 회원가입이 되어있는 사용자 입니다.")
			    						$.ajax({
			    							url:"<%=request.getContextPath()%>/member/memberSocialLogin",
			    								data:{"id":id},
			    							type:"get",
			    							success:function(data){
			    								console.log("소셜로그인 성공");
			    								location.href = "<%=request.getContextPath()%>";
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