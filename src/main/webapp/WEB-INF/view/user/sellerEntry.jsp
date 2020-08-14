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
	function win_upload(){
		var op = "width=500,height=500,left=50,top=150";
		open("pictureForm.shop","",op);
	}
	
	function allchkbox(allchk){
		$("input[name='chkbox']").prop("checked",allchk.checked)
	}
	
	function emptytelchk(){ //숫자가 아닌경우도 배제할것
		document.getElementById('telinputbox').style.border='1px solid #dadada'
		var tel =  $("#tel").val();
		if(tel==""){
			$("#emptytel").show();
		}else{
			$("#emptytel").hide();
		}
		
	}

	
	function chkboxcheck(f) {
			var result = true;
		  if(!$("input:checkbox[id='chkbox1']").is(":checked")) {
	        alert("이용 약관에 동의하세요.")
	        result=false;
	      }
	      if(!$("input:checkbox[id='chkbox2']").is(":checked")) {
	        alert("개인정보 수집 이용 약관에 동의하세요.")
	        result= false;
	      }
	      if(result==true) {
	        return true;
	      }
	      return false;
	   }

</script>
</head>
<body bgcolor="#f5f6f7">
<div class="login_background">
<div class="center">
			<div style="width: 200px; margin-left:auto; padding-top: 20px" >
			<ul class="userul">
		  		<li class="userli"><a class="usera" href="../sns/main.shop">홈</a></li>
		  		<li class="userli" style="width: 1px; height : 26px; background: #000; position: absolute;"/>
		  		<li class="userli"><a class="usera" href="../board/">고객센터</a></li> <%--TODO 고객센터 --%>
	  		</ul>
	  		</div>
<div style="margin-top:25px; margin-bottom:50px; position: relative;">
    		<img src="../assets/img/logo/logo3.png" width="620px"
    		 onclick="javascript:location.href='../sns/main.shop'" style="margin-bottom:20px; cursor: pointer;">
    		 
	<form:form modelAttribute="user" method="post" action="sellerEntry.shop" onsubmit="return chkboxcheck(this)">
		<div style="width: 100%; display:inline;text-align: center; height: 100px;">
			<spring:hasBindErrors name="user">
				<font class="userfont" color="red">
					<c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
				</font>
			</spring:hasBindErrors>
    	</div>
    	<div class="social_login_box" style="height: auto; margin-top: 15px;">
    		<div class="entry_text">
    			<a>이름</a><a style="color: red;">*</a>&nbsp;&nbsp;&nbsp;<a style="font-size: 15px; color: black;">등록후 변경 불가능합니다.</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="nameinputbox" >
					<input type="text" id="name" name="name" placeholder="실명" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('nameinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		
    		<div class="entry_text">
    			<a>전화번호</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="telinputbox" >
					<input type="text" id="tel" name="tel" placeholder="전화번호" value="${loginUser.tel}"
					 class="input_input" autocomplete="off"
					 onfocus="document.getElementById('telinputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:emptytelchk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="emptytel" style="display: none;"><font class="userfont" id="emptytelval">필수사항입니다.</font></div></div>
    		<hr>
			
    		<div class="entry_text">
    			<a>회사 이름</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="comnameinputbox" >
					<input type="text" id="comname" name="comname" placeholder="비밀번호 재입력" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('comnameinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		
    		<div class="entry_text">
    			<a>닉네임</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="nicknameinputbox" >
					<input type="text" id="nickname" name="nickname" placeholder="닉네임" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('nicknameinputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:alreadyNicknamechk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="alreadyNickname" style="display: none;"><font class="userfont" id="alreadyNicknameval">이미 존재하는 이메일입니다.</font></div>
    		<font class="userfont"><form:errors path="nickname"/></font></div>
    		
    		<div class="entry_text">
    			<a>이메일</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="emailinputbox" >
					<input type="text" id="email" name="email" placeholder="aaa@bb.cc" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('emailinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('emailinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font class="userfont"><form:errors path="email"/></font></div>
    		
    		<div class="entry_text">
    			<a>프로필 사진</a>
    		</div>
    		<div class="img_box" >
  				<img src="" id="imgurl" width="150px" height="150px" <c:if test="${empty m.pic}">style="visibility: hidden;"</c:if>>
  				<a class="img_del" href="javascript:win_upload()">등록</a>
  			</div>
  			<hr style="margin-top: 180px;margin-bottom: 20px;">
  			<%--TODO css구성 --%>
  			<div style="width:70%; margin-left:15%; height:175px; border: 2px solid black;">
  			<input type="checkbox" name="allchk" onchange="allchkbox(this)">전체 약관에 동의합니다.<br>
  			<input type="checkbox" name="chkbox" id="chkbox1">이용약관 동의<br>
  			<input type="checkbox" name="chkbox" id="chkbox2">개인정보 수집 및 동의
  			</div>
    	</div>
    	<input class="input_submit" style="font-size:36px; height: 90px;" type="submit" value="판매자 가입 ">
	</form:form>
</div>
</div>
</div>
</body>
</html>
