var map;
function Initializtion(_map){
    map = _map;
}
function DrawPolygon(){
    $.getJSON("/geo/seogeo.geojson", function (geojson)
    {
        var data = geojson.features;
        var name = '';
        var code = '';

        $.each(data, function (index, val) {

            name = val.properties.SIG_KOR_NM;
            code = val.properties.SIG_CD;

            if(val.geometry.type == "MultiPolygon"){
                displayArea(name, code, val.geometry.coordinates, true);

                customOverlay.setContent('<div class="area">'+ name+ '</div>');

            }else {
                displayArea(name, code, val.geometry.coordinates, false);
                customOverlay.setContent('<div class="area">'+ name+ '</div>');

            }

        });


    });






}

function makePolygon(coordinates, name, code){
    var polygonPath = [];
    $.each(coordinates[0], function (index, coordinates) {

        polygonPath.push(new kakao.maps.LatLng(coordinates[1], coordinates[0]));
    });
    var polygon = new kakao.maps.Polygon({
        path : polygonPath,
        strokeWeight : 2,
        strokeColor : '#004c80',
        strokeOpacity : 0.8,
        fillColor : '#fff',
        fillOpacity : 0.7
    });


    daum.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
        polygon.setOptions({
            fillColor: '#09f'
        });

        customOverlay.setContent('<div class="area">'+ name+ '</div>');
        customOverlay.setPosition(mouseEvent.path);
        customOverlay.setMap(map);


    });

    daum.maps.event.addListener(polygon, 'mouseout', function () {
        polygon.setOptions({
            fillColor: '#fff'
        });

        customOverlay.setMap(null);
    });
    daum.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {

        customOverlay.setPosition(mouseEvent.path);
    });

    daum.maps.event.addListener(polygon, 'click', function () {
        var date = new Date();
        var month = date.getMonth() +1;
        var year = date.getFullYear();
        var ym = "month" + "year";
        console.log(code);
        aprtapi(code, "202209");
    });





    return polygon;

}
function makeMultiPolygon(coordinates, name,code){
    var polygonPath = [];
    $.each(coordinates, function (index, val2) {
        var coordinates2 = [];
        $.each(val2[0], function (index2, coordnate){

            coordinates2.push(new kakao.maps.LatLng(coordnate[1], coordnate[0]));
        });
        polygonPath.push(coordinates2);

    });


    var polygon =  new kakao.maps.Polygon({
        path : polygonPath,
        strokeWeight : 2,
        strokeColor : '#004c80',
        strokeOpacity : 0.8,
        fillColor : '#fff',
        fillOpacity : 0.7
    });

    daum.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
        polygon.setOptions({
            fillColor: '#09f'
        });

        customOverlay.setContent('<div class="area">'+ name+ '</div>');
        customOverlay.setPosition(mouseEvent.path);
        customOverlay.setMap(map);


    });

    daum.maps.event.addListener(polygon, 'mouseout', function () {
        polygon.setOptions({
            fillColor: '#fff'
        });

        customOverlay.setMap(null);
    });
    daum.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {

        customOverlay.setPosition(mouseEvent.path);
    });


    daum.maps.event.addListener(polygon, 'click', function () {
        var date = new Date();
        var month = date.getMonth() +1;
        var year = date.getFullYear();
        var ym = "month" + "year";
        console.log(code);

        aprtapi(code, "202209");

    });
    return polygon;

}
function displayArea(name, code, coordinates, multi) {
    var polygon;
    if(multi){
        polygon = makeMultiPolygon(coordinates , name ,code);
    }else {
        polygon = makePolygon(coordinates , name, code);
    }
    polygon.setMap(map);


}


function aprtapi(code, ym) {
    location.href= "/map?region_code="+code + "&ym=" + ym;
    /*	window.open("/map?region_code=" + region_code + "&ym=" +ym, "결과","width=1000, height=800")*/
}
