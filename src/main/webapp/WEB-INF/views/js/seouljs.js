var time = '202205';

function aa(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11000'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };

    xhr.send('');
}
<!--종로구-->
function bb(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11110'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };

    xhr.send('');
}
<!--중구-->
function cc(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11140'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--용산구-->
function dd(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11170'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--성동구-->
function ee(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11200'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--광진구-->
function ff(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11215'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--동대문구-->
function gg(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11230'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--중랑구-->
function hh(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11260'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--성북구-->
function ii(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11290'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--강븍구-->
function jj(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11305'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--도봉구-->
function kk(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11320'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}
<!--노원구-->
function ll(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11350'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--은평구-->
function mm(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11380'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--서대문구-->
function nn(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11410'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--마포구-->
function oo(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11440'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--양천구-->
function pp(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11470'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--강서구-->
function qq(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11500'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--구로구-->
function rr(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11530'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--금천구-->
function ss(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11545'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--영등포구-->
function tt(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11590'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--동작구-->
function uu(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('apivalue'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--관악구-->
function vv(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11620'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--서초구-->
function ww(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11650'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--강남구-->
function xx(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11680'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--송파구-->
function yy(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11710'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };
}<!--강동구-->
function zz(){

    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11740'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(time); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        }
    };


}
