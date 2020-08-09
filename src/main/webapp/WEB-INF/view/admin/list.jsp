<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/list.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
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
				<li  id="admin_menu"><a href="../board/test2.shop">고객센터</a></li>
			</ul>
	</div>
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left;">
		<form action="mailForm.shop" method="post">
			<table>
				<tr>
					<td colspan="7">회원목록</td>
				</tr>
				<tr>
					<th>아이디</th><th>이름</th><th>전화</th><th>생일</th><th>이메일</th><th>&nbsp;</th><th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
				</tr>
				<c:forEach items="${list}" var="user">
					<tr>
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.phoneno}</td>
						<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
						<td>${user.email}</td>
						<td>
							<a href="../user/update.shop?id=${user.userid}">수정</a>
							<a href="../user/delete.shop?id=${user.userid}">강제탈퇴</a>
							<a href="../user/mypage.shop?id=${user.userid}">회원정보</a>
						</td>
						<td>
							<input type="checkbox" name="idchks" class="idchks" value="${user.userid}">
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="7">
						<input type="submit" value="메일보내기">
						<input type="button" value="게시물작성그래프보기(막대)" onclick="graph_open('graph1')">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>