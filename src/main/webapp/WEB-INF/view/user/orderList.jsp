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
					<td>구매후기</td>
					<td>최근 본 상품</td>
				</tr>
				<tr>
					<td>5</td>
					<td>10</td>
					<td>11</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	
	<div class="order_downview">
		<div class="order_leftdiv">
			<ul>
				<li><a class="a_leftdivbtn leftdivbtn_selected" href="orderList.shop">요약보기</a></li>
				<li><a class="a_leftdivbtn" href="orderList_order.shop">주문내역</a></li>
				<li><a class="a_leftdivbtn" href="orderList_review.shop">내 한줄평</a></li>
			</ul>
		</div>
		<div class="order_main">
			<div class="order_main_block">
				<a class="order_header">주문내역</a>
				<table class="order_table">
					<tr class="order">
					<th class="order" style="width: 40%">품목</th>
					<th class="order" style="width: 20%">주문일자</th>
					<th class="order" style="width: 20%">가격</th>
					<th class="order" style="width: 20%">상태</th>
					</tr>
					<c:forEach items="${order}" var="item" end="5" varStatus="stat">
						<tr class="order">
							<td class="order">${item.item_name}</td>
							<td class="order"><fmt:formatDate value="${item.orderdate}" pattern="yyyy-MM-dd"/></td>
							<td class="order">${item.price}</td>
							<td class="order">${item.stat}</td>
						</tr>
					</c:forEach>
				
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>