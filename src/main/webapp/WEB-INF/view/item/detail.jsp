<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp" %>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<link rel="stylesheet" href="${path}/assets/css/detail.css?ver=1.2">
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
    window.open('reply.shop?item_no=${param.item_no }','popName',
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
					<option><c:out value="${i}"/></option>
				</c:forEach>
		</select></dt>
		<dd><select name="size" id="sel">
			<option>사이즈</option>
								<c:forEach items="${item.size}" var="i"  varStatus="n">
									<option>${i}</option>
								</c:forEach>
		</select></dd>
	
	
		<dt><select name="quantity">
								<c:forEach begin="1" end="10" var="i">
									<option>${i}</option>
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
		<c:forEach items="${linelist }" var="line">
		<tr><td><c:forEach var="star" begin="1" end="${line.evaluation }">★</c:forEach></td>
		<td>${line.content } &nbsp;&nbsp;&nbsp;</td>
		<td>
	<fmt:formatDate var="rdate" value="${line.regdate }" pattern="yyyyMMdd"/>
				<c:if test="${today1==rdate }">
					<fmt:formatDate value="${line.regdate}" pattern="HH:mm:ss"/>
					</c:if>
			<c:if test="${today !=rdate }">
					<fmt:formatDate value="${line.regdate}" pattern="yyyy-MM-dd "/>
					</c:if>
				</td>
				<td>${line.userid }</td>
					</tr>
		</c:forEach>
<tr><td colspan="4">
				<c:if test="${pageNum1 >1 }">
					<a href="detail.shop?pageNum1=${pageNum1 -1 }&item_no=${param.item_no}">[이전]</a></c:if>
					<c:if test="${pageNum1 <=1 }">[이전]</c:if>
				<c:forEach var="b" begin="${startpage1 }" end="${endpage1 }">
					<c:if test="${b==pageNum1 }">[${b }]</c:if>
					<c:if test="${b !=pageNum1 }"><a href="detail.shop?pageNum1=${b}&item_no=${param.item_no}">[${b}]</a></c:if>
					</c:forEach>
				<c:if test="${pageNum1 < maxpage}">
				<a href="detail.shop?pageNum1=${pageNum1 +1 }&item_no=${param.item_no}">[다음]</a></c:if>
				<c:if test="${pageNum1 >= maxpage }">[다음]</c:if></td></tr>
	
	</table>
	</div>
	 <br><br>
</div>
<div id="target2">
	 <div class="hr-sect"><h4>상품 후기</h4></div>
	 <div class="reviewList">
	 	<div><button id="reviewbtn" onclick="javascript:preReview()"><<</button></div>
	 	<div class="reviewSnss">
	 	</div>
	 	<div style="margin-left:967px;"><button id="reviewbtn2" onclick="javascript:nextReview()">>></button></div>
	 </div>
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
					 <input type='button' style="width:101px;" onclick='javascript2()' value='답글'/>	</td>
		</c:forEach>
<tr><td colspan="3">
				<c:if test="${pageNum >1 }">
					<a href="detail.shop?pageNum=${pageNum -1 }&item_no=${param.item_no}">[이전]</a></c:if>
					<c:if test="${pageNum <=1 }">[이전]</c:if>
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==pageNum }">[${a }]</c:if>
					<c:if test="${a !=pageNum }"><a href="detail.shop?pageNum=${a}&item_no=${param.item_no}">[${a}]</a></c:if>
					</c:forEach>
				<c:if test="${pageNum < maxpage}">
				<a href="detail.shop?pageNum=${pageNum +1 }&item_no=${param.item_no}">[다음]</a></c:if>
				<c:if test="${pageNum >= maxpage }">[다음]</c:if></td></tr>
	
	</table>
	</div>
</div>
<a href="update.shop?item_no=${item.item_no}">[수정]</a>
<a href="delete.shop?item_no=${item.item_no}">[삭제]</a>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

var pageNum = 1;
var item_no = '${param.item_no}'

$(function(){
	loadReview('${param.item_no}',1);
})


function loadReview(item_no,pageNum){
	var params = "item_no=" + item_no + "&pageNum=" + pageNum;
	console.log(params)
	$.ajax({
		data : params,
		url : "${path}/ajax/reviewSns.shop",
		success : function(data) {
			console.log(data)
			$(".reviewSnss").html(data);
		},
		error : function(e) {
			alert("리뷰 조회시 서버 오류:"+e.status);
		}
	})
}

function nextReview(){
	pageNum++;
	var params = "item_no=" + item_no + "&pageNum=" + pageNum;
	console.log(params)
	$.ajax({
		data : params,
		url : "${path}/ajax/reviewSns.shop",
		success : function(data) {
			console.log(data)
			$(".reviewSnss").html(data);
		},
		error : function(e) {
			alert("리뷰 조회시 서버 오류:"+e.status);
		}
	})
}

function preReview(){
	pageNum--;
	var params = "item_no=" + item_no + "&pageNum=" + pageNum;
	console.log(params)
	$.ajax({
		data : params,
		url : "${path}/ajax/reviewSns.shop",
		success : function(data) {
			console.log(data)
			$(".reviewSnss").html(data);
		},
		error : function(e) {
			alert("리뷰 조회시 서버 오류:"+e.status);
		}
	})
}
</script>
</body>
</html>