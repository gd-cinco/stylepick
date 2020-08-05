<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.center{
	height:100%;
	margin-left: auto;
	margin-right:auto;
	max-width: 450px;
}
.input_box{
	margin-top:10px;
	margin-bottom: 5px;
	padding: 8px 35px 4px 11px;
	border: solid 1px #dadada;
	background: #fff;
	height: 29px;		
}
.input_input{
	 width:100%;
	 height:16px; 
	 border: none;
}
.input_err{
	margin-bottom: -2px;
	margin-top: -6px;
}
.input_submit{
	margin-bottom: 12px;
	height: 54px;
	line-height: 52px;
	font-size: 18px;
	font-weight: 700;
	display: block;
	width: 100%;
	cursor: pointer;
	border: 0px solid #35C5F0;
	background-color: #35C5F0;
	color: #ffffff;
}
font{
	color: red;
	font-size: 14px;
}
ul{
  	list-style-type: none;
  	text-align: left;
  	overflow: hidden;
  	margin: 0;padding: 0;
  }
  li{
  	position:relative;
  	display:inline;
  	text-align:center;
  	font-size:15px;
  	float: left;
  	width: 50%;
  }
  a{
  	text-decoration: none;
  	color: #424242;
  }
</style>
<title>로그인</title>
</head>
<body>
<div style="height:100%; min-height:570px; position: absolute; background-color:#f5f6f7; top: 0;left: 0;right: 0;bottom:0;" >
	<div class="center">
	<div style="margin-top:150px; position: relative;">
		<form:form modelAttribute="user" method="post" action="login.shop">
			<input type="hidden" name="username" value="이름">
			<div style="width: 100%; display:inline;text-align: center; height: 100px;">
    		<img src="../assets/img/logo/logo3.png" width="450px"
    		 onclick="javascript:location.href='#'" style="margin-bottom:20px; cursor: pointer;"> <%-- TODO 메인페이지 --%>
    	</div>
			<div id="id_area">
				<div class="input_box" id="idinputbox" >
					<input type="text" id="userid" name="userid" placeholder="아이디" class="input_input"
					 onfocus="document.getElementById('idinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('idinputbox').style.border='1px solid #dadada'">
				</div>
			</div>
			<div class="input_err"><font><form:errors path="userid"/></font></div>
			<div id="pw_area">
				<div class="input_box" id="passinputbox" >
					<input type="password" id="password" name="password" placeholder="비밀번호" class="input_input"
					onfocus="document.getElementById('passinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('passinputbox').style.border='1px solid #dadada'" >
				</div>
			</div>
			<div class="input_err"><font><form:errors path="password"/></font></div>

			<br><input class="input_submit" type="submit" value="로그인">
			<ul>
		  		<li><a href="userEntry.shop">회원가입</a></li>
		  		<li style="width: 1px; height : 26px; background: #000; position: absolute;"/>
		  		<li><a href="#">ID/PW 찾기</a></li> <%--TODO 아이디찾기 --%>
	  		</ul>
		</form:form>
		</div>
	</div>
</div>
</body>
</html>
