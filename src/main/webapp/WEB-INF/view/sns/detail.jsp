<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 상세보기</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.2">
<c:set var="path" value="${pageContext.request.contextPath}" />
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
		<c:if test="${sns.type==1 && !empty snsitems}">
		<div class="side style-info">
			<table>
				<c:forEach var="s" items="${snsitems}">
				<tr>
					<td class="category">${s.category}</td>
					<td>${s.detail}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>
		<div class="side style-content">
			<div class="style-profile"><img src="../assets/img/test6.PNG" width="30px" height="30px">${user.nickname}</div>
			<div class="style-description">${sns.description}</div>
		</div>
		<div class="style-action">
			<img src="../assets/img/test7.PNG" width="30px" height="30px">LIKE
		</div>
		<div class="style-comment">
			<img src="../assets/img/test8.PNG" width="30px" height="30px">Comment (댓글수)
			<form class="comment-feed__form" name="f" action="comment.shop" method="post">
				<input type="hidden" name="sns_no" value="${param.sns_no}"/>
				<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}"/>
				<textarea name="content" placeholder="댓글을 입력하세요" style="width:300px; height:50px; margin-top:10px;"></textarea>
				<button type="submit" style="height: 50px;float: right; margin-top:10px;">입력</button>
			</form>
			<table class="reply_list"> 
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

$(function( ){
	loadComment('${param.sns_no}');
})

function loadComment(sns_no){
	var params = "sns_no=" + sns_no;
	console.log(params)
	$.ajax({
		data : params,
		url : "${path}/ajax/commentlist.shop",
		success : function(data) {
			console.log(data)
			$(".reply_list").html(data);
		},
		error : function(e) {
			alert("댓글 조회시 서버 오류:"+e.status);
		}
	})
}

</script>
</body>
</html>