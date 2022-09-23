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
}
	.find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}


</style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>

<body>

<div class="container align-content-center">
<div class="jumbotron text-center" style="margin-top: 100px;color: #FFFFFF"  />
	<h1 class="text-center">아파트 거래 가격 알아보기</h1>
	<p class="text-center">지도를 통해 아파트의 위치를 파악할 수 있습니다</p>
<div class="find-btn">
	<div class="btn-group align-content-center text-center" >
		<button style="display: block;" class="btn btn-primary dropdown-toggle align-content-center find-btn1" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
			서울의 시·군·구별 아파트 가격 확인하기
		</button>

		<ul class="dropdown-menu find-btn1" aria-labelledby="defaultDropdown">
			<li >
				<a class="dropdown-item" onclick="aprtapi(11110,202208); setJongnogu(); ">종로구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11140,202208); setJunggu();">중구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11170,202208);setYongsangu();">용산구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11200,202208);setSeongdonggu();">성동구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11215,202208);setGwangjingu();">광진구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11230,202208);setDongdaemungu();">동대문구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11260,202208);setJungnanggu();">중량구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11290,202208);setSeongbukgu(); ">성북구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11305,202208);setGangbukgu();">강북구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11320,202208);setDobonggu(); ">도봉구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11350,202208);setNowongu(); ">노원구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11380,202208);setEunpyeonggu(); ">은평구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11410,202208);setSeodaemungu(); ">서대문구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11440,202208);setMapogu(); ">마포구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11470,202208);setYangcheongu(); ">양천구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11500,202208);setGangseogu(); ">강서구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11530,202208);setGurogu(); ">구로구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11545,202208);setGeumcheongu();">금천구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11560,202208);setYeongdeungpogu(); ">영등포구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11590,202208);setDongjakgu();">동작구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11620,202208);setGwanakgu();">관악구</a>
			</li>
			<li >
				<a class="dropdown-item" onclick="aprtapi(11650,202208);setSeochogu(); ">서초구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11680,202208);setGangnamgu(); ">강남구</a>
			</li>

			<li >
				<a class="dropdown-item"   onclick="aprtapi(11710,202208);setSongpagu();">송파구</a>
			</li>
			<li >
				<a class="dropdown-item"  onclick="aprtapi(11740,202208);setGangdonggu();">강동구</a>
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
	<div id="map" style="width:100%;height:350px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center: new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
					draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
					level: 4 // 지도의 확대 레벨
				};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


		// 아래 코드는 인포윈도우를 지도에서 제거합니다
		// infowindow.close();
	</script>

</div>
</div>





<script src="/js/seoulmap.js"></script>

<script>
	function aprtapi(region_code, ym) {
		location.href= "/map?region_code="+region_code + "&ym=" + ym;
	/*	window.open("/map?region_code=" + region_code + "&ym=" +ym, "결과","width=1000, height=800")*/
	}
</script>
<script>
	function apiweather(){
		location.href= "/weather2";

	}
</script>


</body>
</html>