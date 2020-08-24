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
<script >
//버튼클릭시 javascript 호출합니다.
function javascript(){
	window.name="par1"
    window.open('line.shop?item_no=${param.item_no}','popName',
                'width=800,height=500,top=200,left=400,');
}

function javascript1(){
    window.open('qna.shop?item_no=${param.item_no}','popName',
                'width=800,height=500,top=200,left=400,');
}


function javascript2(){
    window.open('reply.shop?qna_no=${param.qna_no }','popName',
                'width=800,height=500,top=200,left=400,');
}



</script>

<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>

<div>
<form action="../cart/cartAdd.shop">
<div class="pic" >
  <img src="img/${item.pictureUrl }" width="350px" height="450px" id="img">
</div>
	<input type="hidden" name="item_no" value="${item.item_no }">
	<input type="hidden" name="userid" value="${item.userid }">
	<input type="hidden" name="item_name" value="${item.item_name }">
	<input type="hidden" name="item_price" value="${item.price }">
	<input type="hidden" name="pictureUrl" value="${item.pictureUrl}">
<div class="etc">
	<ul>
		<dl>
		<dt><h5>${item.userid }</h5></dt>
		<dt><h2>${item.item_name }</h2></dt>
		<dt><h3>${item.price }원</h3></dt>
		<dt>${item.keyword }</dt>

	</ul>
	<ul>
		<dl><dt><select name="item_option">
				<option>옵션</option>
				<c:forEach items="${item.item_option}" var="i" varStatus="n">
					<option value="${n.index}"><c:out value="${i}"/></option>
				</c:forEach>
		</select></dt>
		<dd><select name="size" id="sel">
			<option>사이즈</option>
								<c:forEach items="${item.size}" var="i"  varStatus="n">
									<option value="${n.index}">${i } </option>
								</c:forEach>
		</select></dd>
	
	
		<dt><select name="quantity">
								<c:forEach begin="1" end="10" var="i">
									<option>${i }</option>
								</c:forEach>
		</select></dt></dl>
	</ul>
	

</div>
<br><br>

<div >
	<input  class="genric-btn success radius"  style="width:400px; margin-left:50px; type="button" value="상품목록" onclick="location.href='list.shop'">
	<input type="submit"  style="width:400px;height:40px;color: #4cd3e3; border: 1px solid #4cd3e3;background: #fff; margin-left:100px; cursor:pointer;" value="장바구니">
	<!-- <a href="#" class="genric-btn success radius" style="width:400px; margin-left:150px;">구매하기</a> -->
</div>
</form>
</div>
<div style="width:1000px;">
<div>
<br><br>
<h2 style="width:1000px; background:#f8f8f8;"><center><span><a href="#target">상품 정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span><a href="#target1">상품 한줄평</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span><a href="#target2">상품 후기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span><a href="#target3">Q&A</a></span></center></h2>
<br><br>
</div>
<div id="target">
	 <div class="hr-sect"><h4>상품 정보</h4></div>
	 <br>
	<div>${item.content }</div>
	<br><br><br><br>
</div>
<div id="target1">

	 <div class="hr-sect"><h4>한줄평</h4></div>
	 <div style="float:right;">
	   <input type='button' class="genric-btn info-border circle arrow" style="width:101px;" onclick='javascript()' value='한줄평'/></div>
	<div>
	<br>
	<!--별점 평균 사진 놓을 곳  -->
	<table>
	<tr><td>별</td><td>내용</td><td>등록일</td><td>사용자</td></tr>
	
	</table>
	</div>
	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<div id="target2">
	 <div class="hr-sect"><h4>상품 후기</h4></div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<div id="target3">
	 <div class="hr-sect"><h4>Q&A</h4></div>
	  <div style="float:right;">
	   <input type='button' class="genric-btn info-border circle arrow" style="width:101px;" onclick='javascript1()' value='작성하기'/></div>
	<br><br><br>
	<div>
	<div>
	<table>
		<c:forEach items="${qnalist }" var="qna">
		<tr><td style="font-size:20px; color:#4ebafc"><c:if test="${qna.type ==0 }">Q</c:if><c:if test="${qna.type ==1 }">A</c:if></td>
		<td>${qna.userid } &nbsp;&nbsp;&nbsp;
	<fmt:formatDate var="rdate" value="${qna.regdate }" pattern="yyyyMMdd"/>
				<c:if test="${today==rdate }">
					<fmt:formatDate value="${qna.regdate}" pattern="HH:mm:ss"/>
					</c:if>
			<c:if test="${today !=rdate }">
					<fmt:formatDate value="${qna.regdate}" pattern="yyyy-MM-dd "/>
					</c:if>
				<br>
					${qna.content }</td>
					<td>
					 <input type='button' style="width:101px;" onclick='javascript2()' value='답글'/>
				
					
		</c:forEach>

	
	</table>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<a href="update.shop?item_no=${item.item_no }">[수정]</a>
<a href="delete.shop?item_no=${item.item_no }">[삭제]</a>
</div>
</body>
</html>