<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>상품 등록</title>
<link rel="stylesheet" href="${path}/assets/css/add.css?ver=1">
<script type="text/javascript">
var oTbl;
//Row 추가
function insRow() {
oTbl = document.getElementById("addTable");
var oRow = oTbl.insertRow();
oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
var oCell = oRow.insertCell();

//삽입될 Form Tag

var frmTag = "<input type=text name=item_option style=width:380px; height:20px;> ";
frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand; width:380px;'>";
oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
oTbl.deleteRow(oTbl.clickedRowIndex);
}

//function frmCheck()
//{
//var frm = document.form;
//
//for( var i = 0; i <= frm.elements.length - 1; i++ ){
//   if( frm.elements[i].name == "addText" )
//   {
//       if( !frm.elements[i].value ){
//           alert("텍스트박스에 값을 입력하세요!");
//               frm.elements[i].focus();
//	 return;
//        }
//    }
// }
//}
</script>
<script>
var oTbl1;
//Row 추가
function insRow1() {
oTbl1 = document.getElementById("addTable1");
var oRow1 = oTbl1.insertRow();
oRow1.onmouseover=function(){oTbl1.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
var oCell = oRow1.insertCell();

//삽입될 Form Tag
var frmTag = "<input type=text name=size style=width:380px; height:20px;> ";
frmTag += "<input type=button value='삭제' onClick='removeRow1()' style='cursor:hand; width:380px;'>";
oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow1() {
oTbl1.deleteRow(oTbl1.clickedRowIndex);
}
</script>
</head>
<body>
	<h1>상품 올리기</h1>
	<h5>상품 올리기 관련 문의가 필요하시 다면 &nbsp;&nbsp; <a href="#" style="color:#35c5f0; font-size:15px">문의하러 가기</a></h5>
	<br><br>
<form:form modelAttribute="item" action="register.shop" enctype="multipart/form-data" name="f">
<form:hidden path="userid" value="${sessionScope.loginUser.userid}"/>
	<div>
	<div>
	상품분류
	</div>
	<br>
	<div>
	 <select class="category1" name="category">
	 		<option value="">카테고리</option>
	 		<option value="1">모자</option>
	 		<option value="2">아우터</option>
	 		<option value="3">원피스</option>
	 		<option value="4">상의</option>
	 		<option value="5">하의</option>
	 		<option value="6">가방</option>
	 		<option value="7">신발</option>
	 		<option value="8">시계</option>
	 </select>
	</div>
	<br>
	<br>
	<div class="subject-name">
	<ul class="subject-name2">상품 제목</ul>
	<dl><input type="text" name="subject" maxlength="20"  style="width:400px;"></dl>
	</div>
	
	<div>
	<div class ="ii">
	<ul>상품 이름</ul>
	<dl><form:input path="item_name" maxlength="20" /></dl>
	</div>
	<div class="ii">
	<ul>상품 코드</ul>
	<dl><form:input path="code"/></dl>
	</div>
	</div>
	
	<div>
	<ul>상품 설명</ul>
	<dl><form:textarea path="content" cols="99" rows="12" /></textarea></dl>
	</div>
	
	<div>
	<div class ="oi">
	<ul>상품 옵션</ul>

	<dl><input type="text" name="item_option" style="width:345px"><input name="addButton" type="button" style="cursor:hand; width:45px;" onClick="insRow()" value="+" ></dl>
	<table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0"></table>
	</div>
	
	<div class="oi">
		<ul>사이즈</ul>

	<dl><input type="text" name="size" style="width:345px"><input name="addButton1" type="button" style="cursor:hand; width:45px;" onClick="insRow1()" value="+" ></dl>

		<table id="addTable1" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0"></table>
	</div>
	</div>
	
	<div>
	<div class ="ii">
	<ul>키워드</ul>
	<dl><form:input path="keyword"/></dl>

	</div>
	<div class="ii">
		<ul>가격</ul>
	<dl><form:input path="price"/></dl>
	</div>
	</div>

	<div>
	<ul>대표이미지</ul>
	<input type="file" name="imgurl">
	</div>
	<br>
<input type="submit" class="genric-btn success medium" value="상품올리기">
	</div>
 
</form:form>


</body>
</html>