<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<link rel="stylesheet" href="../assets/css/user.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function passcheck(){
		 document.getElementById('pw2inputbox').style.border='1px solid #dadada'
		var pass=$("#password").val();
	       var pass2=$("#password2").val();
	       if(pass != "" || pass2 != "") {
	          if(pass == pass2) {
	             $("#alert_password2").hide();
	          } else {
	             $("#alert_password2").show();
	          }
	       }
	}
	function win_upload(){
		var op = "width=500,height=500,left=50,top=150";
		open("pictureForm.shop","",op);
	}
	function allchkbox(allchk){
		//document.getElementById('chkbox').checked=allchk.checked;
		$("input[name='chkbox']").prop("checked",allchk.checked)
	}
	function alreadyidchk(){
		document.getElementById('idinputbox').style.border='1px solid #dadada'
		var userid =  $("#userid").val();
		$.ajax({
			url : "confirmid.shop",
			data : {id:userid},
			success : function(result){
				if(result=='true')
					$("#alreadyid").show();
				else
					$("#alreadyid").hide();
			}
		})
		
	}

</script>
</head>
<body bgcolor="#f5f6f7">
<div class="login_background">
<div class="center">
			<div style="width: 200px; margin-left:auto; padding-top: 20px" >
			<ul>
		  		<li><a href="../sns/test.shop">홈</a></li> <%--TODO 메인페이지 --%>
		  		<li style="width: 1px; height : 26px; background: #000; position: absolute;"/>
		  		<li><a href="#">고객센터</a></li> <%--TODO 고객센터 --%>
	  		</ul>
	  		</div>
<div style="margin-top:25px; margin-bottom:50px; position: relative;"> <%--위에 떼기 --%>
    		<img src="../assets/img/logo/logo3.png" width="620px"
    		 onclick="javascript:location.href='#'" style="margin-bottom:20px; cursor: pointer;"> <%-- TODO 메인페이지 --%>
    	<div class="social_login_box" >
    		<div style="padding-top: 1px; padding-left: 13px;">
    		<h2>소셜로 간편히 로그인하세요.</h2>
    			<ul>
    			<li><a style="display:block; line-height:45px; width: 90%; height:45px; text-align:center;
	  			 border: 1px solid #000000;" href="#">Kakao</a></li>
	  			 <li><a style="display:block; line-height:45px; width: 90%; height:45px; text-align:center;
	  			 border: 1px solid #000000;" href="#">Facebook</a></li>
    			</ul>
    			
    			<ul style="margin-top: 15px;">
    			<li><a style="display:block; line-height:45px; width: 90%; height:45px; text-align:center;
	  			 border: 1px solid #000000;" href="#">Naver</a></li>
	  			 <li><a style="display:block; line-height:45px; width: 90%; height:45px; text-align:center;
	  			 border: 1px solid #000000;" href="#">Google</a></li>
    			</ul>
    		</div>
    	</div>
    	<hr>
	<form:form modelAttribute="user" method="post" action="userEntry.shop">
		<div style="width: 100%; display:inline;text-align: center; height: 100px;">
			<spring:hasBindErrors name="user">
				<font color="red">
					<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
				</font>
			</spring:hasBindErrors>
    	</div>
    	<div class="social_login_box" style="height: 800px; margin-top: 15px;">
    		<div class="entry_text">
    			<a>아이디</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="idinputbox" >
					<input type="text" id="userid" name="userid" placeholder="아이디" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('idinputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:alreadyidchk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="alreadyid" style="display: none;"><font id="alreadyidval">이미 존재하는 아이디입니다.</font></div>
    		<font><form:errors path="userid"/></font></div>
    		<div class="entry_text">
    			<a>비밀번호</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="pwinputbox" >
					<input type="password" id="password" name="password" placeholder="비밀번호 입력" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('pwinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('pwinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font><form:errors path="password"/></font></div>
    		
    		<div class="entry_text">
    			<a>비밀번호 재입력</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="pw2inputbox" > <%--비밀번호 확인 --%>
					<input type="password" id="password2" name="password2" placeholder="비밀번호 재입력" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('pw2inputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:passcheck()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font><a id="alert_password2" style="display: none; color: red;">비밀번호가 다릅니다.</a></font></div>
    		
    		<div class="entry_text">
    			<a>닉네임</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="nicknameinputbox" >
					<input type="text" id="nickname" name="nickname" placeholder="닉네임" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('nicknameinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('nicknameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font><form:errors path="nickname"/></font></div>
    		
    		<div class="entry_text">
    			<a>프로필 사진</a>
    		</div>
    		<div style="width: 150px; display:inline; height: 150px; float: left; text-align: center; margin-left: 60px;margin-top:10px; background-color: #dadada;">
  				<img src="" id="imgurl" width="150px" height="150px" <c:if test="${empty m.pic}">style="visibility: hidden;"</c:if>>
  				<a style="display:block; line-height:25px; width: 26%; height:26px; text-align:center; margin-top:-149px; margin-left:103px;
	  				background-color: #35C5F0; color: white; font-weight: bold;" href="javascript:win_upload()">등록</a>
  			</div>
  			<hr style="margin-top: 180px;margin-bottom: 20px;">
  			<%--TODO 미구현, allchkbox 구현 및 모두체크되어야 넘어가짐 --%>
  			<div style="width:70%; margin-left:15%; height:175px; border: 2px solid black;">
  			<input type="checkbox" name="allchk" onchange="allchkbox(this)">전체 약관에 동의합니다.<br>
  			<input type="checkbox" name="chkbox" id="chkbox1">이용약관 동의<br>
  			<input type="checkbox" name="chkbox" id="chkbox2">개인정보 수집 및 동의<br>
  			<input type="checkbox" name="chkbox" id="chkbox3">14세 이상입니다.
  			
  			</div>
    	</div>
    	<input class="input_submit" style="font-size:36px; height: 90px;" type="submit" value="stylepick 가입하기">
	</form:form>
</div>
</div>
</div>
</body>
</html>
