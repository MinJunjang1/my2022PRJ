<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<style>
	header {
		position: sticky;
		top: 0;
	}
</style>
<!--헤더-->
<jsp:include page="header.jsp" flush="true"></jsp:include>

<body>
<!--지도-->
<div id="map" style="width:100%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(37.541, 126.986), // 지도의 중심좌표
				level: 15 // 지도의 확대 레벨
			};
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

/*	//주소검색
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

		// 정상적으로 검색이 완료됐으면
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}*/
	}
</script>

<script type="text/javascript" src="https://github.com/MinJunjang1/my2022PRJ/blob/7adfa4c9dc7a20b427ada2a2ad3e15a328089c3a/src/main/webapp/WEB-INF/views/js/seouljs.js"></script>
<!--시도=지도이동 구=지도이동, 건물표시 시도16개 구 108?개 -->
<div class="btn-group">
	<!-- 추가 버튼태그 -->
	<button class="btn btn-primary" type="button" onclick="setSeoul()">
		서울
	</button>
	<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
		<span class="caret"></span>
	</button>
	<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
	<ul class="dropdown-menu" >
		<li><a class="dropdown-item" onclick="setJongnogu(); seoul1();">종로구</a></li>
		<li><a class="dropdown-item" onclick="setJunggu();">중구</a></li>
		<li><a class="dropdown-item" href="#">용산구</a></li>
		<li><a class="dropdown-item" href="#">성동구</a></li>
		<li><a class="dropdown-item" href="#">광진구</a></li>
		<li><a class="dropdown-item" href="#">동대문구</a></li>
		<li><a class="dropdown-item" href="#">중랑구</a></li>
		<li><a class="dropdown-item" href="#">성북구</a></li>
		<li><a class="dropdown-item" href="#">강북구</a></li>
		<li><a class="dropdown-item" href="#">도봉구</a></li>
		<li><a class="dropdown-item" href="#">노원구</a></li>
		<li><a class="dropdown-item" href="#">은평구</a></li>
		<li><a class="dropdown-item" href="#">서대문구</a></li>
		<li><a class="dropdown-item" href="#">마포구</a></li>
		<li><a class="dropdown-item" href="#">양천구</a></li>
		<li><a class="dropdown-item" href="#">강서구</a></li>
		<li><a class="dropdown-item" href="#">구로구</a></li>
		<li><a class="dropdown-item" href="#">금천구</a></li>
		<li><a class="dropdown-item" href="#">영등포구</a></li>
		<li><a class="dropdown-item" href="#">동작구</a></li>
		<li><a class="dropdown-item" href="#">관악구</a></li>
		<li><a class="dropdown-item" href="#">서초구</a></li>
		<li><a class="dropdown-item" href="#">강남구</a></li>
		<li><a class="dropdown-item" href="#">송파구</a></li>
		<li><a class="dropdown-item" href="#">강동구</a></li>
	</ul>
</div>

<button class="btn btn-lg btn-warning" onclick="seoul1()">서울</button>
<button class="btn btn-lg btn-warning" onclick="api7()">부산</button>
<button class="btn btn-lg btn-warning" onclick="api8()">대구</button>
<button class="btn btn-lg btn-warning" onclick="api9()">인천</button>
<button class="btn btn-lg btn-warning" onclick="api10()">광주</button>
<button class="btn btn-lg btn-warning" onclick="api11()">대전</button>
<button class="btn btn-lg btn-warning" onclick="api12()">울산</button>
<button class="btn btn-lg btn-warning" onclick="api13()">경기</button>
<button class="btn btn-lg btn-warning" onclick="api14()">강원</button>
<button class="btn btn-lg btn-warning" onclick="api15()">충북</button>
<button class="btn btn-lg btn-warning" onclick="api16()">충남</button>
<button class="btn btn-lg btn-warning" onclick="api17()">전북</button>
<button class="btn btn-lg btn-warning" onclick="api18()">전남</button>
<button class="btn btn-lg btn-warning" onclick="api19()">경북</button>
<button class="btn btn-lg btn-warning" onclick="api20()">경남</button>
<button class="btn btn-lg btn-warning" onclick="api21()">제주</button>




</body>
</html>