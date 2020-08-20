<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/dashboard.jsp  --%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator - Dashboard</title>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	function graph_open(url) {
		var op = "width=800,height=800,scrollbars=yes,left=50,top=150";
		window.open(url+".shop","graph",op);
	}
</script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
//구글 차트 라이브러리 로딩
$(function() {
//google객체는 위쪽 google src안에 들어있음
google.load('visualization','1',{
    'packages' : ['corechart']
});
//로딩이 완료되면 drawChart 함수를 호출
google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
google.setOnLoadCallback(drawChart2); //2nd chart
    function drawChart() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/weeklyrevenue.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.

        	//chart01에서 쓰던 방식 url : "${path}/json/sampleData.json",
            //json에 sampleData.json파일을 불러온다.
            //확장자가 json이면 url 맵핑을 꼭 해주어야 한다. 안해주면 자바파일인줄 알고 404에러가 발생한다.
            //그렇기 때문에 servlet-context파일에서 리소스를 맵핑해준다
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        //var chart = new google.visualization.PieChart(
                //document.getElementByld('chart_div')); //원형 그래프
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div1')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    title : "주간 매출",
                    curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 500,
                    height : 300
                });
    }
    function drawChart2() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/monthlyrevenue.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        //var chart = new google.visualization.PieChart(
                //document.getElementByld('chart_div')); //원형 그래프
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div2')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    title : "최근 4주 매출",
                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 500,
                    height : 300
                });
    }

});
</script>

<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
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
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
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
        
    });
}
 
</script>


<script type="text/javascript">
          /*
          google.charts.load('current', {'packages':['corechart']});
          //google.charts.setOnLoadCallback(numGraph1);
          google.charts.setOnLoadCallback(numGraph2);
			
          
           function numGraph1() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', '정당');
            data.addColumn('number', '의석수');
            data.addRows([
              ['미래한국당', 19],
              ['더불어시민당', 17],
              ['정의당', 5],
              ['국민의당', 3],
              ['열린민주당', 3]
            ]);
            var options = {title:' 21대 국회의원 선거 정당별 비례대표 의석수',
                           width:350,
                           height:300};
            var chart = new google.visualization.PieChart(document.getElementById('numGraph1_div'));
            chart.draw(data, options);
          }

          function numGraph2() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', '정당');
            data.addColumn('number', '의석수');
            data.addRows([
              ['민주당-시민당', 180],
              ['통합당-미래한국', 103],
              ['정의당', 26],
              ['국민의당', 5],
              ['열린민주당', 3],
              ['무소속', 3]
            ]);
            var options = {title:'21대 국회의원 선거 정당별 총 의석수',
                           width:350,
                           height:300};
            var chart = new google.visualization.PieChart(document.getElementById('numGraph2_div'));
            chart.draw(data, options);
          }*/
</script>
</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop" style="color:skyblue;">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="#">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="#">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/notice.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>DashBoard</h3><br>
		
		<!-- 1. 지표 요약 -->
		<div class="outer_frame">
			<div class="quarter_frame skyblue">
				<fmt:formatNumber value="${salesofthismonth}" pattern="#,###" /> 원
				<p class="smaller_size">이번 달 매출</p>
			</div>
			<div class="quarter_frame green">
				<fmt:formatNumber value="${newusers}" pattern="#,###" />명
				<p class="smaller_size">이번달 신규회원</p>
			</div>
			<div class="quarter_frame yellow">
				<fmt:formatNumber value="${numofusers}" pattern="#,###" />명
				<p class="smaller_size">스타일픽 전체 회원</p>
			</div>
			<div class="quarter_frame red">
				<div>
					<span style="font-size: xx-small; font-weight: normal;">누적 매출</span>  <fmt:formatNumber value="${totalrevenue}" pattern="#,###" /> KRW
				</div>
				<div>
					<span style="font-size: xx-small;font-weight: normal;">누적 리뷰</span>   <fmt:formatNumber value="${numofreviews}" pattern="#,###" /> Reviews
				</div>
			</div>
			
		</div>
		<!-- outer_frame -->
		<br><br>
		
		<!-- 1. 매출 요약 -->
		<div class="outer_frame">
			
			<!-- 주간매출 바그래프 -->
			<div class="double_frame">
				주간매출 바,꺾은선그래프
				<!--Table and divs that hold the pie charts-->
			    <!-- <div id="numGraph1_div" style="border: 1px solid #ccc"></div> -->
			    <div id="chart_div1"></div>
			</div>
			
			<!-- 최근 4주간 매출 추이 그래프 -->
			<div class="double_frame">
			최근 4주간 매출 추이 그래프
			<div id="chart_div2"></div>
			<!-- <div id="numGraph2_div" style="border: 1px solid #ccc"></div> -->
			</div>
			<!-- 최근 4주간 매출 추이 그래프의 끝 -->
			<br>
		</div> <!-- outer_frame -->
			<!-- To Do List -->
			<div class="todolist_frame">
				<h3>To Do List</h3>
				
			</div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
		<script>
		$(function() {
			
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

 <!-- 차트 새로고침 버튼 -->
<!--  <button id="btn" type="button" onclick="drawChart()">refresh</button> --> 
