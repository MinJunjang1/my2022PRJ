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