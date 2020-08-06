<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store</title>
<style type="text/css">
	*{margin:0px; padding:0px;}
	
	.animation_canvas{
		overflow:hidden;
		position:relative;
		width:1200px;
		height:500px;
		text-align: center
	}
	.slider_panel{
	width:8400px;   
	position:relative;
	}
	
	.slider_image{
	float:left;
	width:1200px;
	height:500px;
	z-index: 1;
	}
	
/*	.slider_text_panel{ 
	position:absolute;
	top:100px;
	left:50px;
	}
	.slider_text{
	position:absolute;
	width:250px;
	height:150px;
	}
	*/
	
	.control_panel{ 
	position:absolute; bottom:10px; left:550px;
	height:13px; overflow:hidden;
	
	}
	
	.control_button{
	width:12px; height:46px; position:relative; float:left;
	cursor:pointer; 
	background:url("http://localhost:8080${path}/item/img/point_button.png");
		z-index: 3;
	}
	.control_button:hover{top:-16px;}
	.control_button.select{top:-31px;}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".control_button").each(function(index){
		$(this).attr("idx",index); //idx=0,.... 각각의 태그에 속성 추가 등록
	}).click(function(){
		var index =$(this).attr("idx"); 
		moveSlider(index);
	})
	$(".slider_text").css("left",-1200).each(function(index){
		$(this).attr("idx",index); //idx 속성 추가
	});
	moveSlider(0); //초기화면은 첫번째 이미지 
	var idx=0; //초기값
	
	var inc=1; //증감값 
	//화면이 로드되자마자 자동으로 2초간격으로 이미지를 움직이게 하기 자동 슬라이딩화면!!!!
	setInterval(function(){  //setInerval 2초간격으로 계속 setTimeout->정해진 시간이 지나면 한번 실행
		if(idx >= 6)inc = -1;
		if(idx <= 0)inc = 1;
		idx += inc;
		moveSlider(idx);
	},3000)
	
})

function moveSlider(index){
	var moveLeft = -(index *1200);
	$(".slider_panel").animate({left:moveLeft},'slow'); //선택된 이미지를 화면에 보여줌.
	$(".control_button[idx="+ index +"]").addClass("select");  //버튼을 누르면 누른 버튼의 index값에 맞춰 사진생성
	$(".control_button[idx!="+ index +"]").removeClass("select");	//버튼을 안 누른 것은 선택한 버튼그림이 사라진다.
	$(".slider_text[idx="+ index +"]").show().animate({	//선택된 텍스트들을 보여준다.
		left:0
	},"slow")
	$(".slider_text[idx!="+index+"]").hide("slow",function(){
		$(this).css("left",-1200);
	})
}
</script>
</head>
<body>
<div class="animation_canvas">	<!-- 이미지 패널 -->
	<div class="slider_panel">
		<img src="../item/img/shoes.jpg" class="slider_image" />
	<img src="${path}/item/img/skirt.jpg" class="slider_image" />
	<img src="${path}/item/img/bag.jpg" class="slider_image" />
	<img src="${path}/item/img/top.jpg" class="slider_image" />
	<img src="${path}/item/img/cap.jpg" class="slider_image" />
	<img src="${path}/item/img/clock.jpg" class="slider_image" />
	<img src="${path}/item/img/jean.png" class="slider_image" />


	</div>
	
	<!-- <div class="slider_text_panel">	<!--텍스트 패널
		<div class="slider_text"><h1>사막이미지</h1><p>더운 사막</p></div>
		<div class="slider_text"><h1>수국이미지</h1><p>수국화</p></div>
		<div class="slider_text"><h1>해파리이미지</h1><p>해파리무침</p></div>
		<div class="slider_text"><h1>코알라이미지</h1><p>알라알라코알라</p></div>
		<div class="slider_text"><h1>등대이미지</h1><p>등대</p></div>
	</div> -->
	
	<div class="control_panel"> <!-- 컨트롤 패널 -->
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
	</div>
</div>
</body>
</html>