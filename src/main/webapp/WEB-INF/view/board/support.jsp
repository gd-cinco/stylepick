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
	<h1>안녕하세요, 고객지원센터입니다</h1>
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
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  문의하기
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">문의하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        비회원도 이메일로 답변받으실 수 있습니다.
      </div>
      <div align="center" style="margin-bottom: 30px">
        <button type="button" class="btn btn-secondary" onclick="location.href='${path}/user/login.shop'">회원</button>
        <button type="button" class="btn btn-primary" onclick="location.href='${path}/board/addqna.shop'">비회원</button>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>