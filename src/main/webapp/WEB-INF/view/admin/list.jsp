<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/list.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>Users list</title>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function allchkbox(allchk){
		//$(".idchks").prop("checked",allchk.checked) //는 okle
		// 클래스 속성이 idchks의 프로퍼티(속성)을 checked라는 속성을 allchk.checked한다.
		
		//getElementbyName : name=idchks인거를 가져다가 chks에 담는다.
		var chks = document.getElementsByName("idchks");
		for(var i=0; i< chks.length; i++){
			chks[i].checked = allchk.checked;
		}//for
	}
	function graph_open(url) {
		var op = "width=800,height=800,scrollbars=yes,left=50,top=150";
		window.open(url+".shop","graph",op);
	}
</script>
</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="#">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="#">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/notice.shop">고객센터</a></li>
			</ul>
	</div>
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left;">
		<form action="mailForm.shop" method="post">
			<h3>Users</h3><br>
		
			<h4 style="text-align: center; margin-bottom: 50px;">스타일픽 개인 회원 리스트</h4>
			<br>
		
			<table class="user_list_table">
				<tr class="user_list_table">
					<th class="user_list_th">아이디</th><th class="user_list_th">이름</th><th class="user_list_th">이메일</th><th class="user_list_th">전화</th><th class="user_list_th">나이</th><th class="user_list_th">성별</th><th class="user_list_th">가입날짜</th><th class="user_list_th">회원수정/마이페이지</th>
					<!-- 
					<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
					 -->
				</tr>
				<c:forEach items="${list}" var="user">
					<tr class="user_list_table">
						<td class="user_list_table">${user.userid}</td>
						<td class="user_list_table">${user.nickname}</td>
						<td class="user_list_table">${user.email}</td>
						<td class="user_list_table">${user.tel}</td>
						<%-- <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td> --%>
						<td class="user_list_table">${user.age}</td>
						<td class="user_list_table">
						<c:choose>
								<c:when test="${user.gender eq '1'}">남자</c:when>
								<c:when test="${user.gender eq '2'}">여자</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td class="user_list_table"><fmt:formatDate value="${user.regdate}" pattern="yyyy-MM-dd"/></td>
						<td class="user_list_table">
							<a href="../user/update.shop?id=${user.userid}">수정</a>
							<a href="../user/delete.shop?id=${user.userid}">강제탈퇴</a>
							<a href="../user/mypage.shop?id=${user.userid}">회원정보</a>
						</td>
						<!-- 
						<td class="user_list_table">
							<input type="checkbox" name="idchks" class="idchks" value="${user.userid}">
						</td>
						 -->
					</tr>
				</c:forEach>
				<!-- 
				<tr>
					<td colspan="9" class="user_list_table">
						<input type="submit" value="메일보내기">
						<input type="button" value="게시물작성그래프보기(막대)" onclick="graph_open('graph1')">
					</td>
				</tr>
				 -->
			</table>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>