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

    <div class="container p-2" style="border:1px solid; border-color: #ffffff #ffffff #333 #ffffff;">

        <span> 게시판 번호 / </span><input type="text" name="bno" style="border: none"  readonly value="<c:out value="${pageInfo.bno}"/>">
        <span> 작성자 / </span><input type="text" name="title" style="border: none" readonly value="<c:out value="${pageInfo.writer}"/> ">
        <span> 등록일 / </span><input type="text" style="border: none" readonly value="<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/> ">
        <span> 수정일 / </span><input type="text" style="border: none" readonly value="<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>">
    </div>
    <div class="container p-2" style="border:1px solid; border-color: #ffffff #ffffff #333 #ffffff;">
        <span>제목 / </span>
        <input type="text"  style="border: none" class="input_wrap" readonly value="<c:out value="${pageInfo.title}"/>">
    </div>
    <div class="container p-2 text-left" style="border:1px solid; border-color: #ffffff #ffffff #333 #ffffff;">

        <p>내용</p>
        <textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024"  readonly style="height: 400px;"><c:out value="${pageInfo.content}"/></textarea>

        </form>

</div>
<div class="boby" style="margin-top: 5px;">
    <c:if test="${ pageInfo.writer == memberDTO.user_id}">
        <input type="submit" id="modify_btn" class="btn btn-primary pull-right" value="수정하기">
    </c:if>
    <button type="button" id="list_btn" class="btn btn-secondary" value="">목록</button>
</div>

    <form id="infoForm" action="/board/modify" method="get">
        <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
        <input type="hidden" name="type" value="${cri.type }">
        <input type="hidden" name="keyword" value="${cri.keyword }">
    </form>


    <div class="card my-4">
        <h5 class="card-header">Leave a Comment:</h5>
        <div class="card-body">
            <form name="comment-form" action="/board/comment-write" method="post" autocomplete="off">
                <div class="form-group">
                    <input type="hidden" name="bno" value="<c:out value="${pageInfo.bno}"/>" />
                    <input type="hidden" name="user_id" value="${dto.member_id}" />
                    <textarea name="content" class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>


</div>



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
<!-- Comments Form -->


</body>
</html>