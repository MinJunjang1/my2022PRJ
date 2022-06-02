<%@ page import="kopo.poly.dto.MemberDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>처리페이지</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
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

        /* float 속성 해제 */
        .clearfix{
            clear: both;
        }
        a{
            text-decoration : none;
        }
        table{
            border-collapse: collapse;
            width: 1000px;
            margin-top : 20px;
            text-align: center;
        }
        td, th{
            border : 1px solid black;
            height: 50px;
        }
        th{
            font-size : 17px;
        }
        thead{
            font-weight: 700;
        }
        .table_wrap{
            margin : 50px 0 0 50px;
        }
        .bno_width{
            width: 12%;
        }
        .writer_width{
            width: 20%;
        }
        .regdate_width{
            width: 15%;
        }
        .updatedate_width{
            width: 15%;
        }
        .top_btn{
            font-size: 20px;
            padding: 6px 12px;
            background-color: #fff;
            border: 1px solid #ddd;
            font-weight: 600;
        }
        .pageInfo{
            list-style : none;
            display: inline-block;
            margin: 0 0 0 100px;
        }
        .pageInfo li{
            float: left;
            font-size: 20px;
            margin-left: 18px;
            padding: 7px;
            font-weight: 500;
        }
        a:link {color:black; text-decoration: none;}
        a:visited {color:black; text-decoration: none;}
        a:hover {color:black; text-decoration: underline;}
        .active{
            background-color: #cdd5ec;
        }
        .search_area{
            display: inline-block;
            margin-top: 30px;
        }
        .search_area input{
            height: 30px;
            width: 250px;
        }
        .search_area button{
            width: 100px;
            height: 36px;
        }
        .search_area select{
            height: 35px;
        }
    .boby{
        margin: auto;
        text-align: center;
    }
    .left{
        margin: auto;
        text-align: right;
    }
    </style>
</head>
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
                <div class="admin_content_subject"><span>게시판관리</span></div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th colspan="5">
                            <div class="search_wrap body">
                                <div class="search_area">
                                    <select name="type">
                                        <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                                        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                                        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                                        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                                        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                                        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                                        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
                                    </select>
                                    <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
                                    <button class="top_btn btn btn-secondary">검색</button>

                                </div>
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <th class="bno_width">번호</th>
                        <th class="title_width">제목</th>
                        <th class="writer_width">작성자</th>
                        <th class="regdate_width">작성일</th>
                        <th class="updatedate_width">수정일</th>
                    </tr>
                    </thead>
                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td><c:out value="${list.bno}"/></td>
                            <td>
                                <a class="move" href='<c:out value="${list.bno}"/>'>
                                    <c:out value="${list.title}"/>
                                </a>
                            </td>
                            <td><c:out value="${list.writer}"/></td>
                            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="pageInfo_wrap"  >
                    <div class="pageInfo_area">
                        <ul id="pageInfo" class="pageInfo">

                            <!-- 이전페이지 버튼 -->
                            <c:if test="${pageMaker.prev}">
                                <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                            </c:if>

                            <!-- 각 번호 페이지 버튼 -->
                            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                            </c:forEach>

                            <!-- 다음페이지 버튼 -->
                            <c:if test="${pageMaker.next}">
                                <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                            </c:if>

                        </ul>
                    </div>
                </div>

            </div>
            <div class="clearfix">

            </div>
        </div>
    </div>
</div>



    <form id="moveForm" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
    </form>

<script>
    $(document).ready(function(){

        let result = '<c:out value="${result}"/>';

        checkAlert(result);
        console.log(result);

        function checkAlert(result){

            if(result === ''){
                return;
            }

            if(result === "enrol success"){
                alert("등록이 완료되었습니다.");
            }

            if(result === "modify success"){
                alert("수정이 완료되었습니다.");
            }

            if(result === "delete success"){
                alert("삭제가 완료되었습니다.");
            }
        }

    });
    let moveForm = $("#moveForm");
    $(".move").on("click", function(e){
        e.preventDefault();

        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/admin/boardget");
        moveForm.submit();
    });
    $(".pageInfo a").on("click", function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/admin/boardlist");
        moveForm.submit();

    });


    $(".search_area button").on("click", function(e){
        e.preventDefault();

        let type = $(".search_area select").val();
        let keyword = $(".search_area input[name='keyword']").val();

        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }

        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }

        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });

</script>

</body>
</html>