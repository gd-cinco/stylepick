<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
  

  <!-- CSS here -->
      <link rel="stylesheet" href="${path}/assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="${path}/assets/css/owl.carousel.min.css">
      <link rel="stylesheet" href="${path}/assets/css/flaticon.css">
      <link rel="stylesheet" href="${path}/assets/css/slicknav.css">
      <link rel="stylesheet" href="${path}/assets/css/animate.min.css">
      <link rel="stylesheet" href="${path}/assets/css/magnific-popup.css">
      <link rel="stylesheet" href="${path}/assets/css/fontawesome-all.min.css">
      <link rel="stylesheet" href="${path}/assets/css/themify-icons.css">
      <link rel="stylesheet" href="${path}/assets/css/slick.css">
      <link rel="stylesheet" href="${path}/assets/css/nice-select.css">
      <link rel="stylesheet" href="${path}/assets/css/style.css">
      	<link rel="stylesheet" href="${path}/assets/css/final.css">
<meta charset="UTF-8">
<title>주문하기</title>
<style type="text/css">
 .ammount{
 float:right;
 right:150px;
 text-align:right;
 margin-right: 115px;
 }
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  <!-- 주소 -->
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

</script>
</head>
<body>
 <section class="cart_area section_padding">
 <div class="container">
<h1>주문/결제</h1>
<br><br>
<h2>주문상품</h2>
<table>

</table>
<br>
<form:form modelAttribute="checkout" method="post" action="end.shop"  name="f">
<h2>배송지</h2>
<hr width="90%" align="left" >
<table>
	<tr><th>받는분</th><td><input type="text" name="name" placeholder="받으 실분 이름"></td></tr>
	
	<tr class="form-group"><th>우편번호</th><td>     
	<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    <button type="button" class="genric-btn success medium" onclick="execPostCode();" ><i class="fa fa-search"></i> 우편번호 찾기</button></td></tr>
	
	<tr class="form-group"><th>주소</th><td> 
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
	</td></tr>
     <tr class="form-group"><th>상세주소</th><td> 
    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
	</td></tr>


	<tr><th>휴대전화</th><td><input type="text" name="tel" placeholder="전화번호"></td></tr>
	<tr><th>배송 메모</th><td><textarea cols="60" rows="5" ></textarea></td></tr>
</table>
<br>
<h2>주문자</h2>
<hr width="90%" align="left">
<table>
	<tr><th>이름</th><td></td></tr>
	<tr><th>이메일</th><td></td></tr>
	<tr><th>휴대전화</th><td></td></tr>
</table>
<br>

<h2>최종 결제 금액</h2>
<hr width="90%" align="left">
	<div  class="ammount">
	</div>
	<div  class="ammount">
	<div>
	총 상품 금액
	</div>
	<div>원</div>
	</div>
	<br><br>
    <div class="checkout_btn_inner ">
         <center><button type="submit" class="btn" style="width:400px">구매</button></center>
  	 </div>
</form:form>
     </div>
     </section>


    <!-- All JS Custom Plugins Link Here here -->
    <script src="${path}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
   
    <!-- Jquery, Popper, Bootstrap -->
    <script src="${path}/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${path}/assets/js/popper.min.js"></script>
    <script src="${path}/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="${path}/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="${path}/assets/js/owl.carousel.min.js"></script>
    <script src="${path}/assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="${path}/assets/js/wow.min.js"></script>
    <script src="${path}/assets/js/animated.headline.js"></script>
    
    <!-- Scrollup, nice-select, sticky -->
    <script src="${path}/assets/js/jquery.scrollUp.min.js"></script>
    <script src="${path}/assets/js/jquery.nice-select.min.js"></script>
    <script src="${path}/assets/js/jquery.sticky.js"></script>
    <script src="${path}/assets/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="${path}/assets/js/contact.js"></script>
    <script src="${path}/assets/js/jquery.form.js"></script>
    <script src="${path}/assets/js/jquery.validate.min.js"></script>
    <script src="${path}/assets/js/mail-script.js"></script>
    <script src="${path}/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="${path}/assets/js/plugins.js"></script>
    <script src="${path}/assets/js/main.js"></script>
</body>
</html>