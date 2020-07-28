<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<title><decorator:title/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/css/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<decorator:head/>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
    <a href="${path}/user/main.shop" class="w3-bar-item w3-button w3-theme-l1">main</a>
    <a href="${path}/board/list.shop" class="w3-bar-item w3-button w3-hide-small w3-hover-white">board</a>
    
    					<span style="float: right;">
    				<c:if test="${empty sessionScope.loginUser}">
						<a href="${path}/user/login.shop">로그인</a>
						<a href="${path}/user/userEntry.shop">회원가입</a>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser}">
						${sessionScope.loginUser.username}님이 로그인 하셨습니다. &nbsp; &nbsp;
						<a href="${path}/user/logout.shop">로그아웃</a>
					</c:if>
				</span>
    
    
  </div>
</div>

<!-- Sidebar -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4 class="w3-bar-item"><b>Menu</b></h4>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/user/main.shop">회원관리</a>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/item/list.shop">상품관리</a>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/board/list.shop">게시판</a>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px">
	<br><br>
  <div class="w3-row w3-padding-64">
    <div class="w3-container">
       <decorator:body/>
    </div>
  </div>
 
 
  <!-- Pagination -->
  <!-- 
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a class="w3-button w3-black" href="#">1</a>
      <a class="w3-button w3-hover-black" href="#">2</a>
      <a class="w3-button w3-hover-black" href="#">3</a>
      <a class="w3-button w3-hover-black" href="#">4</a>
      <a class="w3-button w3-hover-black" href="#">5</a>
      <a class="w3-button w3-hover-black" href="#">▶</a>
    </div>
  </div>
 -->
 
  <footer id="myFooter">
  	
    <div class="w3-container w3-theme-l2 w3-padding-32">
      <h5 align="right">★</h5>
    </div>

    <div class="w3-container w3-theme-l1">
      <p align="right">빅데이터 플랫폼 개발자 양성 과정 2회차 모델2 프로그램 연습</p>
    </div>
  </footer>

<!-- END MAIN -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>
<!-- 더미데이터 -->
<script>
	var randomColorFactor = function(){
		return Math.round(Math.random()*255);
	}
	var randomColor = function(opa){
		return "rgba(" + randomColorFactor() + ","
		+ randomColorFactor() + ","
		+ randomColorFactor() + ","
		+ (opa  || '.3')+")";
	}
	$(function(){
		//graphs();
		//exchangeRate();
		//exchangeRate2();
	})
	function exchangeRate(){
		$.ajax("${path}/ajax/exchange1.shop",{
			success : function(data){
				$("#exchange1").html(data);
			},
			error : function(e){
				alert("환율조회시 서버 오류:"+e.status);
			}
		})
	}
	
	function exchangeRate2(){
		$.ajax("${path}/ajax/exchange2.shop",{
			success : function(data){
				$("#exchange2").html(data);
			},
			error : function(e){
				alert("환율조회시 서버 오류:"+e.status);
			}
		})
	}
	
	function graphs(){
		$.ajax("${path}/ajax/graph1.shop",{
			success : function(data){
				pieGraphPrint(data);
			},
			error : function(e){
				alert("서버 오류 : "+e.status);
			}
			
		})
		$.ajax("${path}/ajax/graph2.shop",{
			success : function(data){
				barGraphPrint(data);
			},
			error : function(e){
				alert("서버 오류 : "+e.status);
			}
			
		})
	}
	function pieGraphPrint(data){
		console.log(data)
		var rows= JSON.parse(data);
		var names = []
		var datas = []
		var colors = []
		$.each(rows,function(index,item){
			names[index] = item.name;
			datas[index] = item.cnt;
			colors[index] = randomColor(1);
		})
		var config = {
			type : 'pie',
			data : {
				datasets : [{
					data : datas,
					backgroundColor : colors
				}],
				labels : names
			},
			options : {
				responsive : true,
				legend : {position : 'top'},
				title : {
					display : true,
					text : '글쓴이 별 게시판 등록 건수',
					position : 'bottom'
				}
			}
		}
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx,config);
	}
	function barGraphPrint(data){
		console.log(data)
		var rows= JSON.parse(data);
		var names = []
		var datas = []
		var colors = []
		$.each(rows,function(index,item){
			names[index] = item.regdate;
			datas[index] = item.cnt;
			colors[index] = randomColor(0.7);
		})
		var chartdata = {
			labels : names,
			datasets : [{
				type : 'bar',
				label:'건수',
				backgroundColor:colors,
				data:datas
			}]
		}
		var config = {
			type : 'bar',
			data : chartdata,
			options : {
				responsive : true,
				legend : {display : false},
				title : {
					display : true,
					text : '일자 별 게시판 등록 건수',
					position : 'bottom'
				},
				scales:{
					xAxes:[{
						display : true,
						stacked : true
					}],
					
					yAxes:[{
						display : true,
						stacked : true,
						ticks: {
	                          beginAtZero: true,
	                          userCallback: function(label, index, labels) {
	                              if (Math.floor(label) === label) {
	                                  return label;
	                              }
	                          }
	                      }
					}]
				}
			}
			
		}
		var ctx = document.getElementById("canvas2").getContext("2d");
		new Chart(ctx,config);
	}
</script>
</body>
</html>