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
		<li class="userli" style="width: auto;"><a class="a_blockbutton"
		href="orderList.shop">구매자</a></li>
		<li class="userli" style="width: auto;"><a class="a_blockbutton blockbutton_selected2"
		href="orderList_s.shop">판매자</a></li>
	</ul>
	<hr style="margin-top: 0px;">
	<div class="user-info" >
	<div style="display: inline; float: left;height: 180px;width: 180px; margin: 0px;text-align: center; padding-top: 26px;"><img src="../assets/img/user.svg" width="125px" height="125px"></div>
	<div style="display: inline; float: left; width: 75%">
		<div class="user-profile">
			${user.com_name}
		</div>
	</div>
		<div class="user-action">
			<table>
				<tr>
					<td>판매수익</td>
					<td>등록한 상품</td>
					<td>판매 완료</td>
					<td>문의 관리</td>
				</tr>
				<tr>
					<td>5</td>
					<td>10</td>
					<td>11</td>
					<td>4</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="user-info dummycolor" style="background-color: #FE6500"></div>

		<div class="order_leftdiv">
		<ul>
			<li><a href="sellList.shop">요약보기</a></li>
			<li><a href="sellList_item.shop">등록상품</a></li>
			<li><a href="sellList_list.shop">내 한줄평</a></li>
			<li><a href="sellList_qna.shop">문의관리</a></li>
		</ul>
	</div>
</div>
</body>
</html>