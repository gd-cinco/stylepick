<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/dashboard.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator - Dashboard</title>
<script type="text/javascript">
	function graph_open(url) {
		var op = "width=800,height=800,scrollbars=yes,left=50,top=150";
		window.open(url+".shop","graph",op);
	}
</script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(numGraph1);
          google.charts.setOnLoadCallback(numGraph2);

          function numGraph1() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', '정당');
            data.addColumn('number', '의석수');
            data.addRows([
              ['미래한국당', 19],
              ['더불어시민당', 17],
              ['정의당', 5],
              ['국민의당', 3],
              ['열린민주당', 3]
            ]);
            var options = {title:' 21대 국회의원 선거 정당별 비례대표 의석수',
                           width:350,
                           height:300};
            var chart = new google.visualization.PieChart(document.getElementById('numGraph1_div'));
            chart.draw(data, options);
          }

          function numGraph2() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', '정당');
            data.addColumn('number', '의석수');
            data.addRows([
              ['민주당-시민당', 180],
              ['통합당-미래한국', 103],
              ['정의당', 26],
              ['국민의당', 5],
              ['열린민주당', 3],
              ['무소속', 3]
            ]);
            var options = {title:'21대 국회의원 선거 정당별 총 의석수',
                           width:350,
                           height:300};
            var chart = new google.visualization.PieChart(document.getElementById('numGraph2_div'));
            chart.draw(data, options);
          }
</script>
</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop" style="color:skyblue;">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="../board/test2.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>DashBoard</h3><br>
		
		<!-- 1. 지표 요약 -->
		<div class="outer_frame">
			<div class="quarter_frame skyblue">
				15,000,000원
				<p class="smaller_size">3개월 매출</p>
			</div>
			<div class="quarter_frame green">
				5명
				<p class="smaller_size">이번달 신규회원</p>
			</div>
			<div class="quarter_frame yellow">
				5명
				<p class="smaller_size">스타일픽 전체 회원</p>
			</div>
			<div class="quarter_frame red">
				<div>
					<span style="font-size: xx-small; font-weight: normal;">이달 매출</span>  30,000 KRW
				</div>
				<div>
					<span style="font-size: xx-small;font-weight: normal;">이달 리뷰</span>   24 Reviews
				</div>
			</div>
			
		</div>
		<!-- outer_frame -->
		<br><br>
		
		<!-- 1. 매출 요약 -->
		<div class="outer_frame">
			
			<!-- 주간매출 바그래프 -->
			<div class="double_frame">
				주간매출 바,꺾은선그래프
				<!--Table and divs that hold the pie charts-->
			    <div id="numGraph1_div" style="border: 1px solid #ccc"></div>
			</div>
			
			<!-- 월간매출 바그래프 -->
			<div class="double_frame">
			월간매출 바,꺾은선그래프
			<div id="numGraph2_div" style="border: 1px solid #ccc"></div>
			</div> <!-- 월간매출 바그래프 -->
			<br>
		</div> <!-- outer_frame -->
			<!-- To Do List -->
			<div class="todolist_frame">
				<h3>To Do List</h3>
				<table class="todolist">
					<tr class="todolist">
						<td class="todolist">due 2020-03-03</td>
						<td class="todolist">신규입점모니터링</td>
						<td class="todolist"><input type="checkbox" checked="checked"/></td>
						<td class="todolist ">[저장] [삭제]</td>
					</tr>
					<tr class="todolist">
						<td class="todolist"><input type="datetime"></td>
						<td class="todolist" colspan="2"><input type="text"></td>
						<td class="todolist">[저장]</td>
					</tr>				
				</table>
			</div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>