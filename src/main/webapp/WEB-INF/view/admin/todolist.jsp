<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>to do list</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<script>
		//todolist 등록
		function add_todolist(code){
			console.log($("#commentForm").serialize());
		    $.ajax({
		        type:'POST',
		        url : "<c:url value='/ajax/addTodolist.shop'/>",
		        data:$("#commentForm").serialize(),
		        success : function(data){
		            if(data=="success")
		            {
		                getCommentList();
		                $("#comment").val("");
		            }
		        },
		        error:function(request,status,error){
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		        
		    });
		}
		$(function() {
		//todolist 불러오기
		function getCommentList(){
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='/amax/todoList.shop'/>",
		        dataType : "json",
		        data:$("#commentForm").serialize(),
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		        success : function(data){
		            
		            var html = "";
		            var cCnt = data.length;
		            
		            if(data.length > 0){
		                
		                for(i=0; i<data.length; i++){
		                    html += "<div>";
		                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
		                    html += data[i].comment + "<tr><td></td></tr>";
		                    html += "</table></div>";
		                    html += "</div>";
		                }
		                
		            } else {
		                
		                html += "<div>";
		                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		                html += "</table></div>";
		                html += "</div>";
		                
		            }
		            
		            $("#cCnt").html(cCnt);
		            $("#commentList").html(html);
		            
		        },
		        error:function(request,status,error){
		       }
		    }); //ajax
		}//getTodolist
	}//onload function

	</script>
</body>
</html>