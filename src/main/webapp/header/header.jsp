<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

	<!-- template -->
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

	<!-- board -->
	<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/responsive.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/main.css">
	
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
										<li><a href="${path}/board/support.shop">고객센터</a>
											<ul class="submenu">
												<li><a href="${path}/board/notice.shop">공지사항</a></li>
												<li><a href="${path}/board/qna.shop">Q&A</a></li>
												<li><a href="${path}/board/faq.shop">FAQ</a></li>
											</ul>
										</li>
										<li><a href="../user/mypage.shop">mypage</a></li>
										</c:if>
										<c:if test="${fn:contains(path2,'sns')}" >
											<li class="hot"><a href="${path}/WEB-INF/view/sns/list.shop?ksb=hot&type=1">인기</a></li>
											<li><a href="${path}/WEB-INF/view/sns/list.shop?ksb=new&type=1">최신</a></li>
											<li><a href="${path}/WEB-INF/view/sns/list.shop?ksb=qna&type=2">QnA</a></li>
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