<%@ page import="kopo.poly.dto.api2DTO" %>
<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.api2DTO" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%List<api2DTO> a2List = (List<api2DTO>) request.getAttribute("a2List"); %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
</head>
<script src="/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>조회결과</title>

<!-- 제일 좋은 defer 옵션 사용할것 / html파싱과  스크립트 다운로드를 비동기로 효율적으로 처리 함-->
<!-- <script defer src="js/main.js"></script>  -->
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

	/* DivTable.com */
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
<body>

<jsp:include page="member/main.jsp" flush="false"></jsp:include>

<div style="height: 50px;">

</div>

<% int i = 0;%>
<div class="divTable" style="max-width:600px; text-align: center; margin: auto; ">
	<div class="divTableBody">
			<% for (i = 0; i < a2List.size(); i++ ) { api2DTO api2DTO = a2List.get(i); if (api2DTO == null) { api2DTO = new api2DTO(); } %>
		<div class="divTableRow" style="background: #c8e5bc" >
			<div class="divTableHead">날씨 : <%=CmmUtil.nvl(api2DTO.getWf()) %></div>

		</div>

		<div class="divTableRow" style="background: #FFFFFF">
			<div class="divTableHead">
				<label>현재기온 : </label>
				<span id = "currentTemp"></span>
				<label>℃</label>
			</div>
		</div>
		<%}%>
		<script>

			$(document).ready(function (){
				let lon, lat;

				navigator.geolocation.getCurrentPosition(function (position){
					lat = position.coords.latitude;
					lon = position.coords.longitude;

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
				});
			})
		</script>



</body>

</html>
