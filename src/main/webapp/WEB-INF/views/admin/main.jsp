<%@ page import="kopo.poly.dto.MemberDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <title>과리자 페이지</title>

</head>

<style>
    *{
        margin: 0;
        padding:0;
    }
    a{
        text-decoration: none;
    }
    ul{
        list-style: none;
    }
    /* 화면 전체 렙 */
    .wrapper{
        width: 100%;
    }
    /* content 랩 */
    .wrap{
        width : 1080px;
        margin: 0;
    }
    /* 홈페이지 기능 네비 */
    .top_gnb_area{
        width: 100%;
        height: 50px;
        background-color: #f0f0f1;
        position:relative;
    }
    .top_gnb_area .list{
        position: absolute;
        top: 0px;
        right: 0;

    }
    .top_gnb_area .list li{
        list-style: none;
        float : left;
        padding: 0px 15px 0 10px;
        font-weight: 900;
        cursor: pointer;
    }

    /* 관리제 페이지 상단 현페이지 정보 */
    .admin_top_wrap{
        height:110px;
        line-height: 110px;
        background-color: #5080bd;
        margin-bottom:15px;
    }
    .admin_top_wrap>span{
        margin-left: 20px;
        display:inline-block;
        color: white;
        font-size: 50px;
        font-weight: bolder;
    }
    /* 관리자 wrap(네비+컨텐츠) */
    .admin_wrap{


    }

    /* 관리자페이지 네비 영역 */
    .admin_navi_wrap{
        width: 20%;
        height: 300px;
        float:left;
        height: 100%;
    }
    .admin_navi_wrap li{
        display: block;
        height: 80px;
        line-height: 80px;
        text-align: center;
    }
    .admin_navi_wrap li a{
        display: block;
        height: 100%;
        width: 95%;
        margin: 0 auto;
        cursor: pointer;
        font-size: 30px;
        font-weight: bolder;
    }
    .admin_navi_wrap li a:link {color: black;}
    .admin_navi_wrap li a:visited {color: black;}
    .admin_navi_wrap li a:active {color: black;}
    .admin_navi_wrap li a:hover {color: black;}


    /* 관리자페이지 컨텐츠 영역 */
    .admin_content_wrap{
        width: 80%;
        float:left;
        min-height:700px;
    }
    .admin_content_wrap div{
        margin-top: 280px;
        text-align: center;
        font-size: 50px;
        font-weight: bolder;
    }

    /* footer navai 영역 */
    .footer_nav{
        width:100%;
        height:50px;
    }
    .footer_nav_container{
        width: 100%;
        height: 100%;
        background-color:#8EC0E4;
    }
    .footer_nav_container>ul{
        font-weight : bold;
        float:left;
        list-style:none;
        position:relative;
        padding-top:10px;
        line-height: 27px;
        font-family: dotum;
        margin-left: 10px;
    }
    .footer_nav_container>ul>li{
        display:inline;
        width: 45px;
        height: 19px;
        padding: 10px 9px 0 10px;
    }
    .footer_nav_container>ul>span{
        margin: 0 4px;
    }


    .footer_left>img {
        width: 150%;
        height: 130px;
        margin-left: -20px;
        margin-top: -12px;
    }


    .container-list{
        box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
        background-color: #FFFFFF;
    }
</style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body style="background-color: #E2E2E2">
<div style="height: 50px"></div>
<div class="container" style="margin: auto;" >
    <div class="container container-list" style="margin: 0px; width: 1080px; padding: 0px">
<div class="wrapper">
    <div class="wrap">
        <div class="admin_top_wrap">
            <span>관리자 페이지</span>

        </div>
        <div style="height: 50px"></div>
        <!-- contents-area -->
        <div class="admin_wrap">
            <!-- 네비영역 -->
            <div class="admin_navi_wrap">
                <ul>
                    <li >
                        <a class="admin_list_01" href="/userlist">사용자 관리</a>
                    </li>
<%--                    <li>--%>
<%--                        <a class="admin_list_02" href="/admin/boardlist">게시판관리</a>--%>
<%--                    </li>--%>

                </ul>
            </div>
            <div style="height: 50px"></div>
        </div>
        <div style="height: 50px"></div>
    </div>
</div>
        <div style="height: 50px"></div>
    </div>
    <div style="height: 50px"></div>
</div>
</body>
</html>