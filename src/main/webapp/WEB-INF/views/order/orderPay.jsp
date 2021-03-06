<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

var IMP = window.IMP; // 생략해도 괜찮습니다.

IMP.init("imp65751313"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	 
	 
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : '${orderNum}',
    name : '주문명:결제테스트',
    amount : 1, //판매 가격
    buyer_email : '${member.member_email}',
    buyer_name : '${member.member_name}',
    buyer_tel : '${member.member_phone}',
    buyer_addr : '${address.roadFullAddr}',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});

</script>
</head>
<body>

</body>
</html>