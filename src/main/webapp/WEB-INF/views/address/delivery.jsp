
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<c:import url="../template/bootstrap.jsp"></c:import>
<link href ="../resources/css/common/default.css" rel="stylesheet">
<link href ="../resources/css/common/member.css" rel="stylesheet">
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
								<a href="./delivery" class="active">배달 주문</a>
							</div>
							<div class="mid-bar"></div>
							<div class="order-btn order2">
								<a href="./pickup">포장 주문</a>
							</div>
						</div>
					</div>
					<div class="tab-content" id="delivery">
						<div class="spot-area">
							<span class="spot left-spot">
								<img alt="" src="../resources/images/address/sp_deli_spot_t1.png" style="width: 23px; height: 24px;">밖에서 도미노피자 먹고 싶을 땐?
							</span>
							
							<a href="#" class="spot right-spot">
								<span>DOMINO SPOT 배달</span><i class="material-icons">chevron_right</i>
							</a>
						</div>
						<div class="addr-list">
							<ul>
								<li>
									<div class="notyet">
										<p class="title"><img alt="" src="../resources/images/address/sp_alert_t1.png"> 배달 주소를 등록해주세요.</p>
									<form action="./delivery" name="form" id="form" method="post" class="addr-form">
		
										<a href="#" onclick="goPopup();" class="btn-type-brd2" id="add_addr">
												+ 배달 주소 등록
										</a>
										<div id="list"></div>
										<div id="callBackDiv">
											<input type="number" value="${member.member_num}" name="member_num" class="none">
											
												<div class="roadFull">도로명주소 전체(포멧) <input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></div>
												
											
										</div>
										<input type="button" value="배달 주소 등록 확인" id="deliveryBtn">
												
									</form>
										
									</div>
									
								</li>
							</ul>
							
							
						</div>

					</div>
				</div>	<!-- 배달/포장 -->
					<div class="addr-limit">
						* 배달 주소는 최대 10개까지만 등록 가능합니다.
					</div>
			</div>	<!-- 주문방법선택 -->	
		</div>	
		<button type="button" style="text-align:center; width:210px; height:58px;" id="btnLog">주소 목록</button>		
	</div><!-- content -->
</div><!-- container -->

<script>

// Add active class to the current button (highlight it)

	$("#btnLog").click(function() {
		location.href = "./deliveryAfter"
	});

	$("#deliveryBtn").click(function() {
		var road = $("#roadFullAddr").val();
		
		if(road == '') {
				alert("배달 주소를 입력해주세요")
				location.href = "./delivery";
				
			}else{
			$("#form").submit();
		}
		

		
	});
	
	var header = document.getElementById("select");
	var btns = header.getElementsByClassName("order-btn");
	for (var i = 0; i < btns.length; i++) {
	  btns[i].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
	  });
	}
	
	
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/t1/address/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			document.form.engAddr.value = engAddr;
			document.form.jibunAddr.value = jibunAddr;
			document.form.zipNo.value = zipNo;
			document.form.admCd.value = admCd;
			document.form.rnMgtSn.value = rnMgtSn;
			document.form.bdMgtSn.value = bdMgtSn;
			document.form.detBdNmList.value = detBdNmList;
			/** 2017년 2월 추가제공 **/
			document.form.bdNm.value = bdNm;
			document.form.bdKdcd.value = bdKdcd;
			document.form.siNm.value = siNm;
			document.form.sggNm.value = sggNm;
			document.form.emdNm.value = emdNm;
			document.form.liNm.value = liNm;
			document.form.rn.value = rn;
			document.form.udrtYn.value = udrtYn;
			document.form.buldMnnm.value = buldMnnm;
			document.form.buldSlno.value = buldSlno;
			document.form.mtYn.value = mtYn;
			document.form.lnbrMnnm.value = lnbrMnnm;
			document.form.lnbrSlno.value = lnbrSlno;
			/** 2017년 3월 추가제공 **/
			document.form.emdNo.value = emdNo;
			
	}

	
</script>

<!-- ===== footer ===== -->
<c:import url="../template/footer.jsp"></c:import>

</body>

</html>