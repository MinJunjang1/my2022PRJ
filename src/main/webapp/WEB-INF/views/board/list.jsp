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
            width: 500px;
        }
        .search_area button{
            width: 100px;
            height: 35px;
        }
        .search_area select{
            width: 190px;
            height: 35px;
            margin-right : 5px;
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
.container-list{
    box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
    background-color: #FFFFFF;
}


    </style>
</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body style="background-color: #E2E2E2">




<div style="height: 50px"></div>

<div class="container" style="margin: auto;" >

    <div class="container container-list" style="margin: auto; width: 1000px;" >
        <div class="left" style="height: 50px">
        </div>

        <h1 class="boby">게시판</h1>
        <div class="" style="height: 45px; width: 800px; margin: auto;">

            <button onclick="location.href='/board/enroll'" class="btn btn-primary top_btn">게시판 등록</button>

        </div>
        <div class="divTableRow " style="text-align:center; margin: auto; display: block;">
            <div class="search_area boby " style="margin: auto; margin-bottom: 10px; border-bottom: 1px solid gray"><select name="type" >
                <option value=""<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>

                <option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>

                <option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>

                <option value="W"<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>

                <option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>

                <option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select><input name="keyword" type="text" value="${pageMaker.cri.keyword }" />
                <button class="top_btn btn btn-secondary" style="margin-bottom: 5px;">검색</button></div>
        </div>

        <div class="" style="height: 5px; ">

        </div>
        <c:forEach items="${list}" var="list">
        <div class="align-self-center" style=" border-bottom: 1px solid gray; height: 80px; width: 800px; margin: auto" >
            <div class="d-flex align-items-center">
                 <div style="width: 100px; text-align: left"><h2><c:out value="${list.bno}"/></h2></div>
                 <div ><h2><a class="move" href='<c:out value="${list.bno}"/>'><c:out value="${list.title}"/></a></h2> </div>
            </div>

            <div style="height: 50px; margin: auto">작성자 <c:out value="${list.writer}"/> 작성일 <fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/> 수정일 <fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></div>
        </div>
        </c:forEach>


        <div class="align-self-center" style="height: 50px;">

        </div>

    <div class="pageInfo_wrap boby"  >
        <div class="pageInfo_area ">

            <ul id="pageInfo" class="pageInfo pagination justify-content-center">

                <!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>

                <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" } page-item"><a class="page-link" href="${num}">${num}</a></li>
                </c:forEach>

                <!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>

            </ul>


        </div>
        <form  id="moveForm" method="get">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
            <input type="hidden" name="type" value="${pageMaker.cri.type }">
        </form>
    </div>


        <div style="height: 50px"></div>





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
    </div>
</div>
<div style="height: 50px"></div>
</body>
</html>