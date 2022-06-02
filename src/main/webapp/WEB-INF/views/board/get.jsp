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
                          .input_wrap{
                              padding: 5px 20px;
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
    .btn_wrap{
        padding-left : 80px;
        margin-top : 50px;
    }  .boby{
               margin: auto;
               text-align: center;
                          }
</style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>
<div class="container body"  >

    <h2>조회페이지</h2>

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
        <c:if test="${ pageInfo.writer == memberDTO.user_id}">
            <input type="submit" id="modify_btn" class="btn btn-primary pull-right" value="수정하기">
        </c:if>
        <button type="button" id="list_btn" class="btn btn-secondary" value="">목록</button>
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
        form.attr("action", "/board/list");
        form.submit();
    });

    $("#modify_btn").on("click", function(e){
        form.attr("action", "/board/modify");
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