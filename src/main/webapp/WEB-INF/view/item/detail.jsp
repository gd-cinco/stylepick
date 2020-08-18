<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<link rel="stylesheet" href="${path}/assets/css/detail.css?ver=1">
</head>
<body>
<form action="../cart/cartAdd.shop">
<div>
<div class="pic" >
  <img src="img/${item.pictureUrl }" width="400px" height="450px" id="img">
</div>
<div class="pic">
	<ul>
		<dl><h5>${item.userid }</h5></dl>
		<dl><h3>${item.item_name }</h3> </dl>
		<dl><h3>${item.price }원</h3> </dl>
		<dl>${item.keyword }</dl>
	</ul>
</div>
</div>
</form>
</body>
</html>