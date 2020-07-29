<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="${path}/assets/board/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/owl.carousel.css">
    <link rel="stylesheet" href="${path}/assets/board/css/owl.theme.css">
    <link rel="stylesheet" href="${path}/assets/board/css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/normalize.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/wave/waves.min.css">
    <link rel="stylesheet" href="${path}/assets/board/css/wave/button.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/notika-custom-icon.css">
    <!-- Data Table JS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/jquery.dataTables.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${path}/assets/board/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="${path}/assets/board/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<!-- Data Table area Start-->
    <div class="data-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="data-table-list">
                        <div class="basic-tb-hd">
                            <h2>공지사항</h2>
                            <p>설명</p>
                        </div>
                        <div class="table-responsive">
                            <table id="data-table-basic" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>작성자</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach begin="1" end="50" var="i">
                                		<tr>
                                        <td>${i}</td>
                                        <td>관리자</td>
                                        <td>공지${i}</td>
                                        <td>2020/07/28</td>
                                        <td>0</td>
                                        <td>-</td>
                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- jquery
		============================================ -->
    <script src="${path}/assets/board/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${path}/assets/board/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="${path}/assets/board/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="${path}/assets/board/js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="${path}/assets/board/js/owl.carousel.min.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="${path}/assets/board/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="${path}/assets/board/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="${path}/assets/board/js/counterup/jquery.counterup.min.js"></script>
    <script src="${path}/assets/board/js/counterup/waypoints.min.js"></script>
    <script src="${path}/assets/board/js/counterup/counterup-active.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="${path}/assets/board/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="${path}/assets/board/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="${path}/assets/board/js/sparkline/sparkline-active.js"></script>
    <!-- flot JS
		============================================ -->
    <script src="${path}/assets/board/js/flot/jquery.flot.js"></script>
    <script src="${path}/assets/board/js/flot/jquery.flot.resize.js"></script>
    <script src="${path}/assets/board/js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="${path}/assets/board/js/knob/jquery.knob.js"></script>
    <script src="${path}/assets/board/js/knob/jquery.appear.js"></script>
    <script src="${path}/assets/board/js/knob/knob-active.js"></script>
    <!--  Chat JS
		============================================ -->
    <script src="${path}/assets/board/js/chat/jquery.chat.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="${path}/assets/board/js/todo/jquery.todo.js"></script>
	<!--  wave JS
		============================================ -->
    <script src="${path}/assets/board/js/wave/waves.min.js"></script>
    <script src="${path}/assets/board/js/wave/wave-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="${path}/assets/board/js/plugins.js"></script>
    <!-- Data Table JS
		============================================ -->
    <script src="${path}/assets/board/js/data-table/jquery.dataTables.min.js"></script>
    <script src="${path}/assets/board/js/data-table/data-table-act.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${path}/assets/board/js/main.js"></script>
</body>
</html>