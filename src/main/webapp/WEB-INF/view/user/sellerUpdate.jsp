<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/WEB-INF/view/jspHeader.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function submitcheck(f){
		var result = true;
		/* if(!nickchecked){
			alert("닉네임을 확인하세요.")
			result=false;
		} */
		return result;
	}

</script>
<title>사용자 정보 수정</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body>
<form:form modelAttribute="user" method="post" action="sellerUpdate.shop" onsubmit="return submitcheck(this)">
	<input type="hidden" name="userid" id="userid" value="${user.userid}">
	<div class="default_center" style="height:auto; margin-top: 15px;">
	<h2>회원 정보 수정</h2>
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
		<div style="border: 2px solid black; padding-left: 15px;">
			<div class="update_tuple">
    		<div class="update_text">
    			<a>이름</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="nameinputbox" >
					<input type="text" id="name" name="name" value="${user.name}" class="input_input" readonly="readonly"
					 onfocus="document.getElementById('nameinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>회사 이름</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="com_nameinputbox" >
					<input type="text" id="com_name" name="com_name" value="${user.com_name}"
					placeholder="회사 이름" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_nameinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('com_nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>사업자 등록번호</a>
    		</div>
    		
    		<div class="update_input">
    			<div class="input_box" id="com_registinputbox" >
					<input type="text" id="com_regist" name="com_regist" 
					<c:if test="${user.com_regist==0}">value=""</c:if><c:if test="${user.com_regist!=0}">value=${user.com_regist}</c:if>
					placeholder="사업자 등록번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_registinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('com_registinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>회사 전화번호</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="com_telinputbox" >
					<input type="text" id="com_tel" name="com_tel" value="${user.com_tel}"
					placeholder="사업자 등록번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_telinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('com_telinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple" style="height: 170px; margin-bottom: 50px;">
    		<div class="update_text">
    			<a>회사 대표 사진</a>
    		</div>
    		<div class="img_box" style="margin-left: 0px;" >
  				<img src="" id="com_img" width="150px" height="150px" <c:if test="${empty m.pic}">style="visibility: hidden;"</c:if>>
  				<a class="img_del usera" href="javascript:win_upload()">등록</a>
  			</div>
  			</div>
  			</div>
  			<input class="input_submit" style="font-size:36px; width:300px; margin: 0 auto; margin-top:50px;" type="submit" value="수정하기">
    	</div>
</form:form>
</body>
</html>