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
				<div id="canvas-holder-one" style="width:100%; height:100%;">
				<canvas id="chart-area-one" width="100%" height="100%"></canvas>
				</div>
				<script type="text/javascript">
					var randomColorFactor = function() {
						return Math.round(Math.random() * 255);
					}
					//rgb :
						var randomColor = function(opacity){
							return "rgba("+randomColorFactor() + ","+ randomColorFactor() + "," + randomColorFactor() + "," + (opacity || '.3') +")"; 
					};
					var color = randomColor(1)
					var config = {
						type: 'bar',
						data: {
							datasets : [{
								data:[<c:forEach items="${map}" var="m">"${m.value}",</c:forEach>],
								backgroundColor:[	<c:forEach items="${map}" var="m">randomColor(1),</c:forEach>]
							}],
							labels:[<c:forEach items="${map}" var="m">"${m.key}",</c:forEach>]
						},
						options:{
							responsive:true,
							legend: {display:false},
							title:{display:true, text: '게시판 작성자 분석'},
							scales: { yAxes: [{	ticks: {beginAtZero:true}	 }] }//scales
						}//options
					};//config
					window.onload=function(){
						var ctx = document.getElementById("chart-area-one").getContext("2d");
						new Chart(ctx,config);
					}
				</script>
			</div>
			
			<!-- 월간매출 바그래프 -->
			<div class="double_frame">
			월간매출 바,꺾은선그래프
			<div id="canvas-holder-two" style="width:100%; height:100%;">
				<canvas id="chart-area-two" width="100%" height="100%"></canvas>
				</div>
				<script type="text/javascript">
					var randomColorFactor = function() {
						return Math.round(Math.random() * 255);
					}
					//rgb :
						var randomColor = function(opacity){
							return "rgba("+randomColorFactor() + ","+ randomColorFactor() + "," + randomColorFactor() + "," + (opacity || '.3') +")"; 
					};
					var color = randomColor(1)
					var config = {
						type: 'bar',
						data: {
							datasets : [{
								data:[<c:forEach items="${map}" var="m">"${m.value}",</c:forEach>],
								backgroundColor:[	<c:forEach items="${map}" var="m">randomColor(1),</c:forEach>]
							}],
							labels:[<c:forEach items="${map}" var="m">"${m.key}",</c:forEach>]
						},
						options:{
							responsive:true,
							legend: {display:false},
							title:{display:true, text: '2번째 차트'},
							scales: { yAxes: [{	ticks: {beginAtZero:true}	 }] }//scales
						}//options
					};//config
					window.onload=function(){
						var ctx = document.getElementById("chart-area-two").getContext("2d");
						new Chart(ctx,config);
					}
				</script>
			</div>
			<!-- 월간매출 바그래프 -->
			<br>
	</div>
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