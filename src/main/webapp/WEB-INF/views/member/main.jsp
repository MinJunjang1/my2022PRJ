<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<title>시작하기</title>
</head>
<style>
	header {
		position: sticky;
		top: 0;
	}
body{
	background-image: linear-gradient(
			rgba(0, 0, 0, 0.5),
			rgba(0, 0, 0, 0.5)
	), url('/img/apart.jpg');


</style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>

<div class="container align-content-center">
<div class="jumbotron text-center" style="margin-top: 100px;color: #FFFFFF"  />
	<h1 class="text-center">아파트 거래 가격 알아보기</h1>
	<p class="text-center">지도를 통해 아파트의 위치를 파악할 수 있습니다</p>
	<div class="btn-group" style="margin: auto">
		<button style="display: block; margin: auto;" class="btn btn-primary dropdown-toggle" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
			서울의 시·군·구별 아파트 가격 확인하기
		</button>

		<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
			<li >
				<a class="dropdown-item" onclick="aprtapi(11110,202205); setJongnogu(); ">종로구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11140,202205); setJunggu();">중구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11170,202205);setYongsangu();">용산구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11200,202205);setSeongdonggu();">성동구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11215,202205);setGwangjingu();">광진구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11230,202205);setDongdaemungu();">동대문구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11260,202205);setJungnanggu();">중량구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11290,202205);setSeongbukgu(); ">성북구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11305,202205);setGangbukgu();">강북구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11320,202205);setDobonggu(); ">도봉구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11350,202205);setNowongu(); ">노원구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11380,202205);setEunpyeonggu(); ">은평구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11410,202205);setSeodaemungu(); ">서대문구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11440,202205);setMapogu(); ">마포구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11470,202205);setYangcheongu(); ">양천구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11500,202205);setGangseogu(); ">강서구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11530,202205);setGurogu(); ">구로구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11545,202205);setGeumcheongu();">금천구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11560,202205);setYeongdeungpogu(); ">영등포구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11590,202205);setDongjakgu();">동작구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11620,202205);setGwanakgu();">관악구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11650,202205);setSeochogu(); ">서초구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11680,202205);setGangnamgu(); ">강남구</a>
			</li>

			<li >
				<a class="dropdown-item"   onclick="aprtapi(11710,202205);setSongpagu();">송파구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11740,202205);setGangdonggu();">강동구</a>
			</li>

		</ul>
	</div>
</div>
</div>

<div id="map" style="width: 1000pt; height: 400pt; text-align: center; display: block; margin: auto; margin-top: 10px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903&libraries"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px; width: 250px; height: 80px;">대략적인 사용자의 위치 <br/>차이가 있을수 있습니다  </div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
				message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
				iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
</script>
<script src="/js/seoulmap.js"></script>

<script>
	function aprtapi(region_code, ym) {
		location.href= "/map?region_code="+region_code + "&ym=" + ym;
	/*	window.open("/map?region_code=" + region_code + "&ym=" +ym, "결과","width=1000, height=800")*/
	}
</script>


</body>
</html>