
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>id/pw 찾기</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
</head>
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

    .logo_wrap>span{
        font-size : 45px;
        font-weight: 900;
    }

    .pw_wrap{
        margin-top: 40px;
    }
    .pw_input_box{
        border: 1px solid black;
        height:31px;
        padding: 10px 14px;
        display: block;
        width : 80%;
        margin : auto;
    }
    .pw_iput{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }


    .login_button_wrap{
        margin-top: 40px;
        text-align: center;
    }
    .login_button{
        width: 84%;
        height: 80px;
        background-color: #6AAFE6;
        font-size: 40px;
        font-weight: 900;
        color: white;
        margin : auto;
    }
    .idserch_button{
        width: 84%;
        height: 80px;
        background-color: #6AAFE6;
        font-size: 40px;
        font-weight: 900;
        color: white;
        margin : auto;
    }
    .pwserch_button{
        width: 84%;
        height: 80px;
        background-color: #6AAFE6;
        font-size: 40px;
        font-weight: 900;
        color: white;
        margin : auto;
    }


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
    .pw_wrap div{
        font-size:28px;
        font-weight: bold;
        width: 80%;
        padding: 10px 14px;
        margin: 0px 65px;
    }
    .search_button_wrap{
        margin-top: 40px;
        text-align: center;
    }

    .search_button{
        width: 42%;
        height: 80px;
        background-color: #6AAFE6;
        font-size: 40px;
        font-weight: 900;
        color: white;
        margin : auto;
    }
    .join_button{
        width: 42%;
        height: 80px;
        background-color: #6AAFE6;
        font-size: 40px;
        font-weight: 900;
        color: white;
        margin : auto;
    }
</style>
<body>

<div class="wrapper">
    <div class="wrap">
        <div id="idserch">
        <form id="login_form" class="idform" method="post">
            <div class="subjecet">
                <span>ID 찾기</span>
            </div>

            <div class="login_wrap">

                <div class="pw_wrap">

                    <div>EMAIL</div>

                    <div class="pw_input_box">

                        <input type="email" class="pw_iput" name="user_email" id="user_email">

                    </div>
                </div>
                <div class="login_button_wrap">
                    <input type="button" class="idserch_button"  value="찾기" >
                </div>
            </div>

        </form>

    </div>
<div id="pwserch">
        <form id="pw_form" class="pwform" method="post">
        <div class="subjecet">
            <span>PW 찾기</span>
        </div>

        <div class="login_wrap">

            <div class="pw_wrap">

                <div>ID</div>
                <div class="pw_input_box">

                    <input type="id" class="pw_iput" name="user_id" id="user_id">

                </div>
            </div>

            <div class="login_button_wrap">
                <input type="button" class="pwserch_button"  value="찾기" >
            </div>
        </div>
    </form>


</div>
     <div class="search_button_wrap">
                <input type="button" class="login_button" value="로그인" onclick="location.href='/login'">
     </div>
        <div class="login_button_wrap">
            <input type="button" class="search_button" value="ID찾기" onclick="idshow()">
            <input type="button" class="join_button" value="PW찾기" onclick="pwshow()">
        </div>
    </div>
</div>

<script>

    $("#idserch").show();

    $("#pwserch").hide();

    function idshow(){
        $("#pwserch").hide();
        $("#idserch").show();



    }
    function pwshow(){
        $("#idserch").hide();
        $("#pwserch").show();

    }

    /* 로그인 버튼 클릭 메서드 */
    $(".idserch_button").click(function(){

        //alert("로그인 버튼 작동");
        /* 로그인 메서드 서버 요청 */

        $("#login_form").attr("action", "/idserch");

        $("#login_form").submit();

    });
    $(".pwserch_button").click(function(){

        //alert("로그인 버튼 작동");
        /* 로그인 메서드 서버 요청 */

        $("#login_form").attr("action", "/idserch");

        $("#login_form").submit();

    });

</script>

</body>
</html>