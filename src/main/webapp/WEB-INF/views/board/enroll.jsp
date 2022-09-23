<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>처리페이지</title>

</head>
<style>
    .final_title_ck{
        display: none;
        color : red;
    }
    .final_content_ck{
        display: none;
        color : red;
    }
</style>
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
<form method="post" id="board_form">
    <div class="container">

        <h2 style="margin-top: 50px; margin-bottom: 50px">게시판 글쓰기</h2>
        <span> 작성자</span>
        <input type="text" name="writer" id="writer" class="form-control" placeholder="작성자" maxlength="40" value="${memberDTO.user_id}" readonly></td>
        <span> 제목</span>
        <input type="text" class="title_class form-control" placeholder="글 제목" name="title" id="title" maxlength="40"></td>
        <span class="final_title_ck">제목을 입력해주세요.</span>
        <hr>
        <span> 내용 </span>
        <textarea type="text" class="content_class form-control" placeholder="글 내용을 작성하세요" name="content" id="content" maxlength="1024" style="height: 400px;"></textarea></td>
        <span class="final_content_ck">내용을 입력해주세요.</span>

        <div style="margin: 50px"></div>




            <div style="text-align: right;">
                <button type="button"class="btn btn-primary pull-right" style="text-align: right" id="btn">글쓰기</button>
                <!-- 위으것 버튼으로-->
                <button type="button" class="btn btn-secondary" value="">목록</button>

            </div>
        </div>

</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
 var titleCh = false;
 var contentCh = false;
$(document).ready(function (){
   $(".btn").click(function (){
       var title = $('.title_class').val();
       var content = $('.content_class').val();

       if(title == ""){
           $('.final_title_ck').css('display','block');
           titleCh = false;
           alert("제목을 입력해주세요");
           return
       }else {
           $('.final_title_ck').css('display','none');
           titleCh = true;
       }

       if(content == ""){
           $('.final_content_ck').css('display','block');
           contentCh = false;
           alert("내용을 입력해주세요");
           return
       }else {
           $('.final_content_ck').css('display','none');
           contentCh = true;
       }

       if(titleCh&&contentCh){
           $("#board_form").attr("action", "/board/enroll1");
           $("#board_form").submit();
       }
       return false
   })
 })



</script>
</body>

</html>