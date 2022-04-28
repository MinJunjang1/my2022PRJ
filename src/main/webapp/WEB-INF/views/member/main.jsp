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
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<a class="navbar-brand" href="#">메인페이지</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="#">Board <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Q&A</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-md-0">
				<input class="form-control" type="text" placeholder="Search">
			</form>
		</div>
	</nav>
</head>

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
	//서울
	function setSeoul() {
		// 이동할 위도 경도 위치를 생성합니다
		var moveLatLon = new kakao.maps.LatLng(37.561, 126.986);
		map.setCenter(moveLatLon);
		var level = map.getLevel();
		// 지도를 1레벨 내립니다 (지도가 확대됩니다)
		map.setLevel(7);
		// 지도 레벨을 표시합니다
		displayLevel();
		// 지도 중심을 이동 시킵니다
	}
	//종로구
	function setJongnogu() {
		// 이동할 위도 경도 위치를 생성합니다
		var moveLatLon = new kakao.maps.LatLng(37.5703, 126.9816);
		map.setCenter(moveLatLon);
		var level = map.getLevel();
		// 지도를 1레벨 내립니다 (지도가 확대됩니다)
		map.setLevel(5);
		// 지도 레벨을 표시합니다
		displayLevel();
		// 지도 중심을 이동 시킵니다
	}
	//중구
	function setJunggu() {
		// 이동할 위도 경도 위치를 생성합니다
		var moveLatLon = new kakao.maps.LatLng(37.5700, 126.979);
		map.setCenter(moveLatLon);
		var level = map.getLevel();
		// 지도를 1레벨 내립니다 (지도가 확대됩니다)
		map.setLevel(5);
		// 지도 레벨을 표시합니다
		displayLevel();
		// 지도 중심을 이동 시킵니다
	}

</script>

<script type="text/javascript" id="api">
	<!--종로구-->
function seoul1(){
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var dateString = year  + month  ;


	queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11110'); /**/
	queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
		if (this.readyState == 4) {
			alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		}
	};

	xhr.send('');
}
	<!--중구-->
	function seoul2(){
		var xhr = new XMLHttpRequest();
		var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var dateString = year  + month  ;


		queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11140'); /**/
		queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
			if (this.readyState == 4) {
				alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
			}
		};

		xhr.send('');
	}


</script>
<!--시도=지도이동 구=지도이동, 건물표시 시도16개 구 108?개 -->
<div class="btn-group">
	<!-- 추가 버튼태그 -->
	<button class="btn btn-primary" type="button" onclick="setSeoul()">
		서울
	</button>
	<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
		<!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
            (없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
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



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>