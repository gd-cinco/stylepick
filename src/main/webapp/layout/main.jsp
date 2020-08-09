<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<!-- CSS -->
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
	<link rel="stylesheet" href="${path}/assets/css/style.css?ver=1.1">
	<link rel="stylesheet" href="${path}/assets/css/final.css?ver=1">
	<link rel="stylesheet" href="${path}/assets/css/admin.css">
	
	<title><decorator:title/></title>
	<decorator:head/>
</head>
<body>
<header>
	<!-- Header Start -->
	<div class="header-area">
		<div class="main-header ">
			
			<div class="header-top top-bg d-none d-lg-block">
				<div class="container-fluid">
					<div class="col-xl-12">
						<div class="row d-flex justify-content-between align-items-center">
							<div class="header-info-right">
								<ul>
								<li>
									<a href="../sns/test.shop" style="font-weight:bold; font-size:18px;">#OOTD</a>
									<a href="../item/store.shop" style="font-weight:bold; font-size:18px;">STORE</a>
								</li>
								</ul>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="header-bottom  header-sticky">
				<div class="container-fluid">
					<div class="row align-items-center">
						<!-- Logo -->
						<div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
							<div class="logo">
								<a href="#"><img src="${path}/assets/img/logo/logo.png" alt=""></a> <!-- sns 인기글 -->
							</div>
						</div>
						<div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
							<!-- Main-menu -->
							<div class="main-menu f-right d-none d-lg-block">
								<nav>                                                
									<ul id="navigation">  
										<c:if test="${!fn:contains(path2,'sns')}" >                                                                                                                                   
										<li><a href="../user/main.shop">main</a></li>
										<li><a href="../admin/list.shop">admin</a></li>
										<li><a href="../item/store.shop">store</a></li>
										<li><a href="../board/test2.shop">board(고객센터)</a>
										<li><a href="../user/mypage.shop">mypage</a>
										</c:if>
										<c:if test="${fn:contains(path2,'sns')}" >
											<li class="hot"><a href="${path}/WEB-INF/view/sns/list.shop?ksb=hot&type2">인기</a></li>
											<li><a href="${path}/WEB-INF/view/sns/list.shop?ksb=new&type=1">최신</a></li>
											<li><a href="${path}/WEB-INF/view/sns/list.shop?ksb=qna&type=2">QnA</a>
										</c:if>
										<!-- 
										<li class="hot"><a href="#">Menu002</a></li> 핫 사용
										<li><a href="#">Menu003</a>
											<ul class="submenu">     		서브메뉴 사용
												<li><a href="#">SubMenu001</a></li>
											</ul>
                                        </li> -->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        
						<div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
							<ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
								<li class="d-none d-xl-block">
									<div class="form-box f-right ">
										<input type="text" name="Search" placeholder="Input003">
										<div class="search-icon">
											<i class="fas fa-search special-tag"></i>
										</div>
								    </div>
								</li>
								<li class=" d-none d-xl-block">
								    <div class="favorit-items">
								        <i class="far fa-heart"></i>
								    </div>
								</li>
								<li>
									<div class="shopping-card">
										<a href="#"><i class="fas fa-shopping-cart"></i></a>
									</div>
								</li>
									<li class="d-none d-lg-block"> <a href="../user/login.shop" class="btn header-btn">로그인</a></li>
								</ul>
						</div>
						
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
</header>
<main>
    <div class="best-collection-area align-center">
        <div class="main-mapper">
        	<decorator:body/>
        </div>
    </div>
</main>
<footer>
	<!-- Footer Start-->
	<div class="footer-area footer-padding">
		<div class="container">
			<div class="row d-flex justify-content-between">
				<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
					<div class="single-footer-caption mb-50">
						<div class="single-footer-caption mb-30">
							<!-- logo -->
							<div class="footer-logo">
								<a href="index.html"><img src="${path}/assets/img/logo/logo2_footer.png" alt=""></a>
							</div>
							<div class="footer-tittle">
								<div class="footer-pera">
									<p>Input004</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
					<div class="single-footer-caption mb-50">
						<div class="footer-tittle">
							<h4>Input005</h4>
							<ul>
								<li><a href="#">Input006</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
					<div class="single-footer-caption mb-50">
						<div class="footer-tittle">
							<h4>Input007</h4>
							<ul>
								<li><a href="#">Input008</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
					<div class="single-footer-caption mb-50">
						<div class="footer-tittle">
							<h4>Input009</h4>
							<ul>
								<li><a href="#">Input010</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer bottom -->
			<div class="row">
				<div class="col-xl-7 col-lg-7 col-md-7">
					<div class="footer-copy-right">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p>
							Copyright &copy;
							<script>document.write(new Date().getFullYear());</script>
							All rights reserved | This template is made with
							<i class="ti-heart" aria-hidden="true"></i>
							by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
					</div>
				</div>
				<div class="col-xl-5 col-lg-5 col-md-5">
					<div class="footer-copy-right f-right">
						<!-- social -->
                        <div class="footer-social">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End-->
</footer>
	<!-- JS -->
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
	<script src="${path}/assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="${path}/assets/js/jquery.scrollUp.min.js"></script>
	<script src="${path}/assets/js/jquery.nice-select.min.js"></script>
	<script src="${path}/assets/js/jquery.sticky.js"></script>
        
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