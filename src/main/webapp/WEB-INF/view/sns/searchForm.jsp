<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 찾기</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1">
</head>
<body style="margin:0;">
<div class="searchform">
<div class="title_area">
	상품찾기
</div>
<div class="search_area">
	<form name="f" action="search.shop" method="post">
		<select name="category" style="width: 80px; height: 40px; float: left; margin-right: 10px;">
			<option value="1">Hat</option>
			<option value="2">Outer</option>
			<option value="3">Dress</option>
			<option value="4">Top</option>
			<option value="5">Bottom</option>
			<option value="6">Bag</option>
			<option value="7">Shoes</option>
			<option value="8">Watch</option>
		</select>
		<input type="text" name="keyword" style="height: 34px;width: 300px;float: left;margin-right: 10px;">
		<input type="submit" value="검색" style="height: 40px;float: left;">
	</form>
</div>
<div class="table_area">
	<table>
		<c:forEach var="i" items="${itemlist}">
			<tr>
				<td rowspan="2"><img src="item/img/${i.getPictureUrl()}"></td>
				<td>${i.getSubject()}</td>
			</tr>
			<tr>
				<td>${i.getName()}</td>
			</tr>
		</c:forEach>
	</table>	
</div>
<div class="page_area">
	<c:if test="${pageNum <= 1}"><span>이전</span></c:if>
	<c:if test="${pageNum > 1}">
		<span><a href="javascript:listdo(${pageNum-1})">이전</a></span>
	</c:if>
	<c:forEach var="a" begin="${startpage}" end="${endpage}">
		<c:if test="${a == b.pageNum}"><span class="active">${a}</span></c:if>
		<c:if test="${a != b.pageNum}"><span><a href="javascript:listdo(${a})">${a}</a></span></c:if>
	</c:forEach>
	<c:if test="${pageNum >= maxpage}"><span>다음</span></c:if>
	<c:if test="${pageNum < maxpage}"><span><a href="javascript:listdo(${pageNum+1})">다음</a></span></c:if>
</div>
</div>
</body>
</html>