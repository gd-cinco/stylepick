<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.2">
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.main-mapper {
	padding : 0 0 2% 0;
}

.style-card {
	margin : 10px;
	border : 1px solid #c5c2c2;
	border-radius : 6px;
	background-color: #ffffff;
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
<div class="user-info">
	<div class="user-profile">
		<img src="../assets/img/user.svg" width="100px" height="100px">&nbsp;&nbsp;${user.nickname}
		<a href="../user/update.shop?id=${user.userid}" class="button" style="float:right; padding:10px;">수정하기</a>
	</div>
	<div class="user-action">
		<table>
			<tr>
				<td>OOTD</td>
				<td>Following</td>
				<td>Follower</td>
			</tr>
			<tr>
				<td>${mysnsnum}</td>
				<td>10</td>
				<td>11</td>
			</tr>
		</table>
	</div>
</div>
<h5>MY STYLE</h5>
<hr>
<div class="user-cards">
	<table>
		<tr>
			<c:forEach var="s" items="${mysnslist}">
				<td><div class="style-card" onClick="location.href ='${path}/sns/detail.shop?sns_no=${s.sns_no}'">
					<c:if test="${!empty s.img1url}">
						<div class="style-img"><img src="file/${s.img1url}" width="226px" height="270px"></div>
					</c:if>
					<div class="style-content">
						<div class="style-profile"><img src="../assets/img/test6.PNG" width="30px" height="30px"></div>
						<div class="style-info">
							<div class="style-info-first">
								<a>${s.userid}</a>
								<a style="float: right;"><fmt:formatDate pattern="yyyy.MM.dd" value="${s.regdate}"/></a>		
							</div>
							<div class="style-info-second" >
								<div class="txt_box">${s.description}</div>
							...&nbsp;&nbsp;<a href="#">더보기</a>
							</div>
							<div class="style-info-third">
								<img src="../assets/img/test7.PNG" width="15px" height="15px">&nbsp;&nbsp;${s.likenum}&nbsp;&nbsp;&nbsp;&nbsp;
								<img src="../assets/img/test8.PNG" width="15px" height="15px">&nbsp;&nbsp;${s.commentnum}
							</div>
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