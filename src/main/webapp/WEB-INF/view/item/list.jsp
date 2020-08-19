<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
 <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>eCommerce HTML-5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<a href="create.shop">상품 등록</a>
<!-- <c:if test="${listcount >0 }">
 <table style="border-collapse:collapse;">
 
 	<tr>
		<c:forEach items="${itemList }" var="item">
			<td>
			<div class="item_detail" onClick="location.href='detail.shop?item_no=${item.item_no}'">
				<div>
				 <img src="img/${item.pictureUrl }" width="226px" height="270px">
				</div>
				<div>
					${item.subject}
				</div>
				<div>
				<fmt:formatNumber value="${item.price }" type="CURRENCY" currencySymbol=""/>원
				</div>
			</div>
			</td>
		</c:forEach>
	</tr>
		
		
		<tr><td colspan="4">
			
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==pageNum }">[${a }]</c:if>
					<c:if test="${a !=pageNum }"><a href="javascript:listpage('${a}')">[${a}]</a></c:if>
					</c:forEach></td></tr>
		</c:if>
		<c:if test="${listcount==0 }">
			<tr><td colspan="4">등록된 게시물이 없습니다</td></tr></c:if>
		
</table> -->



 <div class="container">
	<div class="row">
 		<div class="col-md-8">
           		 <div class="product_list">
           		 	<div class="row">
           		 <c:forEach items="${itemList }" var="item">
             			       <div class="col-lg-6 col-sm-6">
                                <div class="single_product_item">
                 <div class="item_detail" onClick="location.href='detail.shop?item_no=${item.item_no}'">
				<div>
				 <img src="img/${item.pictureUrl }" width="226px" height="270px">
				</div>
				<div>
					${item.subject}
				</div>
				<div>
				<fmt:formatNumber value="${item.price }" type="CURRENCY" currencySymbol=""/>원
				</div>
				</div>
                                </div>
                            </div>
                 </c:forEach>
                 </div>
              </div>
		</div>
	</div>
</div>




   <!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>

        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
        <!-- Jquery Plugins, main Jquery -->    
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>

        <!-- swiper js -->
        <script src="./assets/js/swiper.min.js"></script>
            <!-- swiper js -->
        <script src="./assets/js/mixitup.min.js"></script>
        <script src="./assets/js/jquery.counterup.min.js"></script>
        <script src="./assets/js/waypoints.min.js"></script>
</body>
</html>