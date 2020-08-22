<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A작성하기</title>
</head>
<body>
<form:form modelAttribute="item" action="qna.shop"  name="f">
 <form:hidden path="item_no" value="${sessionScope.item_no}"/>
  <form:hidden path="userid" value="${sessionScope.loginUser.userid}"/>
  <input type="hidden" name="type" value="0"/>
	<h2>Q&A작성하기</h2>
	<hr>
	<h4>궁금한 것이 있으시면 적어주세요</h4>
	<div>
	<textarea name="content" cols="55" rows="12" ></textarea>
	</div>
<input type="submit" class="genric-btn success medium" value="작성">
</form:form>
</body>
</html>