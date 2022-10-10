<%@ page import="kopo.poly.dto.api2DTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.api2DTO" %>
<%@ page import="kopo.poly.dto.apiDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Bootstrap CSS -->
	<title></title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<style>
	.area {
		position: absolute;
		background: #fff;
		border: 1px solid #888;
		border-radius: 3px;
		font-size: 12px;
		top: -5px;
		left: 15px;
		padding:2px;
	}

	.info {
		font-size: 12px;
		padding: 5px;
	}
	.info .title {
		font-weight: bold;
	}


	.btn, .btn-two {
		margin: 9px;
	}
	.btn-gradient {
		margin: 5px;
	}

	button[class*="btn"] {border: 0;}


	.btn.small,
	.btn-two.small,
	.btn-gradient.small,
	.btn-effect.small {
		padding: 8px 18px;
		font-size: 14px;
	}

	/* default button style */
	.btn {
		position: relative;
		border: 0;
		padding: 15px 25px;
		display: inline-block;
		text-align: center;
		color: white;
	}
	.btn:active {
		top: 4px;
	}

	/* color classes for .btn */
	.btn.blue {box-shadow: 0px 4px #74a3b0;}
	.btn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}



	/* Gradient buttons */
	.btn-gradient {
		text-decoration: none;
		color: white;
		padding: 10px 30px;
		display: inline-block;
		position: relative;
		border: 1px solid rgba(0,0,0,0.21);
		border-bottom: 4px solid rgba(0,0,0,0.21);
		border-radius: 4px;
		text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	}




	.btn-gradient.blue {
		background: rgba(102,152,203,1);
		background: -moz-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
		background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102,152,203,1)), color-stop(100%, rgba(92,138,184,1)));
		background: -webkit-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
		background: -o-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
		background: -ms-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
		background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0 );
	}


	.btn-gradient.blue:active   {background: #608FBF;}


</style>
<style>

	/*
	body{
		background-image: linear-gradient(
				rgba(0, 0, 0, 0.5),
				rgba(0, 0, 0, 0.5)
		),url('/img/apart.jpg');
	}

	*/


	.color .blue   {background: #6698cb;}
	.btn-gradient {
		margin: 5px;
	}
	.btn.small,
	.btn-two.small,
	.btn-gradient.small,
	.btn-effect.small {
		padding: 8px 18px;
		font-size: 14px;
	}
	.btn.blue, .btn-two.blue     {background-color: #7fb1bf;}


	.newsbox{
		margin: 0px 10px 0px 10px;
		background-color: #fffff0;
	}
	header {
		position: sticky;
		top: 0;
	}

	.find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}
	.outer {
		text-align: center;
	}

	.inner {
		display: inline-block;
	}
	.box1{
		display: inline-block;
	}
	.box2{
		display: inline-block;

	}.scrollable-menu {
		 height: auto;
		 max-height: 200px;
		 overflow-x: hidden;
	 }
	.container-list{
		box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
		background-color: #FFFFFF;
	}
</style>
<script type="text/javascript" src="/js/mapcontrol.js"></script>

<jsp:include page="../header.jsp" flush="false"></jsp:include>
<script>

	function newsTitle(){
		$.ajax({
			url : "/main/newsTitle",
			method : "get",
			dataType : 'JSON',
			success: function (json){
				$("#news").append("<h1>부동산 칼럼</h1>");
				$.each(json, function (index, item){
					let title = item.newstitle;
					let date = item.newdate;
					let newshref = item.href;
					$("#news").append("<hr/>");
					$("#news").append("<input type='hidden' id='newshref"+ index +"' value='"+ newshref +"'>");
					$("#news").append("<b><a onclick='newspage(" +index+")'>" + title + "</a></b><br/>");
					$("#news").append("<hr/>");
				})
			}

		})
	}
	function newspage(index){
		let href = document.getElementById("newshref" + index).value;
		console.log(href)
		$.ajax({
			url : "/main/newspage",
			method : "get",
			dataType : 'JSON',
			data: {
				"href" : href
			},
			success: function (json){
				$.each(json, function (index, item){
					let title = item.title;
					let summary = item.summary;
					let imgsrc = item.imgsrc;
					let content = item.content;
					console.log(title);
					console.log(summary);
					console.log(imgsrc);
					console.log(content);


					$("#news").empty()
					$("#news").append("<div class='newsbox' >");
					$("#news").append("<b>"+title+"</b><br/><hr/>");
					$("#news").append("<div>"+summary+"</div><br/>");
					$("#news").append("<img src='"+imgsrc+"'>");
					$("#news").append("<br/>");
					$("#news").append("<br/>");
					$("#news").append("<br/>");
					$("#news").append("<br/>");
					$("#news").append("<div>"+content+"</div></br>");
					$("#news").append("<br/>");
					$("#news").append("<button class='btn-gradient blue small' onclick='gotitle();'>목록으로</button>");
					$("#news").append("<div>");
					$("#news").append("<br/>");


				})
			}

		})
	}
	function gotitle(){
		$("#news").empty();
		newsTitle();
	}




</script>

<body onload="newsTitle(); ">

<div style="height: 50px"></div>
<div class="container container-list" style="margin: auto; width: 1000px;" >
	<div style="height: 50px"></div>
	<h1 class="text-center" style="color: #FFFFFF">Seoul</h1>
	<h1 class="text-center" style="color: #FFFFFF">Apartment</h1>
	<h1 class="text-center" style="color: #FFFFFF">Transaction</h1>
	<h1 class="text-center" style="color: #FFFFFF">Amount</h1>
	<h1 class="text-center" style="color: #FFFFFF">S.A.T.A.</h1>

	<p class="text-center" style="color: #FFFFFF">서울 아파트 거래 금액을 알아보는 사이트입니다</p>
	<div style="height: 50px"></div>
</div>



<div class="container align-content-center" style="color: #FFFFFF; " >
	<div class="jumbotron text-center" style="margin-top: 100px;color: #0f0f0f"  />
	<h1 class="text-center" style="color: #FFFFFF">아파트 거래 가격 알아보기</h1>
	<p class="text-center" style="color: #FFFFFF">지도를 통해 아파트의 위치를 파악할 수 있습니다</p>





	<div class="find-btn">
		<div class="btn-group align-content-center text-center" >
			<button style="display: block;" class="btn btn-primary dropdown-toggle align-content-center find-btn1" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
				서울의 시·군·구별 아파트 가격 확인하기
			</button>

			<ul class="dropdown-menu find-btn1 scrollable-menu" style="" aria-labelledby="defaultDropdown">
				<li >
					<a class="dropdown-item" onclick="aprtapi(11110,202209); setJongnogu(); ">종로구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11140,202209); setJunggu();">중구</a>
				</li>
				<li >
					<a class="dropdown-item" onclick="aprtapi(11170,202209);setYongsangu();">용산구</a>
				</li>
				<li >
					<a class="dropdown-item" onclick="aprtapi(11200,202209);setSeongdonggu();">성동구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11215,202209);setGwangjingu();">광진구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11230,202209);setDongdaemungu();">동대문구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11260,202209);setJungnanggu();">중량구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11290,202209);setSeongbukgu(); ">성북구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11305,202209);setGangbukgu();">강북구</a>
				</li>
				<li >
					<a class="dropdown-item" onclick="aprtapi(11320,202209);setDobonggu(); ">도봉구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11350,202209);setNowongu(); ">노원구</a>
				</li>
				<li >
					<a class="dropdown-item" onclick="aprtapi(11380,202209);setEunpyeonggu(); ">은평구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11410,202209);setSeodaemungu(); ">서대문구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11440,202209);setMapogu(); ">마포구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11470,202209);setYangcheongu(); ">양천구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11500,202209);setGangseogu(); ">강서구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11530,202209);setGurogu(); ">구로구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11545,202209);setGeumcheongu();">금천구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11560,202209);setYeongdeungpogu(); ">영등포구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11590,202209);setDongjakgu();">동작구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11620,202209);setGwanakgu();">관악구</a>
				</li>
				<li >
					<a class="dropdown-item" onclick="aprtapi(11650,202209);setSeochogu(); ">서초구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11680,202209);setGangnamgu(); ">강남구</a>
				</li>

				<li >
					<a class="dropdown-item"   onclick="aprtapi(11710,202209);setSongpagu();">송파구</a>
				</li>
				<li >
					<a class="dropdown-item"  onclick="aprtapi(11740,202209);setGangdonggu();">강동구</a>
				</li>

			</ul>
		</div>


		<button type="button" class="btn btn-primary navbar-btn find-btn1" onclick="apiweather()">날씨확인
		</button>
	</div>
