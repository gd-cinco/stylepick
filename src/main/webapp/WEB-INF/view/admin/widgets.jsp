<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/widgets.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator - Widgets</title>
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
				<li  id="admin_menu"><a href="../admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop" style="color:skyblue;">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="../board/test2.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>Widgets</h3><br>

		<!-- 1. 최근 기록 -->
		<div class="outer_frame">
			<!-- Daily Sales Report -->
			<div class="double_frame" style="border: 1px  solid gray;">
				Daily Sales Report
			</div>
			<!--Recently Joined Users -->
			<div class="double_frame" style="border: 1px  solid gray;">
				Recently Joined Users
			</div>
			<br>
		</div>
		<br><br>
		
		<!-- 2. 스픽 구매랭킹 -->
		<p>스픽 구매 랭킹</p>
		<div class="outer_frame">
			<!-- 이번 달 스픽에서 가장 구매를 많이 한 회원 -->
			<div class="double_frame" style="border: 1px  solid gray;">
				이번 달 스픽에서 가장 구매를 많이 한 회원
			</div>
			<!--올해 스픽에서 가장 구매를 많이 한 회원 -->
			<div class="double_frame" style="border: 1px  solid gray;">
				올해 스픽에서 가장 구매를 많이 한 회원
			</div>
			<br>
		</div>
		
		<!-- 3. 우수 입점 스토어 -->
		<div class="outer_frame">
			<!-- 별점 추이 차트 -->
			<div class="double_frame" style="border: 1px  solid gray;">
				<p>우수 입점 스토어</p>
			</div>
			<!--우수 입점스토어 상위 3개 업체 -->
			<div class="double_frame" style="border: 1px  solid gray;">
				<input type="text" value="1" class="input_round"/>
					<table class="store_frame">
						<tr>
							<td rowspan="2">@</td>
							<td>입점스토어명</td>
						</tr>
						<tr>
							<td>소개</td>
						</tr>
					</table>
			</div>
			<br>
		</div>
		
	</div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>