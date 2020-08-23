<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body>
<div class="center" style="max-width: 900px;">
	<ul class="userul">
		<li class="userli" style="width: auto;"><a class="a_blockbutton blockbutton_selected"
		href="orderList.shop">구매자</a></li>
		<c:if test="${user.seller==1}">
			<li class="userli" style="width: auto;"><a class="a_blockbutton"
			href="sellList.shop">판매자</a></li>
		</c:if>
	</ul>
	<hr style="margin-top: 0px;">
	<div class="user-info" >
	<div class="user-info dummycolor"></div>
	<div style="display: inline; float: left;height: 180px;width: 180px; margin: 0px;text-align: center; padding-top: 26px;margin-top: -113px;">
		<img src="../assets/img/user.svg" width="125px" height="125px"></div>
	<div style="display: inline; float: left; width: 75%;margin-top:-64px;">
		<div class="user-profile">
			${user.nickname}
		</div>
		<div class="user-action">
			<table>
				<tr>
					<td>배송중</td>
					<td>쓰지않은 한줄평</td>
					<td>최근 본 상품</td>
				</tr>
				<tr>
					<td>${shipping}</td>
					<td>${notmentioned}</td>
					<td>11</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	
	<div class="order_downview">
		<div class="order_leftdiv">
			<ul>
				<li><a class="a_leftdivbtn" href="orderList.shop">요약보기</a></li>
				<li><a class="a_leftdivbtn" href="orderList_order.shop">주문내역</a></li>
				<li><a class="a_leftdivbtn leftdivbtn_selected" href="orderList_review.shop">내 한줄평</a></li>
			</ul>
		</div>
		<div class="order_main">
				<h1>내용</h1>
		</div>
	</div>
</div>
</body>
</html>