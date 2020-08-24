<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title} 등록</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-8 col-md-8">
			<h3 class="mb-30">${title} 등록</h3>
			<form:form modelAttribute="board" action="write.shop" enctype="multipart/form-data" name="f">
				<c:if test="${param.t == 'q'}">
				<div class="mt-10">
					<div id="default-select">
						<select>
							<option value="0">분류</option>
							<c:forEach items="${category}" var="c" varStatus="i">
							<option value="${i}">${c}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<br><br>
				</c:if>
				<div class="mt-10">
					<input type="text" name="title" placeholder="제목"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '제목'" required
						class="single-input">
				</div>
				
				<c:if test="${param.t == 'f'}">
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
				</c:if>
				<div class="mt-10">
					<textarea class="single-textarea" name="content" placeholder="내용"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '내용'" required></textarea>
				</div>
				<div class="mt-10">
					<input type="text" name="stat" placeholder="이메일"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '이메일'" required
						class="single-input">
				</div>
				<input type="submit">
			</form:form>
		</div>
		<div class="col-lg-3 col-md-4 mt-sm-30">
			<div class="single-element-widget">
				<h3 class="mb-30">첨부파일</h3>
				<input type="file">
			</div>
			<br>
			<div class="switch-wrap d-flex justify-content-between">
				<p><b>이메일로 답변을 받으시겠습니까?</b></p>
				<div class="confirm-checkbox">
					<input type="checkbox" id="confirm-checkbox">
					<label for="confirm-checkbox"></label>
				</div>
			</div>
			<div class="single-element-widget mt-30">
				<a href="#" onclick="document.getElementById('.f').submit()" class="genric-btn danger">등록하기</a>
			</div>
		</div>
	</div>
</body>
</html>