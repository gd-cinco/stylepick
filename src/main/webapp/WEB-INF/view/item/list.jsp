<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
<a href="create.shop">상품 등록</a>
<a href="../cart/cartView.shop" style="float:right;">장바구니</a>
 <table border="1" style="border-collapse:collapse;">
	<tr><th width="80">상품ID</th><th width="320">상품명</th>
		<th width="100">가격</th><th width="80">수정</th></tr>
		<c:forEach items="${itemList }" var="item">
			<tr><td align="center">${item.subject }</td>
			<td align="left"><a href="detail.shop?item_no=${item.item_no }">${item.item_name }</a></td>
			<td align="right"><fmt:formatNumber value="${item.price }" type="CURRENCY" currencySymbol=""/>원</td>
			<td><img src="img/${item.pictureUrl }"></td>
			</tr>
		</c:forEach>
</table> 


</body>
</html>