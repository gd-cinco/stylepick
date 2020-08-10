<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 목록</title>
<link rel="stylesheet" href="${path}/assets/css/sns.css?ver=1">
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
	margin : 0 6px 8px 6px;
}

.style-info {
	margin-left : 38px;
}

.style-profile {
	float : left;
    margin-right : 8px;
}

.txt_box { 
  display: -webkit-box; 
  display: -ms-flexbox; 
  display: box; margin-top:1px;  
  max-height:50px;  
  overflow:hidden;  
  vertical-align:top;  
  text-overflow: ellipsis;  
  word-break:break-all;  
  -webkit-box-orient:vertical;  
  -webkit-line-clamp:3  
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
				<div class="style-img"><img src="../assets/img/test${y}.PNG" width="226px" height="270px"></div>
				<div class="style-content">
					<div class="style-profile"><img src="../assets/img/test6.PNG" width="30px" height="30px"></div>
					<div class="style-info">
						<div class="style-info-first">
							<a>userid</a>
							<a style="float: right;">20.08.05</a>		
						</div>
						<div class="style-info-second" >
							<div class="txt_box">descriptiondescriptiondescriptiondescription</div>
						...&nbsp;&nbsp;<a href="#">더보기</a>
						</div>
						<div class="style-info-third">
							<img src="../assets/img/test7.PNG" width="15px" height="15px">좋아요 수
							<img src="../assets/img/test8.PNG" width="15px" height="15px">댓글 수
						</div>
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
				<div class="style-img"><img src="../assets/img/test5.PNG" width="226px" height="270px"></div>
				<div class="style-content">
					<div class="style-profile"><img src="../assets/img/test6.PNG" width="30px" height="30px"></div>
					<div class="style-info">
						<div class="style-info-first">
							<a>userid</a>
							<a style="float: right;">20.08.05</a>		
						</div>
						<div class="style-info-second" >
							<div class="txt_box">descriptiondescriptiondescriptiondescription</div>
						...&nbsp;&nbsp;<a href="#">더보기</a>
						</div>
						<div class="style-info-third">
							<img src="../assets/img/test7.PNG" width="15px" height="15px">좋아요 수
							<img src="../assets/img/test8.PNG" width="15px" height="15px">댓글 수
						</div>
					</div>
				</div>
			</div>
		</td>
	</c:forEach>
	</tr>
</table>
<a href="write.shop?type=1" class="btn" style="margin-left:40%;">작성하기</a>
</div>
</body>
</html>