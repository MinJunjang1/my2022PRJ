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

    .container-shadow{
        box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset, rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
        background-color: #FFFFFF;
    }
</style>

</head>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body style="background-color: #E2E2E2;">
<div>
    <div style="height: 50px"></div>
    <div class="container-shadow" style="width: 1200px; margin: auto;" >
        <div class="container">
            <div style="height: 50px"></div>
        <h1 style="text-align: center">수정 페이지</h1>
            <div style="height: 50px"></div>

            <form id="modifyForm" action="/board/modify1" method="post">
    <div class="container p-2 d-flex justify-content-center"  >

        <input type="hidden" name="bno"  readonly value="<c:out value="${pageInfo.bno}"/>">
        <input type="hidden" name="name" readonly value="<c:out value="${pageInfo.writer}"/> ">
        <input type="hidden" readonly value="<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/> ">
        <input type="hidden" readonly value="<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>">



    </div>
                <div class="card my-4" style="width:950px; margin:auto;">
                    <h7 class="card-header">
                        <div class="row align-items-start">
                            <div class="col">
                                <span> 게시판 번호  /  </span><c:out value="${pageInfo.bno}"/>
                            </div>
                            <div class="col">
                                <span> 등록일  /  </span><fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>
                            </div>
                            <div class="col">
                                <span> 수정일  /  </span><fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>
                            </div>
                        </div>
                    </h7>
                    <h7 class="card-header"> 작성자  /  <c:out value="${pageInfo.writer}"/> </h7>

                </div>
                <div class="input-group mb-3" style="width: 950px; margin:auto;">
                    <span class="input-group-text" id="inputGroup-sizing-default"> 제목 </span>
                    <input type="text" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<c:out value="${pageInfo.title}"/>">
                </div>
    <div class="container p-2 text-left" style="width: 950px;">

        <p>내용</p>
        <textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024" style="height: 400px;"><c:out value="${pageInfo.content}"/></textarea>

    </div>
                <div style="height: 50px"></div>
</form>
    <div class="btn_wrap boby" style="margin-top: 5px" >
        <button  id="list_btn" class="btn btn-secondary">목록 페이지</button>
        <button  id="modify_btn" class="btn btn-warning">수정 완료</button>
        <button  id="delete_btn" class="btn btn-danger">삭제</button>
        <button  id="cancel_btn" class="btn btn-success">수정 취소</button>
    </div>
            <div style="height: 50px"></div>
</div>


</div>


<form id="infoForm" action="/board/modify" method="get">
    <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
</form>

    </div>
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
<div style="height: 50px"></div>
</body>
</html>