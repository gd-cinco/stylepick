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
<div>
<h1>한줄평 삭제</h1>
<form action="remove.shop" method="post" name="deleteform">
<input type="hidden" name="line_no" value="${param.line_no }">
	<a href="javascript:deleteform.submit()">[예]</a>
<a href="#" onclick="javascript:window.close()">[아니오]</a>
</form>
</div>
</body>
</html>