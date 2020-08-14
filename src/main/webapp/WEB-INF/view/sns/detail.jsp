<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 상세보기</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.1">
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
		<div class="style-button">
			<c:if test="${sessionScope.loginUser.userid==sns.userid}">
				<a href="supdate.shop" class="button" style="padding: 10px 20px; margin: 25px 0 29px 40%; color: #ffffff;">수정</a>
				<a href="sdelete.shop" class="button" style="margin-left: 1%;padding: 10px 20px;background-color: #ff003c;color: #ffffff;">삭제</a>
			</c:if>
		</div>
	</div>
	<div class="side-position">
	<!-- 1 : OOTD일 경우, 2 : QnA일 경우
		<c:if test="${type==1}">
		<div class="side style-info">
			<table>
				<tr>
					<td class="category">Outer</td>
					<td>Covernat</td>
				</tr>
			</table>
		</div>
		</c:if>
		-->
		<div class="side style-content">
			<div class="style-profile"><img src="../assets/img/test6.PNG" width="30px" height="30px">userid</div>
			<div class="style-description">캐주얼룩😀#데일리룩 #캐주얼룩 #남자코디 #대학생룩 #남친룩</div>
		</div>
		<div class="style-action">
			<img src="../assets/img/test7.PNG" width="30px" height="30px">LIKE
		</div>
		<div class="style-comment">
			<img src="../assets/img/test8.PNG" width="30px" height="30px">Comment (댓글수)
			<textarea placeholder="댓글을 입력하세요" style="width:300px; height:50px; margin-top:10px;"></textarea>
			<button style="height: 50px;float: right; margin-top:10px;">입력</button>
			<table>
			</table>
		</div>
	</div>
</div>
</body>
</html>