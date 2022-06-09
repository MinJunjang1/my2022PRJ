<%@ page import="kopo.poly.dto.MemberDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.MemberDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<MemberDTO> mList = (List<MemberDTO>) request.getAttribute("mList");

//게시판 조회 결과 보여주기
    if (mList == null) {
        mList = new ArrayList<MemberDTO>();

    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>회원정보</title>

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
        margin: auto;
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
        padding: 13px 15px 0 10px;
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
        margin-left: 30px;
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

    .admin_list_01{
        background-color: #c8c8c8;
    }


    /* 관리자페이지 컨텐츠 영역 */
    .admin_content_wrap{
        width: 80%;
        float:left;
        height: 100%;
        height: 700px;

    }
    .admin_content_subject{            /* 관리자 컨텐츠 제목 영역 */
        font-size: 40px;
        font-weight: bolder;
        padding-left: 15px;
        background-color: #6AAFE6;
        height: 80px;
        line-height: 80px;
        color: white;
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
    /* footer 영역 */
    .footer{
        width:100%;
        height:130px;
        background-color:#D4DFE6;
        padding-bottom : 50px;
    }
    .footer_container{
        width: 100%;
        height: 100%;
        margin: auto;
    }
    .footer_left>img {
        width: 150%;
        height: 130px;
        margin-left: -20px;
        margin-top: -12px;
    }
    .footer_left{
        float :left;
        width: 170px;
        margin-left: 20px;
        margin-top : 30px;

    }
    .footer_right{
        float :left;
        width: 680px;
        margin-left: 70px;
        margin-top : 30px;
    }




    /* float 속성 해제 */
    .clearfix{
        clear: both;
    }

    /* DivTable.com */
    .divTable{
        display: table;
        width: 100%;
    }
    .divTableRow {
        display: table-row;
    }
    .divTableHeading {
        background-color: #EEE;
        display: table-header-group;
    }
    .divTableCell, .divTableHead {
        border: 1px solid #999999;
        display: table-cell;
        padding: 3px 10px;
    }
    .divTableHeading {
        background-color: #EEE;
        display: table-header-group;
        font-weight: bold;
    }
    .divTableFoot {
        background-color: #EEE;
        display: table-footer-group;
        font-weight: bold;
    }
    .divTableBody {
        display: table-row-group;
    }

</style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>

<div class="wrapper">
    <div class="wrap">
        <div class="admin_top_wrap">
            <span>관리자 페이지</span>

        </div>
        <!-- contents-area -->
        <div class="admin_wrap">
            <!-- 네비영역 -->
            <div class="admin_navi_wrap">
                <ul>
                    <li >
                        <a class="admin_list_01" href="/userlist">사용자 관리</a>
                    </li>
                    <li>
                        <a class="admin_list_02" href="/admin/boardlist">게시판관리</a>
                    </li>
                    <lI>
                        <a class="admin_list_03" href="/admin/authorEnroll">작가 등록</a>
                    </lI>
                </ul>
            </div>
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>사용자 관리</span></div>
         <%--       <table class="table table-striped" style="width: 864px;">
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>주소</th>
                        <th>회원가입일</th>
                    </tr>
                    <%
                        for (int i = 0; i < mList.size(); i++) {
                            MemberDTO rDTO = mList.get(i);

                            if (rDTO == null) {
                                rDTO = new MemberDTO();
                            }
                    %>

                    <tr>
                        <th><%=String.valueOf(rDTO.getUser_seq())%></th>
                        <th><a href="/info?user_id=<%=CmmUtil.nvl(rDTO.getUser_id()) %>"/><%=CmmUtil.nvl(rDTO.getUser_id()) %></th>
                        <th><%=CmmUtil.nvl(rDTO.getUser_email()) %></th>
                        <th><%=CmmUtil.nvl(rDTO.getUser_addr2()) %></th>
                        <th><fmt:formatDate pattern="yyyy/MM/dd" value="<%=(rDTO.getUser_dt()) %>"  /></th>
                    </tr>

                    <%
                        }
                    %>

                </table>--%>
                <div class="divTable">
                    <div class="divTableBody">
                        <div class="divTableRow">
                            <div class="divTableHead">번호</div>
                            <div class="divTableHead">아이디</div>
                            <div class="divTableHead">이메일</div>
                            <div class="divTableHead">주소</div>
                            <div class="divTableHead">회원가입일</div>
                        </div>
                        <% for (int i = 0; i < mList.size(); i++) { MemberDTO rDTO = mList.get(i); if (rDTO == null) { rDTO = new MemberDTO(); } %>
                        <div class="divTableRow">
                            <div class="divTableHead"><%=String.valueOf(rDTO.getUser_seq())%></div>
                            <div class="divTableHead"><a href="/info?user_id=<%=CmmUtil.nvl(rDTO.getUser_id())%>"><%=CmmUtil.nvl(rDTO.getUser_id()) %></a></div>
                            <div class="divTableHead"><%=CmmUtil.nvl(rDTO.getUser_email()) %></div>
                            <div class="divTableHead"><%=CmmUtil.nvl(rDTO.getUser_addr2()) %></div>
                            <div class="divTableHead"><fmt:formatDate pattern="yyyy/MM/dd" value="<%=(rDTO.getUser_dt()) %>"  /></div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="clearfix">

            </div>
        </div>
    </div>
</div>
</body>
</html>
