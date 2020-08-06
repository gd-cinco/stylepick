<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 목록</title>
</head>
<body>
<script type="text/javascript">
	function listpage(page) {
		document.searchform.pageNum.value=page;
		document.searchform.submit();
	}
</script>
</head>
<body>
<table>
	<tr><td colspan="4">Spring 게시판</td>
		<td>글개수:${listcount}</td>
	</tr>
	<tr><th>번호</th><th style="width:35%">제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>
	<c:forEach var="sns" items="${snslist}">
	<tr>
		<td>${sns.imgUrl}</td>
		<td>${sns.userid}</td>
		<td>${sns.description}</td>
		<td>${sns.regdate}</td>
	</tr>
	</c:forEach>
	<%-- 페이지 부분 출력 --%>
	<tr><td colspan="5">
		<c:if test="${pageNum > 1}">
		<a href="javascript:listpage('${pageNum - 1}')">[이전]</a>
		</c:if>
		<c:if test="${pageNum <= 1}">[이전]</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == pageNum}">[${a}]</c:if>
			<c:if test="${a != pageNum}"><a href="javascript:listpage('${a}')">[${a}]</a></c:if>
		</c:forEach>
		<c:if test="${pageNum < maxpage}">
		<a href="javascript:listpage('${pageNum + 1}')">[다음]</a></c:if>
		<c:if test="${pageNum >= maxpage}">[다음]</c:if></td>
	</tr>
</table>
<a href="write.shop">[글쓰기]</a>
</body>
</html>