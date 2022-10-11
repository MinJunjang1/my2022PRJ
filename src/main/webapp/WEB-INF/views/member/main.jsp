<%@ page import="kopo.poly.dto.api2DTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.api2DTO" %>
<%@ page import="kopo.poly.dto.apiDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%List<api2DTO> a2List = (List<api2DTO>) request.getAttribute("a2List"); %>

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
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
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


	body{
		background-image: linear-gradient(
				rgba(0, 0, 0, 0.5),
				rgba(0, 0, 0, 0.5)
		),url('/img/apart.jpg');
		background-size: cover;
		background-repeat: no-repeat;
	}





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
	.divTable{
		display: table;
		width: 100%;
	}
	.divTableRow {
		display: table-row;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
	}
	.divTableCell, .divTableHead {
		border: 1px solid #999999;
		display: table-cell;
		padding: 3px 10px;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #EEE;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
	}
</style>
<script type="text/javascript" src="/js/mapcontrol.js"></script>

<jsp:include page="../header.jsp" flush="false"></jsp:include>
<script>
	function weather2(){
		let lon, lat;



		lat = 37.541;
		lon = 126.986;

		$.ajax({
			url: "/weather/getWeather",
			type : "get",
			dataType : "JSON",
			data : {
				"lon" : lon,
				"lat" : lat
			},
			success: function (json){

				$("#currentTemp").append(json.currentTemp);

				const dailyList = json.dailyList;


				/*let day = daily.day;
                let sunrise = daily.sunrise;
                let sunset = daily.sunset;
                let moonrise = daily.moonrise;
                let moonset = daily.moonset;
                let dayTemp = daily.dayTemp;
                let dayTempMax = daily.dayTempMax;
                let dayTempMin = daily.dayTempMin;

                $("#daily_weather").append("<div><b>"+ day + "의 날씨</b></div>");
                $("#daily_weather").append("<div>");
                $("#daily_weather").append("<span>해뜨는 시간 : " + sunrise + " </span>");
                $("#daily_weather").append("<span>해지는 시간 : " + sunset + " </span>");
                $("#daily_weather").append("<span>달뜨는 시간 : "+ moonrise + " </span>");
                $("#daily_weather").append("<span>달지는 시간 : " + moonset + " </span>");
                $("#daily_weather").append("<span>평균기온 : " + dayTemp + " </span>");
                $("#daily_weather").append("<span>최대기온 : " + dayTempMax + " </span>");
                $("#daily_weather").append("<span>최저기온 : " + dayTempMin + " </span>");
                $("#daily_weather").append("</div>");
                $("#daily_weather").append("<br/><br/>");
    */
			}
		});
	}
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
			/*		console.log(title);
					console.log(summary);
					console.log(imgsrc);
					console.log(content);
*/

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

<body onload="newsTitle(); weather2();">

<div style="height: 50px"></div>
<div class="container container-list" style="margin: auto; width: 1200px;" >
	<div style="height: 50px"></div>
	<h1 class="text-center" style="color: #000000">Seoul</h1>
	<h1 class="text-center" style="color: #000000">Apartment</h1>
	<h1 class="text-center" style="color: #000000">Transaction</h1>
	<h1 class="text-center" style="color: #000000">Amount</h1>
	<h1 class="text-center" style="color: #000000">S.A.T.A.</h1>

	<p class="text-center" style="color: #000000">서울 아파트 거래 금액을 알아보는 사이트입니다</p>
	<div style="height: 50px"></div>


	<% int i = 0;%>
	<div class="divTable" style="max-width:600px; text-align: center; margin: auto; ">
		<div class="divTableBody">
			<% for (i = 0; i < a2List.size(); i++ ) { api2DTO api2DTO = a2List.get(i); if (api2DTO == null) { api2DTO = new api2DTO(); } %>
			<div class="divTableRow" style="background: #c8e5bc; width: 100%" >
				<div class="divTableHead">날씨 : <%=CmmUtil.nvl(api2DTO.getWf()) %> /
					<label>현재기온 : </label>
					<span id = "currentTemp"></span>
					<label>℃</label>
				</div>
			</div>
			<%}%>
		</div>
	</div>
	<div style="height: 50px"></div>
	<div><p>지도의 구역을 클릭하시면 이동됩니다.</p></div>
	<div class="box2" id="map" style="width:100%;height:500px;  margin: 0 auto;">
	</div>
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
	<div style="height: 50px;"></div>
	<div class="box1" id="news" style=" overflow:scroll; overflow-x: hidden; width:100%;height:800px; padding-left: 15px; padding-right: 15px; padding-top: 15px; text-align: justify-all; background-color: #FFFFF0; border: solid black;">
	</div>
	<div style="height: 100px;"></div>
</div>
</div>
<div style="height: 50px;"></div>
<script src="/js/seoulmap.js"></script>

<script>

	function aprtapi(region_code, ym) {
		location.href= "/map?region_code="+region_code + "&ym=" + "202209";
		/*	window.open("/map?region_code=" + region_code + "&ym=" +ym, "결과","width=1000, height=800")*/
	}
</script>

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