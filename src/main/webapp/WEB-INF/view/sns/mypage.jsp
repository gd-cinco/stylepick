<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.2">
<style>
.main-mapper {
	padding : 0 0 2% 0;
}

</style>
</head>
<body>
<div class="user-info">
	<div class="user-profile">
		<img src="../assets/img/user.svg" width="100px" height="100px">&nbsp;&nbsp;userid
		<a href="../user/update.shop" class="button" style="float:right; padding:10px;">수정하기</a>
	</div>
	<div class="user-action">
		<table>
			<tr>
				<td>OOTD</td>
				<td>Following</td>
				<td>Follower</td>
			</tr>
			<tr>
				<td>20</td>
				<td>10</td>
				<td>11</td>
			</tr>
		</table>
	</div>
</div>
<h5>MY STYLE</h5>
<hr>
<div class="user-cards">
	<table>
		<tr>
			<td><img src="../assets/img/test1.PNG" width="226px" height="270px"></td>
			<td><img src="../assets/img/test2.PNG" width="226px" height="270px"></td>
			<td><img src="../assets/img/test3.PNG" width="226px" height="270px"></td>
			<td><img src="../assets/img/test4.PNG" width="226px" height="270px"></td>
		</tr>
	</table>
</div>
</body>
</html>