</div>

</div>
<div style="height: 50px;">

</div>
<div style="text-align: center; height: 450px;" >
	<div class="box1" id="news" style="overflow:scroll; overflow-x: hidden; width:55%;height:450px; padding-left: 15px; padding-right: 15px; padding-top: 15px; text-align: justify-all; background-color: #FFFFF0;">
	</div>
	<div class="box2" id="map" style="width:40%;height:450px;  margin: 0 auto;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center: new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
					// 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
					level: 9 // 지도의 확대 레벨
				};

		var map = new kakao.maps.Map(mapContainer, mapOption), // 지도를 생성합니다
				customOverlay = new kakao.maps.CustomOverlay({}),
				infowindow = new kakao.maps.InfoWindow({removable: true});

		Initializtion(map);
		DrawPolygon();
		map.setDraggable(false);
		map.setZoomable(false);

	</script>


</div>
</div>




<script src="/js/seoulmap.js"></script>

<script>

	function aprtapi(region_code, ym) {
		location.href= "/map?region_code="+region_code + "&ym=" + "202209";
		/*	window.open("/map?region_code=" + region_code + "&ym=" +ym, "결과","width=1000, height=800")*/
	}
</script>
<script>
	function apiweather(){
		location.href= "/weather2";

	}
</script>
</div>


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>