<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/widgets.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>Administrator - Charts</title>
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
//google.setOnLoadCallback(drawChart1); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
google.setOnLoadCallback(drawChart2);
google.setOnLoadCallback(drawChart3);
//google.setOnLoadCallback(drawChart4);
google.setOnLoadCallback(drawChart5);

	/*
	function drawChart1() {
	    var jsonData = $.ajax({
	    	url : "${path}/ajax/numofusers.shop",
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
	                title : "일반회원 스토어회원 추이",
	                //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
	                width : 1200,
	                height : 500
	            });
	}*/

	//charts index 2 Weekly : 일자별 매출 현황 0818
    function drawChart2() {
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
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div2')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    title : "주간 매출(최근 7일)",
                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 1200,
                    height : 500
                });
    }
	//charts index 3 Yearly : 연 매출 현황 0818
    function drawChart3() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/yearlyrevenue.shop",
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
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div3')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    title : "연 매출(1년)",
                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 1200,
                    height : 500
                });
    }
    //charts index 4 지역별 매출 평균 >later drawChart4
    
    //charts index 5 구매건 기준 매출 산점도
    function drawChart5() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/scatterplot.shop",
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
        
        //var chart = new google.visualization.PieChart(document.getElementByld('chart_div')); //원형 그래프
        var chart = new google.visualization.ScatterChart(document.getElementById('chart_div5')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div5')); //선 그래프
        //var chart = new google.visualization.ColumnChart(document.getElementById('chart_div')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    title : "가입일자 대비 구매금액 scatter plot",
                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 1200,
                    height : 500,
                    hAxis: {title: '가입연월', minValue: 0}, // maxValue: 15
                    vAxis: {title: '구매 금액', minValue: 0},
                    legend: 'none'
                });
    }

});
</script>


</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop" style="color:skyblue;">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="#">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="#">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/notice.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>Charts</h3><br>
		
		<h4 style="text-align: center; margin-bottom: 50px;">Stylepick Sales Report</h4>
		<br>
		
		<h5 style="font-weight: bold; font-size: large; margin-bottom: 30px;">1. 회원 및 매출 현황</h5>
		<div>
			<div id="mint_square"></div> 회원현황
			<br>
			<div id="chart_div1"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> Weekly : 일자별 매출 현황
			<br>
			<div id="chart_div2"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> Yearly : 연 매출 현황
			<br>
			<div id="chart_div3"></div>
		</div>
		<br>
		
		<h5 style="font-weight: bold; font-size: large; margin: 30px 0 30px 0;">2. 매출 구분 상세</h5>
		<div>
			<div id="mint_square"></div> 지역별 매출 평균
			<br>
			<div id="chart_div4"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> 구매건 기준 매출 산점도
			<br>
			<div id="chart_div5"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> 카테고리 별 판매 현황(월)
			<br>
			<div id="chart_div6"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> 스토어 매출 점유율
			<br>
			<div id="chart_div7"></div>
		</div>
		<br>
		
	</div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>