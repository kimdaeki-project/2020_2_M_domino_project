<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Member Join Page</h1>
	<div class="container">
		<form action="./memberJoin" method="post" id="frm">
			<div>
			<label for="name">이름 </label>
			<input type="text" id="name">
			</div>
			
			<div>
			<label for="id">아이디 </label>
			<input type="text" id="id">
			</div>
			
			<div>
			<label for="pw">비밀번호 </label>
			<input type="password" id="pw">
			</div>
			
			<div>
			<label for="pw2">비밀번호 확인</label>
			<input type="password" id="pw2">
			</div>
			
			
			<label for="phome">휴대전화 </label>
			<select>
				<option>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
			</select>
			<input type="text"><h3>-</h3>
			<input type="text">
			<button>중복확인</button>
			
			
			<div>
			<label for="eamil">이메일 </label>
			<input type="email">
			<button>중복확인</button>
			</div>
			
		</form>
	</div>
</body>
</html>