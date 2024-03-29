<%@ page import="kopo.poly.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    MemberDTO rDTO = (MemberDTO) request.getAttribute("dto");
    %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
    .email_input_re_1{
        color : green;
        display : none;
    }
    /* 중복아이디 존재하는 경우 */
    .email_input_re_2{
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
        color : red;
    }
    .final_email_ck{
        display: none;
        color : red;
    }
    .final_pw_ck{
        display: none;
        color : red;
    }
    .final_pwck_ck{
        display: none;
        color : red;
    }
    .final_name_ck{
        display: none;
        color : red;
    }
    .final_mail_ck{
        display: none;
        color : red;
    }
    .final_addr_ck{
        display: none;
        color : red;
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
</style>
<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>

<div class="wrapper">
    <form id="join_form" method="post">
        <div class="wrap">
            <div class="subjecet">
                <span>회원정보 수정하기</span>
            </div>
            <div class="id_wrap">
                <div class="id_name">아이디</div>
                <div class="id_input_box">
                    <input type="text" class="id_input" name="userid" id="userid" readonly="readonly" value="<%=rDTO.getUser_id()%>">
                </div>
                <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
                <span class="final_id_ck">아이디를 입력해주세요.</span>
            </div>
            <div class="pw_wrap">
                <div class="pw_name">비밀번호</div>
                <div class="pw_input_box">
                    <input type="password" class="pw_input" name="memberPw" id="memberPw" value="<%=rDTO.getUser_pw()%>">
                </div>
                <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
            </div>
            <div class="pwck_wrap">
                <div class="pwck_name">비밀번호 확인</div>
                <div class="pwck_input_box">
                    <input type="password" class="pwck_input">
                </div>
                <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
            </div>

            <div class="address_wrap">
                <div class="address_name">주소</div>
                <div class="address_input_1_wrap">
                    <div class="address_input_1_box">
                        <input type="text" class="address_input_1" name="memberAddr1" readonly="readonly" id="memberAddr1" value="<%=rDTO.getUser_addr1()%>">
                    </div>
                    <div class="address_button" onclick="execution_daum_address()">
                        <span>주소 찾기</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class ="address_input_2_wrap">
                    <div class="address_input_2_box">
                        <input type="text" class="address_input_2" name="memberAddr2" readonly="readonly" id="memberAddr2" value="<%=rDTO.getUser_addr2()%>">
                    </div>
                </div>
                <div class ="address_input_3_wrap">
                    <div class="address_input_3_box">
                        <input type="text" class="address_input_3" name="memberAddr3" readonly="readonly" id="memberAddr3" value="<%=rDTO.getUser_addr3()%>">
                    </div>
                </div>
                <span class="final_addr_ck">주소를 입력해주세요.</span>
            </div>
            <div class="join_button_wrap">
                <input type="submit" class="join_button" value="수정하기">
            </div>
        </div>
    </form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var code = "";				//이메일전송 인증번호 저장위한 코드
    /* 유효성 검사 통과유무 변수 */
    var idCheck = false;			// 아이디
    var pwCheck = false;			// 비번
    var pwckCheck = false;			// 비번 확인
    var pwckcorCheck = false;		// 비번 확인 일치 확인
    var mailnumCheck = false;		// 이메일 인증번호 확인
    var addressCheck = false 		// 주소
    $(document).ready(function() {
        //회원가입 버튼(회원가입 기능 작동)
        $(".join_button").click(function () {

            /* 입력값 변수 */
            var id = $('.id_input').val(); 				// id 입력란
            var pw = $('.pw_input').val();				// 비밀번호 입력란
            var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
            var addr = $('.address_input_3').val();		// 주소 입력란

            /* 아이디 유효성검사 */
            if (id == "") {
                $('.final_id_ck').css('display', 'block');
                idCheck = false;
                alert("아이디칸이 비어있습니다");
            } else {
                $('.final_id_ck').css('display', 'none');
                idCheck = true;
            }

            /* 비밀번호 유효성 검사 */
            if (pw == "") {
                $('.final_pw_ck').css('display', 'block');
                pwCheck = false;
                alert("비밀번호칸이 비어있습니다");
            } else {
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            }

            /* 비밀번호 확인 유효성 검사 */
            if (pwck == "") {
                $('.final_pwck_ck').css('display', 'block');
                pwckCheck = false;
                alert("비밀번호확인칸이 비어있습니다");
            } else {
                $('.final_pwck_ck').css('display', 'none');
                pwckCheck = true;
            }

            /* 이름 유효성 검사 */


            /* 주소 유효성 검사 */
            if (addr == "") {
                $('.final_addr_ck').css('display', 'block');
                addressCheck = false;
                alert("주소칸이 비어있습니다");
            } else {
                $('.final_addr_ck').css('display', 'none');
                addressCheck = true;
            }

            /* 최종 유효성 검사 */
            if (idCheck && pwCheck && pwckCheck && pwckcorCheck && addressCheck) {

                $("#join_form").attr("action", "/update1");
                $("#join_form").submit();

            }

            return false;
        });

        /* 다음 주소 연동 */
        function execution_daum_address() {

            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 주소변수 문자열과 참고항목 문자열 합치기
                        addr += extraAddr;

                    } else {
                        addr += ' ';
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $(".address_input_1").val(data.zonecode);
                    //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
                    $(".address_input_2").val(addr);
                    //$("[name=memberAddr2]").val(addr);			// 대체가능
                    // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                    $(".address_input_3").attr("readonly", false);
                    $(".address_input_3").focus();

                }
            }).open();

        }

        /* 비밀번호 확인 일치 유효성 검사 */
        $('.pwck_input').on("propertychange change keyup paste input", function () {

            var pw = $('.pw_input').val();
            var pwck = $('.pwck_input').val();
            $('.final_pwck_ck').css('display', 'none');

            if (pw == pwck) {
                $('.pwck_input_re_1').css('display', 'block');
                $('.pwck_input_re_2').css('display', 'none');
                pwckcorCheck = true;
            } else {
                $('.pwck_input_re_1').css('display', 'none');
                $('.pwck_input_re_2').css('display', 'block');
                pwckcorCheck = false;
            }


        })
    })

</script>


</body>
</html>