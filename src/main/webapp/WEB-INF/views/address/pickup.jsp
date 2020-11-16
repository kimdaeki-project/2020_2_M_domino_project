
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
<link href ="../resources/css/address/address.css" rel="stylesheet">
<script src="../resources/js/header.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<div class="content">
		<div class="sub-type store">
			<div class="inner-box">
				<div class="page-title-wrap">
					<h2 class="page-title">주문방법 선택</h2>
					<!-- <div class=""> 홈 > 매장검색
					
					</div> -->
					
				</div>
				<div class="sel-order-area">
					<div class="sel-order-wrap">
						<div class="sel-order-way" id="select"> 
							<div class="order-btn order1">
								<a href="./delivery">배달 주문</a>
							</div>
							<div class="mid-bar"></div>
							<div class="order-btn order2">
								<a href="./pickup" class="active">포장 주문</a>
							</div>
						</div>
					</div>
				</div>	
			</div>		
		</div>			
	</div>
</div>

<script>
// Add active class to the current button (highlight it)
	var header = document.getElementById("select");
	var btns = header.getElementsByClassName("order-btn");
	for (var i = 0; i < btns.length; i++) {
	  btns[i].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
	  });
	}
</script>

<!-- ===== footer ===== -->
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>