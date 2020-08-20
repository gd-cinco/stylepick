<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../header/header.jsp"%>
<main>
	<input type="button" onclick="location.href='${path}/board/addfaq.shop'" value="추가">
	<div class="wrap">
		<h1>FAQ</h1>
		<table id="board" class="display" style="width: 100%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>카테고리</th>
				</tr>
			</thead>
		</table>
	</div>
</main>

<%@ include file="../../../header/footer.jsp"%>

<script>
	$(function() {
		var table = $('#board').DataTable({
			ajax: {
				'url':'http://localhost:8080/stylepick/ajax/fd.shop?c=${param.c}',
	            'dataSrc':''
	        },
			responsive : true,
			orderMulti : true,
			order : [ [ 0, 'desc' ] ],
			columns : [
				{"data" : "count"}, 
				{"data" : "title"}, 
				{"data" : "category"}
			],
			rowId: function(r) {
			    return r.no;
			},
			"language" : {
				"emptyTable" : "데이터가 없습니다.",
				"lengthMenu" : "_MENU_ 개씩 보기",
				"info" : "",
				"infoEmpty" : "",
				"infoFiltered" : "",
				"search" : "검색 : ",
				"zeroRecords" : "일치하는 데이터가 없습니다.",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			}
		});
		
		$('#board').on('click', 'tr', function() {
		    var no = table.row( this ).id();
		    if (no != null) {
		    	location.href="../board/detail.shop?no=" + no
		    }
		});
	});
</script>
</body>
</html>