<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-8 col-md-8">
			<h3 class="mb-30">FAQ 등록</h3>
			<form:form modelAttribute="board" action="write.shop" enctype="multipart/form-data" name="f">
				<div class="mt-10">
					<input type="text" name="title" placeholder="제목"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '제목'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="category" placeholder="대분류"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '대분류'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="author" placeholder="중분류"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '중분류'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="stat" placeholder="소분류"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '소분류'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<textarea class="single-textarea" name="content" placeholder="내용"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '내용'" required></textarea>
				</div>
				<input type="submit">
			</form:form>
		</div>
		<div class="col-lg-3 col-md-4 mt-sm-30">
			<div class="single-element-widget">
				<h3 class="mb-30">첨부파일</h3>
				<input type="file">
			</div>
			<div class="single-element-widget mt-30">
				<a onclick="#" class="genric-btn danger">등록하기</a>
			</div>
		</div>
	</div>
</body>
</html>