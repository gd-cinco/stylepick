<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>

<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script src="${path}/assets/board/js/jquery.dataTables.js"></script>
<script src="${path}/assets/board/js/dataTables.responsive.min.js"></script>
<script src="${path}/assets/board/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/board/js/buttons.html5.min.js"></script>

<c:if test="${fn:contains(path2,'board/faq')}">
	<script>
		var url = "http://localhost:8080/stylepick/ajax/fd.shop?c=${param.c}"
		var col = [
			{"data" : "count"}, 
			{"data" : "title"}, 
			{"data" : "category"}
		]
	</script>
</c:if>
<c:if test="${fn:contains(path2,'board/notice')}">
	<script>
		var url = "http://localhost:8080/stylepick/ajax/nd.shop"
		var col = [
			{"data" : "count" }, 
			{"data" : "title"}, 
			{"data" : "regtime"} 
		]
	</script>
</c:if>
<c:if test="${fn:contains(path2,'board/qna')}">
	<script>
		var url = "http://localhost:8080/stylepick/ajax/qd.shop"
		var col = [
			{"data" : "count"},
			{"data" : "title"}, 
			{"data" : "category"},
			{"data" : "author"},
			{"data" : "regtime"},
			{"data" : "stat"}
		]
	</script>
</c:if>
<script>
	$(function() {
		var table = $('#board').DataTable({
			ajax: {
				'url': url,
	            'dataSrc':''
	        },
			responsive : true,
			orderMulti : true,
			order : [ [ 0, 'desc' ] ],
			columns : col,
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