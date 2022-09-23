<%@ page import="kopo.poly.dto.apiDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%List<apiDTO> rList = (List<apiDTO>) request.getAttribute("rList"); %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
</head>

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
<jsp:include page="header.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903&libraries=services"></script>
<body>


<script src="/js/seoulmap.js"></script>

<script>
	function aprtapi(region_code, ym) {
		location.href= "/map?region_code="+region_code + "&ym=" + ym;
		/*	window.open("/map?region_code=" + region_code + "&ym=" +ym, "결과","width=1000, height=800")*/
	}
</script>

<div id="map" style="width:100%;height:600px; margin: 5px 5px 5px 5px"></div>
<div class="btn-group" style="display: block; margin: auto;">
	<button style="display: block; margin: auto;" class="btn btn-secondary dropdown-toggle" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
		구별 아파트 가격 확인하기
	</button>
	<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
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


<script>


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
				level: 7 // 지도의 확대 레벨
			};

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var geocoder = new kakao.maps.services.Geocoder();
	var value = new Array();
	var juso = new Array();
	var j = 0;


</script>
<% int i = 0;%>
<div class="divTable" style="max-width: 1000px; text-align: center; margin: auto; ">
	<div class="divTableBody">
		<div class="divTableRow" style="background: #c8e5bc" >
			<div class="divTableHead">법정동</div>
			<div class="divTableHead">지번</div>
			<div class="divTableHead">아파트이름</div>
			<div class="divTableHead">거래가격(만)</div>
		</div>
		<% for (i = 0; i < rList.size(); i++ ) { apiDTO aDTO = rList.get(i); if (aDTO == null) { aDTO = new apiDTO(); } %>
		<div class="divTableRow">
			<div class="divTableHead"><%=CmmUtil.nvl(aDTO.getDong()) %></div>
			<div class="divTableHead"><%=CmmUtil.nvl(aDTO.getJiburn()) %></div>
			<div class="divTableHead"><a href="/roadmap?Dong=<%=aDTO.getDong()%>&Jiburn=<%=aDTO.getJiburn()%>&Name=<%=aDTO.getApartment_Name()%>" target="_blank"><%=CmmUtil.nvl(aDTO.getApartment_Name()) %></a></div>
			<div class="divTableHead"><%=String.valueOf(aDTO.getDeal_Amount()) %></div>
		</div>
		<%}%>
		<script>

			<% for (i = 0; i < rList.size(); i++ ) { apiDTO aDTO = rList.get(i); if (aDTO == null) { aDTO = new apiDTO(); } %>
			juso[<%= i%>] = ["서울 <%=CmmUtil.nvl(aDTO.getDong()) %> <%=CmmUtil.nvl(aDTO.getJiburn()) %> <%=CmmUtil.nvl(aDTO.getApartment_Name()) %>"];
			value[<%=i%>] = ["가격(만) : "  + '<%=String.valueOf(aDTO.getDeal_Amount()) %>'];
			geocoder.addressSearch(	juso[<%= i%>], function(result, status) {

				// 정상적으로 검색이 완료됐으면
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});


					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
						content: '<div style="width:250px;height:80px; display: table-cell;text-align:center;padding:6px 0;margin: auto;vertical-align: middle;">' + juso[<%= i%>] + '</div>'
					});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
				var iwContent = '<div style="padding:5px;width:250px;text-align:center;">'+ value[<%=i%>]+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
					removable : iwRemoveable
				});

// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					// 마커 위에 인포윈도우를 표시합니다
					infowindow.open(map, marker);
				});

			});

			<%}%>

		</script>

	</div>

</div>
</body>

</html>
