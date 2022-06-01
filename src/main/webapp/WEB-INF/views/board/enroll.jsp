<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="/board/enroll1" method="post">
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
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>
<form method="post" action="/board/enroll1">
    <div class="container">

        <h2>게시판 글쓰기</h2>

        <table class="table table-hover">

            <tbody>
                <tr>
                    <td><input type="text" name="writer" class="form-control" placeholder="작성자" maxlength="40" value="${memberDTO.user_id}" disabled></td>
                </tr>
            <tr>

                <td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40"></td>

            </tr>

            <tr>

                <td><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024" style="height: 400px;"></textarea></td>

            </tr>

            </tbody>

        </table>

        <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
        <button type="button" class="btn btn-secondary" value="">목록</button>
    </div>

</form>

</body>

</html>