<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<link rel="stylesheet" href="${path}/assets/css/detail.css?ver=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function fnMove(seq){
    var offset = $("#div" + seq).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}
</script>
</head>
<body>
<form action="../cart/cartAdd.shop">
<div>
<div class="pic" >
  <img src="img/${item.pictureUrl }" width="400px" height="450px" id="img">
</div>

<div class="etc">
	<ul>
		<dl>
		<dt><h5>${item.userid }</h5></dt>
		
		<dt><h2>${item.item_name }</h2></dt>
		<dt><h3>${item.price }원</h3></dt>
		<dt>${item.keyword }</dt>
	</ul>
	<ul>
		<dl><dt><select name="option">
				<option>옵션</option>
				<c:forEach items="${item.item_option}" var="i">
					<option><c:out value="${i }"/></option>
				</c:forEach>
		</select></dt>
		<dd><select name="size" id="sel">
			<option>사이즈</option>
								<c:forEach items="${item.size}" var="i" >
									<option>${i } </option>
								</c:forEach>
		</select></dd>
	
	
		<dt><select name="quantity">
								<c:forEach begin="1" end="10" var="i">
									<option>${i }</option>
								</c:forEach>
		</select></dt></dl>
	</ul>
	
	<input type="submit" style="width:400px;height:40px;color: #4cd3e3; border: 1px solid #4cd3e3;background: #fff;" value="장바구니">
	<a href="#" class="genric-btn success radius" style="width:400px;">구매하기</a>
</div>
</div>
</form>

<div>
<br><br>
<h2 style="width:1000px; background:#f8f8f8;"><center><span><a href="#target">상품 정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span><a href="#target1">상품 한줄평</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span><a href="#target2">상품 후기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span><a href="#target3">Q&A</a></span></center></h2>
<br><br>
</div>

<div id="target">
	 <div class="hr-sect"><h4>상품 정보</h4></div>
	<textarea style="background:white;" placeholder="Disabled" disabled>${item.content }</textarea>
	<br><br><br><br>
</div>
<div id="target1">

	 <div class="hr-sect"><h4>한줄평</h4></div>
	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<div id="target2">
	 <div class="hr-sect"><h4>상품 후기</h4></div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<div id="target3">
	 <div class="hr-sect"><h4>Q&A</h4></div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<a href="update.shop?item_no=${item.item_no }">[수정]</a>
<a href="delete.shop?item_no=${item.item_no }">[삭제]</a>
</body>
</html>