<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A답변</title>
</head>
<body>
<form:form modelAttribute="item" action="reply.shop" method="post" name="f">
	<form:hidden path="qna_no" />
	<form:hidden path="grp" />
	<form:hidden path="grplevel" />
	<form:hidden path="grpstep" />
	<table>
		<caption>Spring 게시판 답글 등록</caption>
		<tr>
			<td><textarea name="content" rows="15" cols="80"></textarea></td></tr>
			<tr><td><a href="javascript:document.f.submit()">[답변글등록]</a></td></tr>
	</table>
</form:form>
</body>
</html>