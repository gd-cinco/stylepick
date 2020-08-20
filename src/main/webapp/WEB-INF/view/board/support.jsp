<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
<style>
.main-mapper {
	width: 100%;
	margin: 0;
}
</style>
</head>
<body>
<div align="center" style="width:100%; height:400px; background-image: url('${path}/assets/img/hero/h1_hero.jpg');">
	<br><br>
	<h1>고객센터 메인화면입니다.</h1>
	<br>
	<div class="mt-10" style="width:50%">
		<input type="text" name="first_name" placeholder="무엇을 도와드릴까요?" class="single-input">
	</div>
	<br><br><br>
	<div class="button-group-area">
		<a href="${path}/board/faq.shop?c=buy" class="genric-btn danger">구매</a>
		<a href="${path}/board/faq.shop?c=sell" class="genric-btn danger">판매</a>
		<a href="${path}/board/faq.shop?c=ootd" class="genric-btn danger">OOTD</a>
		<a href="${path}/board/faq.shop?c=etc" class="genric-btn danger">기타</a>
	</div>
</div>
<br><br><br>
<div align="center" style="width:100%;">
	<h3>원하는 내용을 찾을 수 없으셨나요?</h3>
	<br>
	<div class="button-group-area">
		<a href="#" class="genric-btn danger">문의하기</a>
	</div>
</div>
</body>
</html>