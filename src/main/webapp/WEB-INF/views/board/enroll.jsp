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
    .container-shadow{
        box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset, rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
        background-color: #FFFFFF;
    }

</style>

<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body style="background-color: #E2E2E2;">


<div style="height: 50px"></div>
<div class="container-shadow" style="width: 1200px; margin: auto;" >
<form method="post" id="board_form">
    <div class="container">
        <div style="height: 50px"></div>
        <h2 style="margin-top: 50px; text-align: center;">게시판 글쓰기</h2>
        <div style="height: 50px"></div>
     <div class="input-group mb-3"  style="width: 950px; margin: auto;">
            <span class="input-group-text align-self-center" id="inputGroup-sizing-default1" style="width: 100px;  text-align: center;">작성자</span>
            <input type="text" class="form-control" placeholder="작성자" id="writer" name="writer" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${memberDTO.user_id}" readonly>

     </div>
        <div class="input-group mb-3" style="width: 950px; margin: auto;">
            <span class="input-group-text align-self-center" id="inputGroup-sizing-default2" style="width: 100px; text-align: center;">제목</span>
            <input type="text" class="form-control title_class" placeholder="글 제목" name="title" id="title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" maxlength="40">

        </div>
        <div style="margin: auto; width: 950px; height: 30px;">
            <span class="final_title_ck">제목을 입력해주세요.</span>
        </div>
        <div style="width: 950px; margin: auto;">

            <span> 내용 </span><br/>
            <textarea type="text" class="content_class form-control" placeholder="글 내용을 작성하세요" name="content" id="content" maxlength="1024" style="height: 400px;"></textarea></td>
            <span class="final_content_ck">내용을 입력해주세요.</span>
        </div>



        <div style="margin: 50px"></div>




            <div class=" d-grid gap-2" style="width: 950px; margin: auto;">
                <button type="button"class="btn btn-primary btn-lg" id="btn" >글쓰기</button>
                <!-- 위으것 버튼으로-->
               <a href="/board/list" type="button" class="btn btn-secondary btn-lg" style="color: #FFFFFF">목록</a>

            </div>
        </div>

</form>
    <div style="height: 50px;"></div>
</div>
<div style="height: 50px;"></div>
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