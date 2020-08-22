<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main>
	<input type="button" onclick="location.href='${path}/board/addnoti.shop'" value="추가">
	<div class="wrap">
		<h1>공지사항</h1>
		<table id="board" class="display" style="width: 100%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
			</thead>
		</table>
	</div>
</main>
</body>
</html>