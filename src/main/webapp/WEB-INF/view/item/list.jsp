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
<c:if test="${listcount >0 }">
 <table style="border-collapse:collapse;">
 
 	<tr>
		<c:forEach items="${itemList }" var="item">
			<td>
			<div class="item_detail" onClick="location.href='detail.shop?item_no=${item.item_no}'">
				<div>
				 <img src="img/${item.pictureUrl }" width="226px" height="270px">
				</div>
				<div>
					${item.subject}
				</div>
				<div>
				<fmt:formatNumber value="${item.price }" type="CURRENCY" currencySymbol=""/>원
				</div>
			</div>
			</td>
		</c:forEach>
	</tr>
		
		
		<tr><td colspan="4">
			
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==pageNum }">[${a }]</c:if>
					<c:if test="${a !=pageNum }"><a href="javascript:listpage('${a}')">[${a}]</a></c:if>
					</c:forEach></td></tr>
		</c:if>
		<c:if test="${listcount==0 }">
			<tr><td colspan="4">등록된 게시물이 없습니다</td></tr></c:if>
		
</table> 


</body>
</html>