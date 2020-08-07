<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body bgcolor="#f5f6f7">
<div class="login_background" >
	<div class="center"> <%--가운데정렬 --%>
	<div style="margin-top:100px; margin-bottom:50px; position: relative;"> <%--위에 떼기 --%>
    		<img src="../assets/img/logo/logo3.png" width="620px"
    		 onclick="javascript:location.href='#'" style="margin-bottom:20px; cursor: pointer;"> <%-- TODO 메인페이지 --%>
		<form:form modelAttribute="user" method="post" action="login.shop">
			<input type="hidden" name="nickname" value="이름">
			<input type="hidden" name="password2" value="재확인">
			<input type="hidden" name="email" value="이메일">
			<div style="width: 100%; display:inline;text-align: center; height: 100px;">
			<spring:hasBindErrors name="user">
				<font color="red">
					<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
				</font>
			</spring:hasBindErrors>
    	</div>
			<div id="id_area">
				<div class="input_box" id="idinputbox" >
					<input type="text" id="userid" name="userid" placeholder="아이디" class="input_input" autocomplete="off"
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
