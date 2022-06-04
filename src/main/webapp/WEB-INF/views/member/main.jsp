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

<script type="text/javascript">

	var   num1 = 37.541;
	var num2 = 126.986;
	function api() {
		var xhr = new XMLHttpRequest();
		var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11140'); /**/
		queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202205'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
			if (this.readyState == 4) {
				alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
			}
		};

		xhr.send('');
	}


</script>

<script type="text/javascript">
function mapapi(apivalue, ymd){

		var xhr = new XMLHttpRequest();
		var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent(apivalue); /**/
		queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(ymd); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
			if (this.readyState == 4) {
				alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
			}
		};

		xhr.send('');

}

</script>

<!--map-->

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
						<a class="admin_list_01"  href="/userlist">서울</a>
					</li>


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


				</script>

				<button id="seo1" onclick="seoul(); setSeoul(); return false;" >서울</button>
				<button onclick="seoul1(); setJongnogu();">종로구</button>
				<button type="button" onclick="api2(); setJunggu(); return false;">중구</button>
				<button onclick="seoul3();setYongsangu();">용산구</button>
				<button onclick="seoul4();setSeongdonggu();">성동구</button>
				<button onclick="seoul5();setGwangjingu();">광진구</button>
				<button onclick="seoul6();setDongdaemungu();">동대문구</button>
				<button onclick="seoul7();setJungnanggu();">중량구</button>
				<button onclick="seoul8();setSeongbukgu(); ">성북구</button>
				<button onclick="seoul9();setGangbukgu();">강북구</button>
				<button onclick="seoul10();setDobonggu(); ">도봉구</button>
				<button onclick="seoul11();setNowongu(); ">노원구</button>
				<button onclick="seoul12();setEunpyeonggu(); ">은평구</button>
				<button onclick="seoul13();setSeodaemungu(); ">서대문구</button>
				<button onclick="seoul14();setMapogu(); ">마포구</button>
				<button onclick="seoul15();setYangcheongu(); ">양천구</button>
				<button onclick="seoul16();setGangseogu(); ">강서구</button>
				<button onclick="seoul17();setGurogu(); ">구로구</button>
				<button onclick="seoul18();setGeumcheongu();">금천구</button>
				<button onclick="seoul19();setYeongdeungpogu(); ">영등포구</button>
				<button onclick="seoul20();setDongjakgu();">동작구</button>
				<button onclick="seoul21();setGwanakgu();">관악구</button>
				<button onclick="seoul22();setSeochogu(); ">서초구</button>
				<button onclick="seoul23();setGangnamgu(); ">강남구</button>
				<button onclick="seoul24();setSongpagu();">송파구</button>
				<button onclick="seoul25();setGangdonggu();">강동구</button>
				<button onclick="seoul2();">api</button>
				<button onclick="mapapi(11110,202205);">테스트</button>
			</div>
			<div class="clearfix">

			</div>
		</div>
	</div>
</div>


<body>
</body>
<script src="/js/seouljs.js"></script>
<script src="/js/seoulmap.js">

</script>
<script>
	/* 로그인 버튼 클릭 메서드 */
	$(".seo1").click(function(){

		//alert("로그인 버튼 작동");
		/* 로그인 메서드 서버 요청 */

		$("#login_form").attr("action", "/userlogin.do");

		$("#login_form").submit();

	});

</script>
</html>