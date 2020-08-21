<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평</title>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="star-rating.css">
	<style>

	.con{
	height:60px;
	width:330px;
	position:relative;
	margin:auto;
	left:0;
	right:0;
	top:0;
	botoom:0;
	}
	.fa-star{
	font-size:65px;
	}
	</style>
	<script >
	$(document).ready(function(){
		$("#s1").click(function(){
			$(".fa-star").css("color","black")
			$("#s1").css("color","yellow");
		});
		$("#s2").click(function(){
			$(".fa-star").css("color","black")
			$("#s1,#s2").css("color","yellow");
		});
		$("#s3").click(function(){
			$(".fa-star").css("color","black")
			$("#s1,#s2,#s3").css("color","yellow");
		});
		$("#s4").click(function(){
			$(".fa-star").css("color","black")
			$("#s1,#s2,#s3,#s4").css("color","yellow");
		});
		$("#s5").click(function(){
			$(".fa-star").css("color","black")
			$("#s1,#s2,#s3,#s4,#s5").css("color","yellow");
		});
		
	})
	</script>
</head>
<body>
<form:form modelAttribute="item" action="write.shop"  name="f">
 <form:hidden path="item_no" value="${sessionScope.item_no}"/>
 <form:hidden path="userid" value="${sessionScope.loginUser.userid}"/>
	<div class="con">
		<i class="fa fa-star" aria-hidden="true" id="s1" name="evaluation" value="1"></i>
		<i class="fa fa-star" aria-hidden="true" id="s2" name="evaluation" value="2"></i>
		<i class="fa fa-star" aria-hidden="true" id="s3" name="evaluation" value="3"></i>
		<i class="fa fa-star" aria-hidden="true" id="s4" name="evaluation" value="4"></i>
		<i class="fa fa-star" aria-hidden="true" id="s5" name="evaluation" value="5"></i>
		<br>
	</div>
	<div>
<textarea name="content" cols="99" rows="12" ></textarea>
</div>
<input type="submit" class="genric-btn success medium" value="작성">
</form:form>

</body>
</html>