
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
    <!--용산구-->
    function seoul3(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11170'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}

    <!--성동구-->
    function seoul4(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11200'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}

    <!--광진구-->
    function seoul5(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11215'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}

    <!--동대문구-->
    function seoul6(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11230'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}

    <!--중랑구-->
    function seoul7(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11260'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}

    <!--성북구-->
    function seoul8(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11290'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--강북구-->
    function seoul9(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11305'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--도봉구-->
    function seoul10(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11320'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--노원구-->
    function seoul11(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11350'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--은평구-->
    function seoul12(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11380'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--서대문구-->
    function seoul13(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11410'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--마포구-->
    function seoul14(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11440'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--양천구-->
    function seoul15(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11470'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--강서구-->
    function seoul16(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11500'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--구로구-->
    function seoul17(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11530'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--금천구-->
    function seoul18(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11545'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--영등포구-->
    function seoul19(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11560'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--동작구-->
    function seoul20(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11590'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--관악구-->
    function seoul21(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11620'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--서초구-->
    function seoul22(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11590'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--강남구-->
    function seoul23(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11680'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--송파구-->
    function seoul24(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11710'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}
    <!--강동구-->
    function seoul25(){
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'ZRSyL0r8ICOuGWAMN7D6Q2LkcS8pgYf%2FREi6WHhsy%2BaKotLgDmgl1EnmMFG2hl%2Fy09nYgQMi1xf1cPeCt1BC2Q%3D%3D'; /*Service Key*/
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var dateString = year  + month  ;


    queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11740'); /**/
    queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent(dateString); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
    alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
}
};

    xhr.send('');
}