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
<h1>작성한 글을 삭제 하시겠습니까?</h1>
<form action="remove1.shop" method="post" name="deleteform">
<input type="hidden" name="qna_no" value="${param.qna_no }">
	<a href="javascript:deleteform.submit()">[예]</a>
</form>
</body>
</html>