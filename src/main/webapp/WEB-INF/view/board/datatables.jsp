<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>datatables</title>
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/main.css">

<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script src="${path}/assets/board/js/jquery.dataTables.js"></script>
<script src="${path}/assets/board/js/dataTables.responsive.min.js"></script>
<script src="${path}/assets/board/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/board/js/buttons.html5.min.js"></script>
</head>
<body>
	<div class="wrap">
		<h1>게시판</h1>
		<table id="board" class="display" style="width: 100%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<script>
	$(function() {
		var table = $('#board').DataTable({
			data : [
				{"no" : 1, "title" : "공지1", "author" : "관리자", "regtime" : "2020-08-12"},
				{"no" : 2, "title" : "공지2", "author" : "관리자", "regtime" : "2020-08-12"} 
			],
			responsive : true,
			orderMulti : true,
			order : [ [ 0, 'desc' ] ],
			columns : [
				{"data" : "no"}, 
				{"data" : "title"}, 
				{"data" : "author"},
				{"data" : "regtime"} 
			],
			"language" : {
				"emptyTable" : "데이터가 없습니다.",
				"lengthMenu" : "_MENU_ 개씩 보기",
				"info" : "",
				"infoEmpty" : "데이터가 없습니다.",
				"infoFiltered" : "",
				"search" : "검색 : ",
				"zeroRecords" : "일치하는 데이터가 없습니다.",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			}
		});
	});
	</script>
</body>
</html>