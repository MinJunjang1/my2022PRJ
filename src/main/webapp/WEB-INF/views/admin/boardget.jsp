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

</head>

    <style type="text/css">
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

    label{
        display: block;
        margin: 10px 0;
        font-size: 20px;
    }
    input{
        padding: 5px;
        font-size: 17px;
    }
    textarea{
        width: 800px;
        height: 200px;
        font-size: 15px;
        padding: 10px;
    }
    .btn{
        display: inline-block;
        font-size: 22px;
        padding: 6px 12px;
        background-color: #fff;
        border: 1px solid #ddd;
        font-weight: 600;
        width: 140px;
        height: 41px;
        line-height: 39px;
        text-align : center;
        margin-left : 30px;
        cursor : pointer;
    }

      .boby{
               margin: auto;
               text-align: center;
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
                <table class="table table-hover">

                    <tr>
                        <td>게시판번호</td>
                        <td><input name="bno" class="form-control" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' ></td>
                        <td>작성자</td>
                        <td><input type="text" name="writer" id="writer" class="form-control" placeholder="작성자" maxlength="40" value='<c:out value="${pageInfo.writer}"/>' readonly></td>
                        <td>최초등록일</td>
                        <td><input name="regdater" class="form-control" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'></td>
                        <td>수정일</td>
                        <td>
                            <input name="updateDate" class="form-control" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>'></td>
                    </tr>
                    <tbody>
                    <tr>
                        <td colspan="1">제목</td>
                        <td colspan="7"><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40" value='<c:out value="${pageInfo.title}"/>' readonly="readonly"></td>

                    </tr>

                    <tr>

                        <td colspan="8"><label>내용</label><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024" style="height: 400px;" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea></td>

                    </tr>
                    </tbody>

                </table>
                <div class="boby">
                    <button type="button" id="list_btn" class="btn btn-secondary" value="">목록</button>
                    <button  id="delete_btn" class="btn btn-danger">삭제</button>
                </div>
            </div>
            <div class="clearfix">

            </div>
        </div>
    </div>
</div>


<form id="infoForm" action="/board/modify" method="get">
    <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
</form>
<script>
    let form = $("#infoForm");

    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/admin/boardlist");
        form.submit();
    });

    $("#delete_btn").on("click", function(e){
        form.attr("action", "/admin/boarddelete");
        form.attr("method", "post");
        form.submit();
    });
</script>
<%--
<h1>조회 페이지</h1>
<div class="input_wrap">
    <label>게시판 번호</label>
    <input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
</div>
<div class="input_wrap">
    <label>게시판 제목</label>
    <input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
</div>
<div class="input_wrap">
    <label>게시판 내용</label>
    <textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
</div>
<div class="input_wrap">
    <label>게시판 작성자</label>
    <input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' >
</div>
<div class="input_wrap">
    <label>게시판 등록일</label>
    <input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
</div>
<div class="input_wrap">
    <label>게시판 수정일</label>
    <input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
</div>
<div class="btn_wrap">
    <a class="btn" id="list_btn">목록 페이지</a>
    <c:if test="${ pageInfo.writer == memberDTO.user_id}">
    <a class="btn" id="modify_btn">수정 하기</a>
    </c:if>

</div>
<form id="infoForm" action="/board/modify" method="get">
    <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
</form>

<script>
    let form = $("#infoForm");

    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/board/list");
        form.submit();
    });

    $("#modify_btn").on("click", function(e){
        form.attr("action", "/board/modify");
        form.submit();
    });
</script>
--%>

</body>
</html>