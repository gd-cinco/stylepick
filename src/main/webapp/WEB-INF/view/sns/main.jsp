<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 목록</title>
<link rel="stylesheet" href="${path}/assets/css/sns.css?ver=1">
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<style>

.style-card {
	margin : 10px;
	border : 1px solid #c5c2c2;
	border-radius : 6px;
	background-color: #ffffff;
}

.style-img {
	margin-bottom : 10px;
}

.style-content {
	margin : 0 6px 8px 6px;
}

.style-info {
	margin-left : 38px;
}

.style-profile {
	float : left;
    margin-right : 8px;
}

.txt_box { 
  display: -webkit-box; 
  display: -ms-flexbox; 
  display: box; margin-top:1px;  
  max-height:50px;  
  overflow:hidden;  
  vertical-align:top;  
  text-overflow: ellipsis;  
  word-break:break-all;  
  -webkit-box-orient:vertical;  
  -webkit-line-clamp:3  
} 
</style>
</head>
<body>
<div class="snslist">
<table style="margin:2% 6%;">
	<tr class=".product__con__wrap">
	</tr>
</table>
<c:if test="${param.type==1}">
	<a href="write.shop" class="btn" style="margin-left:40%;">작성하기</a>
</c:if>
<c:if test="${param.type==2}">
	<a href="qna.shop" class="btn" style="margin-left:40%;">작성하기</a>
</c:if>
</div>
<script>

	$(function(){
		var listAmount = 1;
		var status = 0;
		snsList(${param.type},'${param.ksb}',listAmount,status);
	})
	
	function snsList(type,ksb,listAmount,status){
		if(type==1) {	//ootd ajax
			var params = "ksb=" + ksb + "&type=" + type + "&listAmount=" + listAmount + "&status=" + status;
			console.log(params)
			$.ajax({
				data:params,
				type:"get",
				url:"${path}/ajax/main.shop",
				success : function(data) {
					console.log(data);
					$(".product__con__wrap").empty();
					$(".product__con__wrap").append(data);
				},
				error : function(e) {
					alert("sns 조회시 서버 오류:"+e.status);
				}
			})
		} else if(type==2) { //qna ajax
			var params = "type=" + type + "&listAmount=" + listAmount + "&status=" + status;
			console.log(params)
			$.ajax({
				type:"get",
				url:"${path}/ajax/main.shop",
			}).done(function(result){
				console.log(result);
				$(".product__con__wrap").empty();
				// result의 product 가져오기 (forEach)
				for(var items of result) {							
					inputItem(items);
				}
			}).fail(function(error){
				console.log(error);
			});
		}
	}
	
	function inputItem(items) {
		
		var string = // 다른 곳 java파일에 ""안에 붙여넣으면 자동으로 string화 		
			"	<td>" + 
			"		<div class=\"style-card\" onClick=\"location.href ='/sns/detail.shop?=${items.sns_no}'\">" +
			"           	<div class=\"style-img\"><img src=\"file/${items.img1url}\" width=\"226px\" height=\"270px\"></div>" +
			"			<div class=\"style-content\">" +
			"				<div class=\"style-profile\"><img src=\"../assets/img/test6.PNG\" width=\"30px\" height=\"30px\"></div>" +
			"				<div class=\"style-info\">" +
			"   				<div class=\"style-info-first\"> " +
			"						<a>${items.userid}</a>" +
			"						<a style=\"float: right;\">${items.regdate}</a>" +		
			"					</div>" +
			"					<div class=\"style-info-second\">" +
			" 						<div class=\"txt_box\">${items.description}</div>" +
			"							...&nbsp;&nbsp;<a href=\"#\">더보기</a>" +
			"					</div>" +
			"					<div class=\"style-info-third\">" +
			"						<img src=\"../assets/img/test7.PNG\" width=\"15px\" height=\"15px\">좋아요 수" +
			"						<img src=\"../assets/img/test8.PNG\" width=\"15px\" height=\"15px\">댓글 수" +
			"					</div>" +
			"				</div>" +
			"			</div>" +
			"		</div>";
			$(".product__con__wrap").append(string);
	}
	
	$(window).scroll(function(type,ksb) {
		// 스크롤이 80% 이상이 되면 해당 컨텐츠가 자동 생성
		console.log(((window.scrollY + window.innerHeight) / $('body').prop("scrollHeight") * 100));
		 if(((window.scrollY + window.innerHeight) / $('body').prop("scrollHeight") * 100) > 80) 
		  {
			 if(status == 0){
			 	console.log("work");
				 status = 1;
				 $.ajax({
					 type: "get",
					 url: "${path}/ajax/main.shop?ksb='"+ksb+"&type="+type,
				 }).done(function (result) {
					console.log(result);
					for(var items of result) {
						inputItem(items);
					}
					
					listAmount++;
					if(result.length != 0){
						status = 0;						
					}
					
				}).fail(function (error) {
					alert("실패");
				})
				 
			 	}
			}
		});



	
</script>
</body>
</html>