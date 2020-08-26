<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div style="width: 86%; margin-left: 65px;">
		<br><br>
		<div class="blog_details">
			<h2>[${type.title}] ${board.title}</h2>
			<ul class="blog-info-link mt-3 mb-4">
				<li><a href="#"><i class="fa fa-user"></i> ${board.author}</a></li>
				<li> ${board.regtime}</li>
			</ul>
			<p class="excert">${board.content}</p>
			<c:if test="${!empty board.file1}"><br><br>첨부파일 : <a>${board.file1}</a></c:if>
			<br><br>
			<a href="${path}/board/${type.uri}" class="genric-btn info radius">목록</a>
		<c:if test="${sessionScope.loginUser.userid == 'admin'}">
		<c:if test="${board.seq != 2}">
			<a href="${path}/board/update${type.uri}?no=${param.no}" class="genric-btn info radius">수정</a>
		</c:if>
		<c:if test="${board.seq == 2}">
			<a href="${path}/board/answer?no=${param.no}" class="genric-btn info radius">답변</a>
		</c:if>
			<a href="${path}/board/delete?no=${param.no}" class="genric-btn info radius">삭제</a>
		</c:if>
		</div>
		
		<div class="blog_details">
			<h2>댓글</h2>
			<br>
			<c:forEach begin="1" end="3">
			내용
			<ul class="blog-info-link mb-4">
				<li><a href="#"><i class="fa fa-user"></i> ${board.author}</a></li>
				<li> ${board.regtime}</li>
			</ul>
			</c:forEach>
		</div>
	</div>
</body>
</html>