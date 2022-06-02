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

    .btn_wrap{
        padding-left : 80px;
        margin-top : 50px;
    }
    .boby{
        margin: auto;
        text-align: center;
    }
</style>

</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>
<div class="container boby">

<h1>수정 페이지</h1>
<form id="modifyForm" action="/board/modify1" method="post">
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
            <td colspan="7"><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40" value='<c:out value="${pageInfo.title}"/>'></td>

        </tr>

        <tr>

            <td colspan="8"><label>내용</label><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024" style="height: 400px;"><c:out value="${pageInfo.content}"/></textarea></td>

        </tr>
        </tbody>

    </table>

</form>
    <div class="btn_wrap boby" >
        <button  id="list_btn" class="btn btn-secondary">목록 페이지</button>
        <button  id="modify_btn" class="btn btn-warning">수정 완료</button>
        <button  id="delete_btn" class="btn btn-danger">삭제</button>
        <button  id="cancel_btn" class="btn btn-success">수정 취소</button>
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
    let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
    let mForm = $("#modifyForm");	// 페이지 데이터 수정 from

    /* 목록 페이지 이동 버튼 */
    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/board/list");
        form.submit();
    });

    /* 수정 하기 버튼 */
    $("#modify_btn").on("click", function(e){
        mForm.submit();
    });

    /* 취소 버튼 */
    $("#cancel_btn").on("click", function(e){
        form.attr("action", "/board/get");
        form.submit();
    });

    /* 삭제 버튼 */
    $("#delete_btn").on("click", function(e){
        form.attr("action", "/board/delete");
        form.attr("method", "post");
        form.submit();
    });

</script>

</body>
</html>