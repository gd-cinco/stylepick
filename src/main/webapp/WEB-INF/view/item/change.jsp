<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평</title>
<style>
	.con{
position:absolute;
top:30%;
left:20%;
transform:translate(-50%,-50%) rotateY(180deg);
display:flex;
	}
.con input{
display:none;
}	

.con label{
display:block;
cursor : pointer;
width:50px;
background:ccc;
}

.con label:before{
content:'\f005';
font-family:fontAwesome;
position:relative;
display:block;
font-size:50px;
color:#101010;
}
	
	.con label:after{
content:'\f005';
font-family:fontAwesome;
position:absolute;
display:block;
font-size:50px;
color:#1f9cff;
top:0;
opacity:0;
transition: .5s;
text-shadow: 0 2px 5px rgba(0,0,0,.5);
}

.con label:hover:after,
.con label:hover ~ label:after,
.con input:checked ~ label:after
{
opacity: 1;
}

#con{
position:absolute;
top:35%;
left:0%;
}
#con1{
position:absolute;
top:75%;
left:0%;
}
</style>
<script type="text/javascript">
function refresh(){
opener.document.location.reload();
	self.close();
}
</script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
</head>
<body onunload="refresh()">
   <h1>한줄평 수정하기!</h1>
<form:form modelAttribute="line" action="change.shop" method="post"  name="f">
 <input type="hidden" name="line_no"  value="${param.line_no}">
 <input type="hidden" name="userid" value="${sessionScope.loginUser.userid}">
	<p class="title_star">별점과 리뷰를 수정 해주세요.</p>
	<div class="con">
	<input type="radio" name="evaluation" id="star5" value="5"><label for="star5"></label>
	<input type="radio" name="evaluation" id="star4" value="4"><label for="star4"></label>
	<input type="radio" name="evaluation" id="star3" value="3"><label for="star3"></label>
	<input type="radio" name="evaluation" id="star2" value="2"><label for="star2"></label>
	<input type="radio" name="evaluation" id="star1" value="1"><label for="star1"></label>
	</div>
	<div>
<textarea id="con" name="content" cols="99" rows="12" >${line.content }</textarea>
</div>
<input id="con1"  type="submit" class="genric-btn success medium" value="작성" >
</form:form>

</body>
</html>