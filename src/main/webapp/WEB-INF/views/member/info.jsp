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
    <title>회원가입1</title>

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
        width: 100%;
        margin-top: 20px;
    }
    .id_name{
        font-size: 25px;
        font-weight: bold;
    }
    .id_input_box{
        border: 1px solid black;
        height:31px;
        padding: 1px 14px;

    }
    .id_input{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }
    /* 중복아이디 존재하지 않는경우 */
    .id_input_re_1{
        color : green;
        display : none;
    }
    /* 중복아이디 존재하는 경우 */
    .id_input_re_2{
        color : red;
        display : none;
    }

    /* 비밀번호 영역 */
    .pw_wrap{
        width: 100%;
        margin-top: 20px;
    }
    .pw_name{
        font-size: 25px;
        font-weight: bold;
    }
    .pw_input_box{
        border: 1px solid black;
        height:31px;
        padding: 1px 14px;

    }
    .pw_input{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }

    /* 비밀번호 확인 영역 */
    .pwck_wrap{
        width: 100%;
        margin-top: 20px;
    }
    .pwck_name{
        font-size: 25px;
        font-weight: bold;
    }
    .pwck_input_box{
        border: 1px solid black;
        height:31px;
        padding: 1px 14px;

    }
    .pwck_input{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }

    /* 메일 영역 */
    .mail_wrap{
        width: 100%;
        margin-top: 20px;
    }
    .mail_name{
        font-size: 25px;
        font-weight: bold;
    }
    .mail_input_box{
        border: 1px solid black;
        height:31px;
        padding: 1px 14px;

    }
    .mail_input{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }
    .mail_check_wrap{
        margin-top: 20px;
    }
    .mail_check_input_box{
        border: 1px solid black;
        height: 31px;
        padding: 1px 14px;
        width: 61%;
        float: left;
    }
    #mail_check_input_box_false{
        background-color:#ebebe4;
    }
    #mail_check_input_box_true{
        background-color:white;
    }
    .mail_check_input{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }
    .mail_check_button{
        border: 1px solid black;
        height: 51px;
        width: 30%;
        float: right;
        line-height: 50px;
        text-align: center;
        font-size: 30px;
        font-weight: 900;
        background-color: #ececf7;
        cursor: pointer;
    }
    .correct{
        color : green;
    }
    .incorrect{
        color : red;
    }

    /* 주소 영역 */
    .address_wrap{
        width: 100%;
        margin-top: 20px;
    }
    .address_name{
        font-size: 25px;
        font-weight: bold;
    }
    .address_input_1_box{
        border: 1px solid black;
        height: 31px;
        padding: 1px 14px;
        width: 61%;
        float: left;
    }
    .address_input_1{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }
    .address_button{
        border: 1px solid black;
        height: 51px;
        width: 30%;
        float: right;
        line-height: 50px;
        text-align: center;
        font-size: 30px;
        font-weight: 900;
        background-color: #ececf7;
        cursor: pointer;
    }
    .address_input_2_wrap{
        margin-top: 20px;
    }
    .address_input_2_box{
        border: 1px solid black;
        height:31px;
        padding: 1px 14px;

    }
    .address_input_2{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }

    .address_input_3_wrap{
        margin-top: 20px;
    }
    .address_input_3_box{
        border: 1px solid black;
        height:31px;
        padding: 1px 14px;

    }
    .address_input_3{
        width:100%;
        height:100%;
        border:none;
        font-size:28px;
    }

    /* 가입하기 버튼 */
    .join_button_wrap{
        margin-top: 40px;
        text-align: center;
    }
    .join_button{
        width: 100%;
        height: 80px;
        background-color: #6AAFE6;
        font-size: 40px;
        font-weight: 900;
        color: white;
    }

    /* 유효성 검사 문구 */

    .final_id_ck{
        display: none;
    }
    .final_pw_ck{
        display: none;
    }
    .final_pwck_ck{
        display: none;
    }
    .final_name_ck{
        display: none;
    }
    .final_mail_ck{
        display: none;
    }
    .final_addr_ck{
        display: none;
    }

    /* 비밀번호 확인 일치 유효성검사 */
    .pwck_input_re_1{
        color : green;
        display : none;
    }
    .pwck_input_re_2{
        color : red;
        display : none;
    }

    /* float 속성 해제 */
    .clearfix{
        clear: both;
    }
    .deletekey{
        text-align: center;
    }

</style>
<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>

<div class="wrapper">
    <form id="join_form" method="post" action="/update">
        <div class="wrap">
            <div class="subjecet">
                <span>회원정보</span>
            </div>
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
               회원가입일 : ${dto.user_dt}
            </div>
            <div class="join_button_wrap">
                <input type="button" class="btn btn-warning" value="정보수정" onclick="location.href='/update?user_id=${dto.user_id}'">
                <button type="button" class="btn btn-danger" onclick="location.href='/deleteuser?user_id=${dto.user_id}'">탈퇴하기</button>
            </div>
        </div>

    </form>
</div>


<%--

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="deletekey">
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                탈퇴하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="location.href='/deleteuser?user_id=${dto.user_id}'">탈퇴하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</div>
--%>

</body>
</html>