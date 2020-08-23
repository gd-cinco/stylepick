<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet" href="../assets/css/user.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function(){
			$(this).hide();
		})
		$("#tab1").addClass("select");
	})
	function disp_div(id,tab){
		$(".info").each(function(){
			$(this).hide();
		})
		$(".tab").each(function(){
			$(this).removeClass("select");
			this.style.backgroundColor='white';
		})
		$("#"+id).show();
		$("#"+tab).addClass("select");
		document.getElementById(tab).style.backgroundColor='#35C5F0';
	}
	function list_disp(id){
		$("#"+id).toggle();
	}
</script>
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
					<td style="color: red;">최근 본 상품</td>
				</tr>
				<tr>
					<td>${shipping}</td>
					<td>${notmentioned}</td>
					<td style="color: red;">11</td>
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
			<table class="order_table">
				<tr class="order2">
					<td id="tab1" class="tab order2" style="background-color: #53C5F0;">
						<a class="blacka" href="javascript:disp_div('minfo','tab1')">작성가능 구매후기</a></td>
					<c:if test="${param.id !='admin'}">
					<td id="tab2" class="tab order2">
						<a class="blacka" href="javascript:disp_div('oinfo','tab2')">작성한 구매후기</a></td>
					</c:if></tr>
			</table>
			<div id="minfo" class="info">
				<c:forEach items="${sale}" var="sale" varStatus="stat">
					<c:if test="${sale.reviewed==0}">
					<div class="order_buyitem">
						<div class="order_buyitem_left">
							<img src="../item/img/${sale.item.pictureUrl}" style="width: 150px;height: 150px;" id="img">
						</div>
						<div class="order_buyitem_center">
							<div class="order_buyitem_center_text" style="font-size: 25px;">${sale.item.item_name}</div>
							<div class="order_buyitem_center_text" style="font-size: 15px;">
							<fmt:formatDate value="${orderdate[stat.index]}" pattern="yyyy/MM/dd E"/> 
							</div>
							<div class="order_buyitem_center_text" style="font-size: 15px;">${sale.item.price}원 / ${sale.quantity}개</div>
						</div>
						<div class="order_buyitem_right">
							<div class="order_buyitem_buttondiv">
								<button onclick="window.open('../item/line.shop?item_no=${buylist.item.item_no}','','width=800,height=600,top=200,left=400')"
										 class="order_buyitem_button2">한줄평 쓰기</button>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
			<div id="oinfo" class="info" style="display: none;width: 100%; background-color: yellow; ">
				<c:forEach items="${sale}" var="sale" varStatus="stat">
					<c:if test="${sale.reviewed==1}">
					<div class="order_buyitem">
						<div class="order_buyitem_left">
							<img src="../item/img/${sale.item.pictureUrl}" style="width: 150px;height: 150px;" id="img">
						</div>
						<div class="order_buyitem_center">
							<div class="order_buyitem_center_text" style="font-size: 25px;">${sale.item.item_name}</div>
							<div class="order_buyitem_center_text" style="font-size: 15px;">
							<fmt:formatDate value="${orderdate[stat.index]}" pattern="yyyy/MM/dd E"/> 
							</div>
							<div class="order_buyitem_center_text" style="font-size: 15px;">${sale.item.price}원 / ${sale.quantity}개</div>
						</div>
						<div class="order_buyitem_right">
							<div class="order_buyitem_buttondiv">
								<button class="order_buyitem_button2">수정</button>
								<button class="order_buyitem_button2">삭제</button>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>