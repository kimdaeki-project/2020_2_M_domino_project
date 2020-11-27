<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko"><head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Dominos_t1</title>
<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/domino/mo/css/common.css"><!--메인에는 sub.css 호출하지않음-->
<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/domino/mo/css/sub.css">
<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2018/m/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2018/m/js/swiper.min.js"></script>
<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2018/m/js/common.js?v2.0"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="wrap">
		<div id="container">
			<section id="content">
				<div class="error-wrap">
					<div class="logo">
						<a href="/main">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/common/logo.png" style="width: 156px; height: 37px;">
						</a>
					</div>
					<img alt="" src="${pageContext.request.contextPath}/resources/images/common/error_emoji.png" style="width: 50px; height: 50px;">
					<div class="title-type7">죄송합니다</div>
					<div class="title-type8">요청하신 페이지를 찾을 수 없습니다.</div>
					<div class="sub-type3">
						현재 페이지가 존재하지 않거나,<br> 이용할 수 없는 페이지 입니다.
					</div>
					<div class="btn-wrap">
						<a href="${pageContext.request.contextPath}" class="btn-type v2">메인 페이지로 이동</a>
					</div>
				</div>
			</section>
		</div>
	</div>



</body></html>