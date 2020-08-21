<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-8 col-md-8">
			<h3 class="mb-30">공지사항 등록</h3>
			<form action="#">
				<div class="mt-10">
					<input type="text" name="first_name" placeholder="제목"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '제목'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="last_name" placeholder="대분류"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '대분류'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="last_name" placeholder="중분류"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '중분류'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="last_name" placeholder="소분류"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '소분류'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<textarea class="single-textarea" placeholder="내용"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '내용'" required></textarea>
				</div>
			</form>
		</div>
		<div class="col-lg-3 col-md-4 mt-sm-30">
			<div class="single-element-widget">
				<h3 class="mb-30">첨부파일</h3>
				<input type="file">
			</div>
			<div class="single-element-widget mt-30">
				<a href="#" class="genric-btn danger">등록하기</a>
			</div>
		</div>
	</div>
</body>
</html>