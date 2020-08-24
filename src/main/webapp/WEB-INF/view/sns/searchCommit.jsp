<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<script type="text/javascript">
	var tbl = opener.document.getElementById("Table2");
	var tr = tbl.getElementsByTagName("tr")[${param.index}]
	var td = tr.getElementsByTagName("td")[1]
	var detail = td.getElementsByTagName("input")[0].value = '${detail}'
	self.close();
</script>