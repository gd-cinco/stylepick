<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 목록</title>
<style>

.style-card {
	margin : 10px;
	border : 1px solid #c5c2c2;
	border-radius : 6px;
}

.style-img {
	margin-bottom : 10px;
}

.style-content {
	margin : 0 6px 10px 6px;
}

.style-info {
	margin-left : 38px;
}

.style-profile {
	float : left;
    margin-right : 8px;
}
</style>
</head>
<body>
<div class="snslist">
<table style="margin:2% 6%;">
	<tr>
	<c:forEach var="y" begin="1" end="4">
		<td>
			<div class="style-card">
				<div class="style-img"><img src="test${y}.PNG" width="226px" height="270px"></div>
				<div class="style-content">
					<div class="style-profile"><img src="#" width="30px" height="30px"></div>
					<div class="style-info">
						<div class="style-info-first">
							<a>userid</a>
							<a style="float: right;">20.08.05</a>	
						</div>
						<div class="style-info-second">description</div>
					</div>
				</div>
			</div>
		</td>
	</c:forEach>
	</tr>
		<tr>
	<c:forEach var="y" begin="1" end="4">
		<td>
			<div class="style-card">
				<div class="style-img"><img src="test${y}.PNG" width="226px" height="270px"></div>
				<div class="style-content">
					<div class="style-profile"><img src="#" width="30px" height="30px"></div>
					<div class="style-info">
						<div class="style-info-first">
							<a>userid</a>
							<a style="float: right;">20.08.05</a>		
						</div>
						<div class="style-info-second">description</div>
					</div>
				</div>
			</div>
		</td>
	</c:forEach>
	</tr>
</table>
</div>
</body>
</html>