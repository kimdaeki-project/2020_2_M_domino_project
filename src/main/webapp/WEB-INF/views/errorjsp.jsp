<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<!-- header -->
		<div id="container">
			<section id="content">
				<div class="error-wrap">
					<div class="error-inner">
							<div class="logo">
								<a href="${pageContext.request.contextPath}">
									<img alt="" src="${pageContext.request.contextPath}/resources/images/common/logo.png">
								</a>
							</div>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/common/error_emoji.png">
							<strong class="title-type7">죄송합니다<br>요청하신 페이지를 찾을 수 없습니다.</strong>
							<div class="sub-type3">
								현재 페이지가 존재하지 않거나, 이용할 수 없는 페이지 입니다.
							</div>
							<div class="btn-wrap">
								<a href="javascript:history.back(-1);" class="btn-type v4">메인 페이지로 이동</a>
							</div>
						</div>
					</div>
			</section>
		</div>
		<!-- //container -->
	</div>
</body>
</html>