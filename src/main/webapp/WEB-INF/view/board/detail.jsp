<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<h1>${board.seq}번 게시판 ${param.no}번 글 상세보기 페이지</h1>
	${board.title} by ${board.author} regtime : ${board.regtime}
</body>
</html>