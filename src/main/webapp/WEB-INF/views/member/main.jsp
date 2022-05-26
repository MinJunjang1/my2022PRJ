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
<jsp:include page="../header.jsp" flush="false"></jsp:include>

<body>
<!--지도-->


<script type="text/javascript">
//api
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;
</script>
<script type="text/javascript">
    // 위도 경도
    var num1 = 37.541;
    var num2 = 126.986;
</script>
<!--map-->
<script type="text/javascript" src="https://github.com/MinJunjang1/my2022PRJ/blob/0923910e6333816eccc36a3be06d93b73397d24b/src/main/webapp/WEB-INF/views/js/seoulmap.js"></script>
<script type="text/javascript" src="https://github.com/MinJunjang1/my2022prj/blob/2834b94b0fff0dceb3e2dbb6f7ff77a42f8f8c7c/src/main/webapp/WEB-INF/views/js/busanmap.js"></script>
<script type="text/javascript">
	// 이동할 위도 경도 위치를 생성합니다
	var moveLatLon = new kakao.maps.LatLng(num1, num2);
	map.setCenter(moveLatLon);
	var level = map.getLevel();
	// 지도를 1레벨 내립니다 (지도가 확대됩니다)
	map.setLevel(15);
	// 지도 레벨을 표시합니다
	displayLevel();
</script>

<style>
	*{
		margin: 0;
		padding:0;
	}
	a{
		text-decoration: none;
	}
	ul{
		list-style: none;
	}
	/* 화면 전체 렙 */
	.wrapper{
		width: 100%;
	}
	/* content 랩 */
	.wrap{
		width : 1080px;
		margin: auto;
	}
	/* 홈페이지 기능 네비 */
	.top_gnb_area{
		width: 100%;
		height: 50px;
		background-color: #f0f0f1;
		position:relative;
	}
	.top_gnb_area .list{
		position: absolute;
		top: 0px;
		right: 0;

	}
	.top_gnb_area .list li{
		list-style: none;
		float : left;
		padding: 13px 15px 0 10px;
		font-weight: 900;
		cursor: pointer;
	}

	/* 관리제 페이지 상단 현페이지 정보 */
	.admin_top_wrap{
		height:110px;
		line-height: 110px;
		background-color: #5080bd;
		margin-bottom:15px;
	}
	.admin_top_wrap>span{
		margin-left: 30px;
		display:inline-block;
		color: white;
		font-size: 50px;
		font-weight: bolder;
	}
	/* 관리자 wrap(네비+컨텐츠) */
	.admin_wrap{


	}

	/* 관리자페이지 네비 영역 */
	.admin_navi_wrap{
		width: 20%;
		height: 300px;
		float:left;
		height: 100%;
	}
	.admin_navi_wrap li{
		display: block;
		height: 80px;
		line-height: 80px;
		text-align: center;
	}
	.admin_navi_wrap li a{
		display: block;
		height: 100%;
		width: 95%;
		margin: 0 auto;
		cursor: pointer;
		font-size: 30px;
		font-weight: bolder;
	}
	.admin_navi_wrap li a:link {color: black;}
	.admin_navi_wrap li a:visited {color: black;}
	.admin_navi_wrap li a:active {color: black;}
	.admin_navi_wrap li a:hover {color: black;}

	.admin_list_01{
		background-color: #c8c8c8;
	}


	/* 관리자페이지 컨텐츠 영역 */
	.admin_content_wrap{
		width: 80%;
		float:left;
		height: 100%;
		height: 700px;

	}
	.admin_content_subject{            /* 관리자 컨텐츠 제목 영역 */
		font-size: 40px;
		font-weight: bolder;
		padding-left: 15px;
		background-color: #6AAFE6;
		height: 80px;
		line-height: 80px;
		color: white;
	}

	/* footer navai 영역 */
	.footer_nav{
		width:100%;
		height:50px;
	}
	.footer_nav_container{
		width: 100%;
		height: 100%;
		background-color:#8EC0E4;
	}
	.footer_nav_container>ul{
		font-weight : bold;
		float:left;
		list-style:none;
		position:relative;
		padding-top:10px;
		line-height: 27px;
		font-family: dotum;
		margin-left: 10px;
	}
	.footer_nav_container>ul>li{
		display:inline;
		width: 45px;
		height: 19px;
		padding: 10px 9px 0 10px;
	}
	.footer_nav_container>ul>span{
		margin: 0 4px;
	}
	/* footer 영역 */
	.footer{
		width:100%;
		height:130px;
		background-color:#D4DFE6;
		padding-bottom : 50px;
	}
	.footer_container{
		width: 100%;
		height: 100%;
		margin: auto;
	}
	.footer_left>img {
		width: 150%;
		height: 130px;
		margin-left: -20px;
		margin-top: -12px;
	}
	.footer_left{
		float :left;
		width: 170px;
		margin-left: 20px;
		margin-top : 30px;

	}
	.footer_right{
		float :left;
		width: 680px;
		margin-left: 70px;
		margin-top : 30px;
	}




	/* float 속성 해제 */
	.clearfix{
		clear: both;
	}

</style>


<div class="wrapper">
	<div class="wrap">
		<!-- gnv_area -->
		<!-- top_subject_area -->
		<!-- contents-area -->
		<div class="admin_wrap">
			<!-- 네비영역 -->
			<div class="admin_navi_wrap">
				<ul>
					<li >
						<a class="admin_list_01" href="/admin/goodsEnroll">서울</a>
					</li>
					<li>
						<a class="admin_list_02" href="/admin/goodsManage">부산</a>
					</li>
					<lI>
						<a class="admin_list_03" href="/admin/authorEnroll">인천</a>
					</lI>
					<lI>
						<a class="admin_list_04" href="/admin/authorEnroll">대전</a>
					</lI>
					<lI>
						<a class="admin_list_05" href="/admin/authorEnroll">대구</a>
					</lI>
					<lI>
						<a class="admin_list_06" href="/admin/authorEnroll">광주</a>
					</lI>
					<lI>
						<a class="admin_list_07" href="/admin/authorEnroll">울산</a>
					</lI>

				</ul>
			</div>
			<div class="admin_content_wrap">
				<div class="admin_content_subject"><span>메인화면</span></div>
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
			</div>
			<div class="clearfix">

			</div>
		</div>
	</div>
</div>


</script>
</body>
</html>