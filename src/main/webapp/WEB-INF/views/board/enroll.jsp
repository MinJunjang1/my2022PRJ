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
<%--
<body>
<h1>게시판 등록</h1>
<form action="/board/enroll" method="post">
    <div class="input_wrap">
        <label>Title</label>
        <input name="title">
    </div>
    <div class="input_wrap">
        <label>Content</label>
        <textarea rows="3" name="content"></textarea>
    </div>
    <div class="input_wrap">
        <label>Writer</label>
        <input name="writer">
    </div>
    <button class="btn">등록</button>
</form>
--%>


<style>
    body{
        padding-top: 70px;
        padding-bottom: 30px;
    }
</style>
</head>
<body>
<article>
    <div class="container" role="main">
        <h2>board Form</h2>
        <form name="form" id="form" role="form"  action="/board/enroll" method="post">
            <div class="mb-3">
                <label for="title">제목</label>
                <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
            </div>
            <div class="mb-3">
                <label for="reg_id">작성자</label>
                <input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요">
            </div>
            <div class="mb-3">
                <label for="content">내용</label>
                <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" >

                </textarea>
            </div>
            <div class="mb-3">
                <label for="tag">TAG</label>
                <input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">
            </div>
        </form>
        <div >
            <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
        </div>
    </div>
</article>

</body>
</html>