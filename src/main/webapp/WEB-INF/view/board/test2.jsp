<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<head>
<meta charset="UTF-8">
<title>test</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.uikit.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.2/css/uikit.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.uikit.min.css">
</head>
<body>
	<table id="example" class="uk-table uk-table-hover uk-table-striped" style="width: 100%">
		<thead>
			<tr>
				<th>#</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="1000" var="i">
				<tr>
					<td>${i}</td>
					<td><a>관리자</a></td>
					<td><a>공지${i}</a></td>
					<td>2020/07/28</td>
					<td>0</td>
					<td>-</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td></td>
			</tr>
		</tfoot>
	</table>

	<script>
		$(document).ready(function() {
			$('#example').DataTable({
			    "language": {
			        "lengthMenu": "_MENU_ 개씩 보기",
			        "info": "_START_ - _END_ / _TOTAL_건",
			        "infoFiltered": "",
			        "search": "검색: ",
			        "zeroRecords": "검색 결과가 없습니다.",
			        "loadingRecords": "로딩중..",
			        "processing":     "처리중..",
			        "paginate": {
			            "next": "다음",
			            "previous": "이전"
			        }
			    },
			});
		});
	</script>
</body>
</html>