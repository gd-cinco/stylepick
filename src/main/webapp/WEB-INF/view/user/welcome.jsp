<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!</title>
<style type="text/css">
.welcome_ul{
	list-style-type: none;
  	text-align: center;
  	overflow: hidden;
  	margin: 0;padding: 0;
}
.welcome_li{
	position:relative;
  	display:inline;
  	text-align:center;
  	font-size:15px;
  	float: left;
  	width: 50%;
}
.welcome_a{
	text-decoration: none;
  	color: #424242;
  	display:block;
  	line-height:45px;
  	width: 70%;
  	margin-left:15%;
  	height:64px;
  	text-align:center;
  	background-color: #35C5F0;
  	font-size: 33px;
  	font-weight: bold;
  	line-height: 65px;
}
</style>
</head>
<body>
<div style="text-align: center; margin-top: 80px;">
	<h1 style="font-size: 56px;">회원가입이 완료되었습니다!</h1>
</div>
<div>
		<ul class="welcome_ul">
    		<li class="welcome_li"><a class="welcome_a" href="../sns/test.shop">홈화면</a></li>
	  		 <li class="welcome_li"><a class="welcome_a" href="login.shop">로그인하기</a></li>
    	</ul>

</div>
</body>
</html>