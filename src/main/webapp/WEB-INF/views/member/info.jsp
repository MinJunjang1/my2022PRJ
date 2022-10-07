<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="utf-8">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">--%>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>내정보</title>

</head>
<style>
    .color {
        width: 350px;
        margin: 0 auto;
    }
    .color li {
        margin: 0 15px 0 0;
        width: 30px;
        height: 30px;
        display: inline-block;
        border-radius: 100%;
    }
    .color .red    {background: #fa5a5a;}
    .color .yellow {background: #f0d264;}
    .color .green  {background: #82c8a0;}
    .color .cyan   {background: #7fccde;}
    .color .blue   {background: #6698cb;}
    .color .purple {background: #cb99c5;}

    .content,
    .content-gradient,
    .content-3d {
        margin: 40px auto;
    }
    .content {
        width: 80%;
        max-width: 700px;
    }
    .content-3d {
        width: 50%;
        max-width: 300px;
    }
    pre {
        width: 100%;
        padding: 30px;
        background-color: rgba(0, 0, 0, 0.72);
        color: #f8f8f2;
        border-radius: 0 0 4px 4px;
        margin-top: 20px;
        white-space: pre-wrap; /* css-3 */
        white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
        white-space: -pre-wrap; /* Opera 4-6 */
        white-space: -o-pre-wrap; /* Opera 7 */
        word-wrap: break-word; /* Internet Explorer 5.5+ */
    }
    pre .bt  {color: #f8f8f2;} /* <> */
    pre .anc {color: #f92672;} /* anchor tag */
    pre .att {color: #a6a926;} /* attribute */
    pre .val {color: #e6db74;} /* value */

    .btn-container, .container {
        background-color: white;
        border-radius: 4px;
        text-align: center;
        margin-bottom: 40px;
    }
    .container h2 {
        padding-top: 30px;
        font-weight: 300;
    }
    .btn, .btn-two {
        margin: 9px;
    }
    .btn-gradient {
        margin: 5px;
    }
    a[class*="btn"] {text-decoration: none;}
    input[class*="btn"],
    button[class*="btn"] {border: 0;}

    /* Here you can change the button sizes */
    .btn.large,
    .btn-two.large,
    .btn-effect.large {
        padding: 20px 40px;
        font-size: 22px;
    }
    .btn.small,
    .btn-two.small,
    .btn-gradient.small,
    .btn-effect.small {
        padding: 8px 18px;
        font-size: 14px;
    }
    .btn.mini,
    .btn-two.mini,
    .btn-gradient.mini,
    .btn-effect.mini {
        padding: 4px 12px;
        font-size: 12px;
    }
    .btn.block,
    .btn-two.block,
    .btn-gradient.block,
    .btn-effect.block {
        display: block;
        width: 60%;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
    }
    .btn-gradient.large {
        padding: 15px 45px;
        font-size: 22px;
    }

    /* Colors for .btn and .btn-two */
    .btn.blue, .btn-two.blue     {background-color: #7fb1bf;}
    .btn.green, .btn-two.green   {background-color: #9abf7f;}
    .btn.red, .btn-two.red       {background-color: #fa5a5a;}
    .btn.purple, .btn-two.purple {background-color: #cb99c5;}
    .btn.cyan, .btn-two.cyan     {background-color: #7fccde;}
    .btn.yellow, .btn-two.yellow {background-color: #f0d264;}

    .rounded {
        border-radius: 10px;
    }

    /* default button style */
    .btn {
        position: relative;
        border: 0;
        padding: 15px 25px;
        display: inline-block;
        text-align: center;
        color: white;
    }
    .btn:active {
        top: 4px;
    }

    /* color classes for .btn */
    .btn.blue {box-shadow: 0px 4px #74a3b0;}
    .btn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}

    .btn.green {box-shadow: 0px 4px 0px #87a86f;}
    .btn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}

    .btn.red {box-shadow:0px 4px 0px #E04342;}
    .btn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}

    .btn.purple {box-shadow:0px 4px 0px #AD83A8;}
    .btn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}

    .btn.cyan {box-shadow:0px 4px 0px #73B9C9;}
    .btn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}

    .btn.yellow {box-shadow:0px 4px 0px #D1B757;}
    .btn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}

    /* Button two - I have no creativity for names */
    .btn-two {
        color: white;
        padding: 15px 25px;
        display: inline-block;
        border: 1px solid rgba(0,0,0,0.21);
        border-bottom-color: rgba(0,0,0,0.34);
        text-shadow:0 1px 0 rgba(0,0,0,0.15);
        box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset,
        0 2px 0 -1px rgba(0,0,0,0.13),
        0 3px 0 -1px rgba(0,0,0,0.08),
        0 3px 13px -1px rgba(0,0,0,0.21);
    }
    .btn-two:active {
        top: 1px;
        border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
        box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
        position: relative;
    }
</style>

<style>
    *{
        margin: 0;
        padding:0;
    }

    /* 화면 전체 렙 */
    .wrapper{
        width: 100%;
    }

    /* content 랩 */
    .wrap{
        width : 800px;
        margin: auto;
    }
    /* 페이지 제목 */
    .subjecet{
        width: 100%;
        height: 120px;
        background-color: #8EC0E4;
    }
    .subjecet span{
        margin-left: 31px;
        font-size: 80px;
        font-weight: 900;
        color: white;
    }

    /* 아이디 영역 */
    .id_wrap{
        width: 80%;
        margin-top: 20px;
    }
    .id_name{
        font-size: 25px;
        font-weight: bold;
    }
    .id_input_box{
        border: 1px solid black;
        height:45px;
        padding: 1px 14px;

    }
    .id_input{
        width:80%;
        height:100%;
        border:none;
        font-size:28px;
    }

    /* 메일 영역 */
    .mail_wrap{
        width: 80%;
        margin-top: 20px;
    }
    .mail_name{
        font-size: 25px;
        font-weight: bold;
    }
    .mail_input_box{
        border: 1px solid black;
        height:45px;
        padding: 1px 14px;

    }
    .mail_input{
        width:80%;
        height:100%;
        border:none;
        font-size:28px;
    }

    /* 주소 영역 */
    .address_wrap{
        width: 80%;
        margin-top: 20px;
    }
    .address_name{
        font-size: 25px;
        font-weight: bold;
    }
    .address_input_1_box{
        border: 1px solid black;
        height: 45px;
        padding: 1px 14px;
        width: 61%;
        float: left;
    }
    .address_input_1{
        width:80%;
        height:100%;
        border:none;
        font-size:28px;
    }

    .address_input_2_wrap{
        margin-top: 20px;
    }
    .address_input_2_box{
        border: 1px solid black;
        height:45px;
        padding: 1px 14px;

    }
    .address_input_2{
        width:80%;
        height:100%;
        border:none;
        font-size:28px;
    }

    .address_input_3_wrap{
        margin-top: 20px;
    }
    .address_input_3_box{
        border: 1px solid black;
        height:45px;
        padding: 1px 14px;

    }
    .address_input_3{
        width:80%;
        height:100%;
        border:none;
        font-size:28px;
    }

    /* 가입하기 버튼 */
    .join_button_wrap{
        margin-top: 40px;
        text-align: center;
    }


    /* float 속성 해제 */
    .clearfix{
        clear: both;
    }

    .container-shadow{
         box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset, rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
         background-color: #FFFFFF;
     }


</style>
<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body style="background-color: #E2E2E2">
<div style="height: 50px;"></div>
<div class="container-shadow" style="width: 800px; margin: auto;" >

<div class="wrapper">
    <form id="join_form" method="post" action="/update">
        <div class="wrap">
            <div class="subjecet">
                <span>회원정보</span>
            </div>
            <div style="margin: auto; width: 700px">
            <div class="id_wrap">
                <div class="id_name">아이디</div>
                <div class="id_input_box">
                    <input type="text" class="id_input" name="userid" value="${dto.user_id}" id="userid" readonly="readonly" >
                </div>
            </div>
            <div class="mail_wrap">
                <div class="mail_name">이메일</div>
                <div class="mail_input_box">
                    <input type="text" class="mail_input" name="memberMail" value="${dto.user_email}" id="memberMail" disabled>
                </div>
            </div>
            <div class="address_wrap">
                <div class="address_name">주소</div>
                <div class="address_input_1_wrap">
                    <div class="address_input_1_box">
                        <input type="text" class="address_input_1" name="memberAddr1" value="${dto.user_addr1}" readonly="readonly" id="memberAddr1"  >
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class ="address_input_2_wrap">
                    <div class="address_input_2_box">
                        <input type="text" class="address_input_2" name="memberAddr2" value="${dto.user_addr2}" readonly="readonly" id="memberAddr2" >
                    </div>
                </div>
                <div class ="address_input_3_wrap">
                    <div class="address_input_3_box">
                        <input type="text" class="address_input_3" name="memberAddr3" value="${dto.user_addr3}" readonly="readonly" id="memberAddr3" >
                    </div>
                </div>
            </div>
            <div>
                <br/>
                <div style="font-size: 25px;">
                    회원가입일 :  <fmt:formatDate value="${dto.user_dt}" pattern="yyyy-MM-dd"/>
                </div>

                <br/>
            </div>
            <div class="join_button_wrap">
                <input type="button" class="btn-two blue " value="정보수정" onclick="location.href='/update?user_id=${dto.user_id}'">
                <button type="button" class="btn-two red " onclick="location.href='/deleteuser?user_id=${dto.user_id}'">탈퇴하기</button>


            </div>
                <div style="height: 50px;"></div>
            </div>
        </div>
    </form>
</div>

</div>
<div style="height: 50px;"></div>

</body>
</html>