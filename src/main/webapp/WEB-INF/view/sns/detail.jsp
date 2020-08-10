<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 상세보기</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1">
<style>
	.form {
   	 	margin-left: auto;
    	margin-right: auto;
    	width: 900px;
    	border : 1px solid #dad7d7;
    	background-color : #ffffff;
	}
	
	h4 {
		margin : 10px 0px;
	}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="fullview-inner-wrapper">
		<input type="hidden" name="type" value="${type}">
		<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}"/>
	<div class="pictures-wrapper">
		<div class="pictures op-carousel">
			<img src="#" width="600px" height="600px">
		</div>
	</div>
	<div class="side-position">
		<div class="style info">
			<table>
				<tr>
					<td>Outer</td>
					<td>Covernat</td>
				</tr>
			</table>
		</div>
		<div class="style description">
		</div>
	</div>
</div>
</body>
</html>