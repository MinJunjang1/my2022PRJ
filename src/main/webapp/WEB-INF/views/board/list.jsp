<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            margin: 5px;
        }
        .search_area input{
            height: 35px;
            width: 598px;
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
</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>

<div class="container" style="margin: auto;">


    <div class="table_wrap">
        <h1 class="boby">게시판</h1>
        <div class="divTableRow " style="text-align:center; margin: auto; display: block;">
        <div class="search_area boby " style="margin: auto; margin-bottom: 5px;"><select name="type" >
            <option value=""<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>

            <option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>

            <option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>

            <option value="W"<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>

            <option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>

            <option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
            <option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
        </select><input name="keyword" type="text" value="${pageMaker.cri.keyword }" />
            <button class="top_btn btn btn-secondary">검색</button></div>
    </div>
        <div class="divTable" style="text-align: center; margin: 0">

            <div class="divTableHeading">

                <div class="divTableRow"  style="background: #c8e5bc;">
                    <div class="divTableHead">번호</div>
                    <div class="divTableHead">제목</div>
                    <div class="divTableHead">작성자</div>
                    <div class="divTableHead">작성일</div>
                    <div class="divTableHead">수정일</div>
                </div>

            </div>
            <div class="divTableBody">
                <c:forEach items="${list}" var="list">
                    <div class="divTableRow">
                        <div class="divTableCell" style="text-align: center;"><c:out value="${list.bno}"/></div>
                        <div class="divTableCell" style="text-align: center"><a class="move" href='<c:out value="${list.bno}"/>'>
                            <c:out value="${list.title}"/>
                        </a></div>
                        <div class="divTableCell"><c:out value="${list.writer}"/></div>
                        <div class="divTableCell" ><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></div>
                        <div class="divTableCell" ><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button onclick="location.href='/board/enroll'" class="btn btn-secondary top_btn left" style="float: right;" >게시판 등록</button>
    </div>
    <div class="pageInfo_wrap boby"  >
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






    <form id="moveForm" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
    </form>
</div>

<script>
window.onpageshow=function (event){
    if(event.persisted || (window.performance && window.performance.navigation.type ==2)){
        location.reload()
    }
};
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
        moveForm.attr("action", "/board/get");
        moveForm.submit();

    });
    $(".pageInfo a").on("click", function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/board/list");
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