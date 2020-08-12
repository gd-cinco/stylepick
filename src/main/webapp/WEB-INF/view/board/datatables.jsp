<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>datatables</title>
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/main.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="${path}/assets/board/js/dataTables.responsive.min.js"></script>
<script src="${path}/assets/board/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/board/js/buttons.html5.min.js"></script>
</head>
<body>
	<div class="wrap">
		<h1>DataTables Grid Example</h1>
		<table id="myTable" class="display" style="width: 100%;">
			<thead>
				<tr>
					<th>id</th>
					<th>first_name</th>
					<th>last_name</th>
					<th data-orderable="false">email</th>
					<th data-orderable="false">gender</th>
					<th>date</th>
					<th data-orderable="false">ip_address</th>
					<th>money</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th colspan="2" style="text-align: right; white-space: nowrap;">TOTAL
						:</th>
					<th colspan="6" style="text-align: left; white-space: nowrap;"></th>
				</tr>
			</tfoot>
		</table>
	</div>
	
	<script>
	$(document).ready(function () {
	    $.fn.dataTable.ext.search.push(
	        function(settings, data, dataIndex){
	            var min = Date.parse($('#fromDate').val());
	            var max = Date.parse($('#toDate').val());
	            var targetDate = Date.parse(data[5]);

	            if( (isNaN(min) && isNaN(max) ) || 
	                (isNaN(min) && targetDate <= max )|| 
	                ( min <= targetDate && isNaN(max) ) ||
	                ( targetDate >= min && targetDate <= max) ){ 
	                    return true;
	            }
	            return false;
	        }
	    )

	    var table = $('#myTable').DataTable({
	        data: [
	        	{"no":1, "title":"공지1", "author":"관리자", "regtime":"2020-08-12"},
	        	{"no":2, "title":"공지2", "author":"관리자", "regtime":"2020-08-12"}
	        ],
	        responsive: true,
	        orderMulti: true,
	        order : [[1, 'desc']],
	        columns: [
	            {"data": "id"},
	            {"data": "first_name"},
	            {"data": "last_name"}, 
	            {"data": "email"}, 
	            {"data": "gender"}, 
	            {"data": "date"},
	            {"data": "ip_address"},
	            {"data":"money"}
	        ],
	        "language": {
	            "emptyTable": "데이터가 없습니다.",
	            "lengthMenu": "_MENU_ 개씩 보기",
	            "info": "_START_ - _END_ / _TOTAL_건",
	            "infoEmpty": "데이터가 없습니다.",
	            "infoFiltered": "",
	            "search": "검색 : ",
	            "zeroRecords": "일치하는 데이터가 없습니다.",
	            "paginate": {
	                "next": "다음",
	                "previous": "이전"
	            }
	        }
	    });

	});
	</script>
</body>
</html>