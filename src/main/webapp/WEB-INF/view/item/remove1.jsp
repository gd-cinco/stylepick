<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<script type="text/javascript">
function refresh(){
opener.document.location.reload();
	self.close();
}
</script>
</head>
<body onunload="refresh()">
<div style="width:400px">
<h1>QnA 삭제</h1>
<hr>
<div><h4>삭제된 글은 복구가 불가능 합니다.<br>
삭제 하시겠습니까?</h4></div>
<form action="remove1.shop" method="post" name="deleteform">
<input type="hidden" name="qna_no" value="${param.qna_no }">
<div style="text-align:right;">
	<a href="javascript:deleteform.submit()">확인</a>
<a href="#" onclick="javascript:window.close()">취소</a>
</div>
</form>
</div>
</body>
</html>