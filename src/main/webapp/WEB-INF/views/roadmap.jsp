<%@ page import="kopo.poly.dto.apiDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String Dong = (String) request.getAttribute("Dong");
  String Jiburn = (String) request.getAttribute("Jiburn");
  String Name = (String) request.getAttribute("Name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <title>카카오 맵</title>

</head>
<style>
  .find-btn{
    text-align: center;
  }
  .find-btn1{
    display :inline-block;
  }

</style>
<style>
  #container {overflow:hidden;height:300px;position:relative;}
  #btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
  #btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
  #container.view_map #mapWrapper {z-index: 10;}
  #container.view_map #btnMap {display: none;}
  #container.view_roadview #mapWrapper {z-index: 0;}
  #container.view_roadview #btnRoadview {display: none;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903&libraries=services"></script>

<body>
<jsp:include page="header.jsp" flush="false"></jsp:include>
<script type="text/javascript">
  function closeTabClick() {
    window.close();
  }
</script>

<div class="container align-content-center">
  <div class="left" style="height: 50px">
  </div>

  <h1 class="text-center">서울 <%=Dong%> <%=Jiburn%> <%=Name%></h1>
  <p class="text-center">아파트 위치</p>
  <div class="find-btn">

    <div style="height: 50px;">

    </div>

    <div id="container" class="view_map" style="height: 500px;">
      <div id="mapWrapper" style="width:100%;height:500px;position:relative;">
        <div id="map" style="width:100%;height:500px;"></div> <!-- 지도를 표시할 div 입니다 -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰"/>
      </div>
      <div id="rvWrapper" style="width:100%;height:500px;position:absolute;top:0;left:0;">
        <div id="roadview" style="height:500px;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
      </div>
    </div>

    <div style="height: 50px;">

     </div>

  <%--
<div id="map" style="width:100%;height:350px;"></div>--%>

<!-- kakao API -->
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  // 버튼을 click했을때

  var map = new kakao.maps.Map(mapContainer, mapOption);
  var geocoder = new kakao.maps.services.Geocoder();



  geocoder.addressSearch("서울 <%=Dong%> <%=Jiburn%> <%=Name%>", function(result, status) {

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
        content: '<div style="width:250px;height:80px; display: table-cell;text-align:center;padding:6px 0;margin: auto;vertical-align: middle;">장소</div>'
      });
      infowindow.open(map, marker);

      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
    }
    var iwContent = '<div style="padding:5px;width:250px;text-align:center;"></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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

      var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
              mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
              btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다
              btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다
              rvContainer = document.getElementById('roadview'), // 로드뷰를 표시할 div 입니다
              mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다


function find(){

  var geocoder = new kakao.maps.services.Geocoder();
  geocoder.addressSearch("서울 <%=Dong%> <%=Jiburn%> <%=Name%>", function(result, status) {
  if (status === kakao.maps.services.Status.OK) {
    console.log(result[0].y);
    console.log(result[0].x);



    console.log("http://map.kakao.com/link/to/서울 <%=Dong%> <%=Jiburn%> <%=Name%>," + result[0].y + "," + result[0].x);
    location.href = "http://map.kakao.com/link/to/" + "서울 <%=Dong%> <%=Jiburn%> <%=Name%>" + "," + result[0].y + "," + result[0].x ;
  }
  });
}


function roadview() {
  var roadviewClient = new kakao.maps.RoadviewClient();
  geocoder.addressSearch("서울 <%=Dong%> <%=Jiburn%> <%=Name%>", function (result, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {
      console.log(result[0].y);
      console.log(result[0].x);

      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);


      // 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다
      var placePosition = coords;

      // 지도 옵션입니다
      var mapOption = {
        center: placePosition, // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
      };

      // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 로드뷰 객체를 생성합니다
      var roadview = new kakao.maps.Roadview(rvContainer, mapOption);

      // 로드뷰의 위치를 특정 장소를 포함하는 파노라마 ID로 설정합니다
      // 로드뷰의 파노라마 ID는 Wizard를 사용하면 쉽게 얻을수 있습니다

      var position = coords;

// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
      roadviewClient.getNearestPanoId(position, 50, function(panoId) {
        roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
      });





      // 특정 장소가 잘보이도록 로드뷰의 적절한 시점(ViewPoint)을 설정합니다
      // Wizard를 사용하면 적절한 로드뷰 시점(ViewPoint)값을 쉽게 확인할 수 있습니다
      roadview.setViewpoint({
        pan: 321,
        tilt: 0,
        zoom: 0
      });

      // 로드뷰 초기화가 완료되면
      kakao.maps.event.addListener(roadview, 'init', function () {


      });
    }

  });
}

    // 지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다
    function toggleMap(active) {
      if (active) {

        // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
        container.className = "view_map"
        roadview();
        location.reload();
      } else {

        // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
        container.className = "view_roadview"
        roadview();
      }
    }


    </script>
<div class="find-btn d-grid gap-2 col-10 mx-auto">

  <button type="button" onclick="find();" class="btn btn-secondary">길찾기</button>

  <button type="button" class="btn btn-primary " onclick="closeTabClick()">창닫기</button>

</div>

  </div>
</div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c76cc1c43d5a2282105afc01c0e20903&libraries=services,clusterer,drawing"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>