<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<div style="margin: 10px; width: 80%">
	<h1>${board.title}</h1>
	<b>작성자</b>&nbsp;&nbsp;:&nbsp;&nbsp;${board.author}
	<br><b>등록일</b>&nbsp;&nbsp;:&nbsp;&nbsp;${board.regtime}
	<br><b>내용</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
	${board.content}
	<br><b>파일</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
	${board.file1}
	</div>
	<div style="margin: 10px; width: 80%">
	<c:if test="${board.seq == 2}">
			<br><h4>답글</h4>
			<input type="text" name="first_name" placeholder="내용"
				onfocus="this.placeholder = ''" onblur="this.placeholder = '내용'"
				required class="single-input"> 
				<a href="#" class="genric-btn danger">답글등록</a>
		
	</c:if>
	<br><br><a href="#" class="genric-btn danger">삭제하기</a>
	</div>
</body>
</html>