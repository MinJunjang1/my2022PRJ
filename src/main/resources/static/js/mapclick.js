
var map;
function Initializtion(_map){
    map = _map;
}

function DrawPolygon() {
    $.getJSON("/geo/seogeo.geojson", function (geojson) {
        var data = geojson.features;
        var coordinates = [];
        var name = '';



        $.each(data, function (index, val) {
            coordinates = val.geometry.coordinates;
            name = val.properties.SIG_KOR_NM;
            displayArea(coordinates, name);
        })

    })


}

var polygons=[];

function displayArea(coordinates, name){
    var path = [];
    var points = [];

    $.each(coordinates[0], function (index, coordinates){
        var point = new Object();
        point.x = coordinates[1];
        point.y = coordinates[0];
        points.push(point);
        path.push(new daum.maps.LatLng(coordinates[1], coordinates[0]));
    })

    var polygon =  new kakao.maps.Polygon({
        map : map,
        path : path,
        strokeWeight : 2,
        strokeColor : '#004c80',
        strokeOpacity : 0.8,
        fillColor : '#fff',
        fillOpacity : 0.7
    });



    polygons.push(polygon);




    daum.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
      polygon.setOptions({
          fillColor: '#09f'
      });
      customOverlay.setContent('<div class="area">'+ name+ '</div>');
      customOverlay.setPosition(mouseEvent.latLng);
      customOverlay.setMap(map);


    });

    daum.maps.event.addListener(polygon, 'mouseout', function () {
        polygon.setOptions({
            fillColor: '#fff'
        });

        customOverlay.setMap(null);
    });
    daum.maps.event.addListener(polygon, 'mousemove', function () {

        customOverlay.setPosition(mouseEvent.latLng);
    });
    daum.maps.event.addListener(polygon, 'click', function () {

       var level = map.getLevel()-2;
       map.setLevel(level, {anchor: centroid(points), animate:{
           duration: 350
           }});
       deletePolygon(polygons);
    });

}

function centroid(point){
    var i, j, len, p1, p2, f, area, x, y;

    area = x = y = 0;

    for(i = 0, len = point.length, j = len - 1; i < len; j = i ++){
        p1 = points[i];
        p2 = points[j];

        f = p1.y * p2.x - p2.y * p1.x;
        x += (p1.x + p2.x) * f;
        y += (p1.y + p2.y) * f;
        area += f * 3;

    }
    return new daum.maps.LntLng(x / area, y / area);
}

function deletePolygon(polygons){
    for (var i = 0; i<polygons.length; i++){
        polygons[i].setMap(null);
    }
    polygons = [];
}