<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<jsp:include page="header.jsp" flush="false"></jsp:include>

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

	//주소검색
	var geocoder = new kakao.maps.services.Geocoder();

</script>
<script type="text/javascript" src="https://github.com/MinJunjang1/my2022PRJ/blob/0923910e6333816eccc36a3be06d93b73397d24b/src/main/webapp/WEB-INF/views/js/seoulmap.js"></script>
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
		<li><a class="dropdown-item" onclick="setJunggu(); seoul2();" >중구</a></li>
		<li><a class="dropdown-item" onclick="setYongsangu(); seoul3();">용산구</a></li>
		<li><a class="dropdown-item" onclick="setSeongdonggu(); seoul4();">성동구</a></li>
		<li><a class="dropdown-item" onclick="setGwangjingu(); seoul5();">광진구</a></li>
		<li><a class="dropdown-item" onclick="setDongdaemungu(); seoul6();">동대문구</a></li>
		<li><a class="dropdown-item" onclick="setJungnanggu(); seoul7();">중랑구</a></li>
		<li><a class="dropdown-item" onclick="setSeongbukgu(); seoul8();">성북구</a></li>
		<li><a class="dropdown-item" onclick="setGangbukgu(); seoul9();">강북구</a></li>
		<li><a class="dropdown-item" onclick="setDobonggu(); seoul10();">도봉구</a></li>
		<li><a class="dropdown-item" onclick="setNowongu(); seoul11();">노원구</a></li>
		<li><a class="dropdown-item" onclick="setEunpyeonggu(); seoul12();">은평구</a></li>
		<li><a class="dropdown-item" onclick="setSeodaemungu(); seoul13();">서대문구</a></li>
		<li><a class="dropdown-item" onclick="setMapogu(); seoul14();">마포구</a></li>
		<li><a class="dropdown-item" onclick="setYangcheongu(); seoul15();">양천구</a></li>
		<li><a class="dropdown-item" onclick="setGangseogu(); seoul16();">강서구</a></li>
		<li><a class="dropdown-item" onclick="setGurogu(); seoul17();">구로구</a></li>
		<li><a class="dropdown-item" onclick="setGeumcheongu(); seoul18();">금천구</a></li>
		<li><a class="dropdown-item" onclick="setYeongdeungpogu(); seoul19();">영등포구</a></li>
		<li><a class="dropdown-item" onclick="setDongjakgu(); seoul20();">동작구</a></li>
		<li><a class="dropdown-item" onclick="setGwanakgu(); seoul21();">관악구</a></li>
		<li><a class="dropdown-item" onclick="setSeochogu(); seoul22();">서초구</a></li>
		<li><a class="dropdown-item" onclick="setGangnamgu(); seoul23();">강남구</a></li>
		<li><a class="dropdown-item" onclick="setSongpagu(); seoul24();">송파구</a></li>
		<li><a class="dropdown-item" onclick="setGangdonggu(); seoul25();">강동구</a></li>
	</ul>
</div>
<div class="btn-group">
	<!-- 추가 버튼태그 -->
	<button class="btn btn-primary" type="button" onclick="setSeoul()">
		부산
	</button>
	<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
		<span class="caret"></span>
	</button>
	<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
	<ul class="dropdown-menu" >
		<li><a class="dropdown-item" onclick="">중구</a></li>
		<li><a class="dropdown-item" onclick="">서구</a></li>
		<li><a class="dropdown-item" onclick="">동구</a></li>
		<li><a class="dropdown-item" onclick="">영도구</a></li>
		<li><a class="dropdown-item" onclick="">부산진구</a></li>
		<li><a class="dropdown-item" onclick="">동래구</a></li>
		<li><a class="dropdown-item" onclick="">남구</a></li>
		<li><a class="dropdown-item" onclick="">북구</a></li>
		<li><a class="dropdown-item" onclick="">해운대구</a></li>
		<li><a class="dropdown-item" onclick="">사하구</a></li>
		<li><a class="dropdown-item" onclick="">금정구</a></li>
		<li><a class="dropdown-item" onclick="">강서구</a></li>
		<li><a class="dropdown-item" onclick="">연제구</a></li>
		<li><a class="dropdown-item" onclick="">수영구</a></li>
		<li><a class="dropdown-item" onclick="">사상구</a></li>
		<li><a class="dropdown-item" onclick="">기장구</a></li>
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