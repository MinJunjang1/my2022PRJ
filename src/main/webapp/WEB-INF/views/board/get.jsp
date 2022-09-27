<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.BoardDTO" %>
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



        * 리뷰 영역 *
        .content_bottom{
            width: 80%;
            margin : auto;
        }
        .reply_content_ul{
            list-style: none;
        }
        .comment_wrap{
            position: relative;
            border-bottom: 1px dotted #d4d4d4;
            padding: 14px 0 10px 0;
            font-size: 12px;
        }
        /* 리뷰 머리 부분 */
        .reply_top{
            padding-bottom: 10px;
        }
        .id_span{
            padding: 0 15px 0 3px;
            font-weight: bold;
        }
        .date_span{
            padding: 0 15px 0;
        }
        /* 리뷰 컨텐트 부분 */
        .reply_bottom{
            padding-bottom: 10px;
        }


        /* 리뷰 선 */
        .reply_line{
            width : 80%;
            margin : auto;
            border-top:1px solid #c6c6cf;
        }

        /* 리뷰 제목 */
        .reply_subject h2{
            padding: 15px 0 5px 5px;
        }

        /* pageMaker */
        .repy_pageInfo_div{
            text-align: center;
            margin-top: 30px;
            margin-bottom: 40px;
        }
        .pageMaker{
            list-style: none;
            display: inline-block;
        }
        .pageMaker_btn{
            float: left;
            width: 25px;
            height: 25px;
            line-height: 25px;
            margin-left: 20px;
            font-size: 10px;
            cursor: pointer;
        }
        .active{
            border : 2px solid black;
            font-weight:400;
        }
        .next, .prev {
            border: 1px solid #ccc;
            padding: 0 10px;
        }

        /* 리뷰 없는 경우 div */
        .reply_not_div{
            text-align: center;
        }
        .reply_not_div span{
            display: block;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        /* 리뷰 수정 삭제 버튼 */
        .update_reply_btn{
            font-weight: bold;
            background-color: #b7b399;
            display: inline-block;
            width: 40px;
            text-align: center;
            height: 20px;
            line-height: 20px;
            margin: 0 5px 0 30px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }
        .delete_reply_btn{
            font-weight: bold;
            background-color: #e7578f;
            display: inline-block;
            width: 40px;
            text-align: center;
            height: 20px;
            line-height: 20px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }




    </style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>
<div class="container body"  >
    <div style="margin-bottom: 100px;">



    <div class="card my-4">
        <h7 class="card-header">

            <div class="row align-items-start">
                <div class="col">
                    <span> 게시판 번호  /  </span><input type="text" name="bno" style="border: none; background-color: transparent;"  readonly value="<c:out value="${pageInfo.bno}"/>" size="10">
                </div>

                <div class="col">
                    <span> 등록일  /  </span><input type="text" style="border: none; background-color: transparent;" readonly value="<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/> ">
                </div>
                <div class="col">
                    <span> 수정일  /  </span><input type="text" style="border: none; background-color: transparent;" readonly value="<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>">
                </div>
            </div>

        </h7>


            <h7 class="card-header"> 작성자  /  <input type="text" name="title" style="border: none; background-color: transparent;" readonly value="<c:out value="${pageInfo.writer}"/> "></h7>

        <h7  class="card-header">  제목  /
        <input type="text"  style="border: none; background-color: transparent;" class="input_wrap" readonly value="<c:out value="${pageInfo.title}"/>">
        </h7>
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
        <h5 class="card-header">댓글</h5>
        <div class="card-body">




            <form name="comment-form" <%--action="/board/chat" method="post" autocomplete="off"--%>>
                <div class="form-group">
                    <input type="hidden"  name="bno" value="<c:out value="${pageInfo.bno}"/>" />
                    <input type="hidden" id="writer" name="writer" value="${memberDTO.user_id}" />
                    <textarea  id="comet_content" name="comet_content" class="form-control" rows="1"></textarea>
                </div>
                <button type="button" id="chatbtn" name="chatbtn" class="btn btn-primary" style="float: right;" onclick="reply()">저장</button>
            </form>




        </div>
    </div>

    <div class="card my-4">

    <div class="card-body">
        <c:forEach items="${clist}" var="clist">
            <div class="divTableRow">
                <input type="hidden" value="${clist.comet_seq}">
                <div class="divTableCell"> 작성자 : <c:out value="${clist.writer}"/> 작성시간 :

                <fmt:formatDate pattern="yyyy/MM/dd" value="${clist.regdate}"/>
                    <c:if test="${  clist.writer ==  memberDTO.user_id }">
              <a id="delete_btn"  style="float: right; text-align: right;" onclick="deletec(<c:out value="${clist.comet_seq}"/>)">삭제</a>
                    </c:if>

                </div>
                <textarea readonly name="comet_content" class="form-control" style="resize: none;border: none;" rows="1" ><c:out value="${clist.comet_content}"/></textarea>
            </div>
            <c:if test="${ memberDTO.user_id == clist.writer }">
<details>

<summary>수정페이지</summary>
<ul>
    <div class="card my-4">
        <h5 class="card-header">댓글 수정</h5>
        <div class="card-body">
            <form name="comment-form" action="/board/updatec" method="post">
                <div class="form-group">
                    <input type="hidden"  name="bno" value="<c:out value="${pageInfo.bno}"/>" />
                    <input type="hidden" name="comet_seq" value="${clist.comet_seq}" />
                    <input type="hidden"  name="writer" value="${memberDTO.user_id}" />
                    <textarea  name="comet_content" class="form-control" rows="1"><c:out value="${clist.comet_content}"/></textarea>
                </div>
                <input type="submit" class="btn btn-primary" style="float: right;" value="수정"/>
            </form>
        </div>
    </div>

</ul>
</details>
    </c:if>


        </c:forEach>
    </div>

</div>



        <div class="pageInfo_wrap"  style="text-align: center">
            <div class="pageInfo_area body" style="text-align: center">
                <ul id="pageInfo" class="pageInfo" style="text-align: center; margin: 0;padding: 0;">

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






        <form class="body" id="moveForm" method="get">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
            <input type="hidden" name="type" value="${pageMaker.cri.type }">
            <input type="hidden" name="bno" value="${pageInfo.bno}"/>
        </form>
</div>
</div>
<%--

<script type="text/javascript">
    /* 리뷰쓰기 */
    $(".reply_button_wrap").on("click", function(e){

        e.preventDefault();

        const memberId = '${member.memberId}';
        const bookId = '${goodsInfo.bookId}';
        $.ajax({
            data : {
                bookId : bookId,
                memberId : memberId
            },
            url : '/reply/check',
            type : 'POST',
            success : function(result){
                if(result === '1'){
                    alert("이미 등록된 리뷰가 존재 합니다.")
                } else if(result === '0'){
                    let popUrl = "/replyEnroll/" + memberId + "?bookId=" + bookId;
                    console.log(popUrl);
                    let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";

                    window.open(popUrl,"리뷰 쓰기",popOption);
                }

            }
        });

    });
    const cri = {
        bno : '${pageInfo.bno}',
        pageNum : 1,
        amount : 10
    }
    /* 댓글 페이지 이동 버튼 동작 */
    $(document).on('click', '.pageMaker_btn a', function(e){

        e.preventDefault();

        let page = $(this).attr("href");
        cri.pageNum = page;

        replyListInit();

    });

    $(document).on('click', '.update_reply_btn', function(e){

        e.preventDefault();
        let replyId = $(this).attr("href");
        let popUrl = "/replyUpdate?replyId=" + replyId + "&bookId=" + '${goodsInfo.bookId}' + "&memberId=" + '${member.memberId}';
        let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"

        window.open(popUrl,"리뷰 수정",popOption);

    });

    /* 리뷰 삭제 버튼 */
    $(document).on('click', '.delete_reply_btn', function(e){
        e.preventDefault();
        let replyId = $(this).attr("href");

        $.ajax({
            data : {
                replyId : replyId,
                bookId : '${goodsInfo.bookId}'
            },
            url : '/reply/delete',
            type : 'POST',
            success : function(result){
                replyListInit();
                alert('삭제가 완료되엇습니다.');
            }
        });

    });


    let replyListInit = function(){
        $.getJSON("/board/get", cri , function(obj){

            makeReplyContent(obj);

        });
    }

    $.getJSON("/board/get", {bno : bno}, function (obj) {
      makereplycontent(obj)
    });

    function makereplycontent(obj) {
        if(obj.list.length === 0){
            $(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
            $(".reply_content_ul").html('');
            $(".pageMaker").html('');
        }else{

            $(".reply_not_div").html('');

            const list = obj.list;
            const pf = obj.pageInfo;
            const userID = ${memberDTO.user_id}
                /* list */

                let reply_list = '';

            $(list).each(function(i,obj){
                reply_list += '<li>';
                reply_list += '<div class="comment_wrap">';
                reply_list += '<div class="reply_top">';
                /* 아이디 */
                reply_list += '<span class="id_span">'+ obj.memberId+'</span>';
                /* 날짜 */
                reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
                /* 평점 */
                reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
                if(obj.memberId === userId){
                    reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
                }
                reply_list += '</div>'; //<div class="reply_top">
                reply_list += '<div class="reply_bottom">';
                reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
                reply_list += '</div>';//<div class="reply_bottom">
                reply_list += '</div>';//<div class="comment_wrap">
                reply_list += '</li>';
            });
            $(".reply_content_ul").html(reply_list);

            /* 페이지 버튼 */
            let reply_pageMaker = '';

            /* prev */
            if(pf.prev){
                let prev_num = pf.pageStart -1;
                reply_pageMaker += '<li class="pageMaker_btn prev">';
                reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
                reply_pageMaker += '</li>';
            }
            /* numbre btn */
            for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
                reply_pageMaker += '<li class="pageMaker_btn ';
                if(pf.cri.pageNum === i){
                    reply_pageMaker += 'active';
                }
                reply_pageMaker += '">';
                reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
                reply_pageMaker += '</li>';
            }
            /* next */
            if(pf.next){
                let next_num = pf.pageEnd +1;
                reply_pageMaker += '<li class="pageMaker_btn next">';
                reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
                reply_pageMaker += '</li>';
            }
            $(".pageMaker").html(reply_pageMaker);
        }
    }
</script>


--%>

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

        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") +"'>");
        moveForm.attr("action", "/board/get");
        moveForm.submit();

    });
    $(".pageInfo a").on("click", function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/board/get");
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


    function reply(){
        var bno = document.getElementById('bno').value;
        console.log(bno);
        var writer =document.getElementById('writer').value;
        console.log(writer);
        var comet_content = document.getElementById('comet_content').value;
        console.log(comet_content);
        $.ajax({
            data : {
                bno: bno,
                writer: writer,
                comet_content: comet_content
            },
            url:'/board/chat',
            type: 'POST',
            success: function (){
                alert("sucess");
                location.reload()
            }
        });
    };


    let form = $("#infoForm");

    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/board/get");
        form.submit();
    });

    $("#modify_btn").on("click", function(e){
        form.attr("action", "/board/modify");
        form.submit();
    });


 function deletec(e){


        $.ajax({
            data : {
                comet_seq : e,
                bno : '${pageInfo.bno}'
            },
            url : '/board/deletechat',
            type : 'POST',
            success : function(){
                alert('삭제가 완료되엇습니다.');
                location.reload()
            }
        });

    };
   /*function updatec(e){
        e.preventDefault();
       $.ajax({
           data : {
               comet_seq : e,
               bno : '${pageInfo.bno}',
               comet_content: e
           },
           url : '/borad/updatechat',
           type : 'POST',
           success(){
               alert('수정페이지로')
               location.href('/board/updatechat')
           }
       })

    };*/




</script>
<!-- Comments Form -->

<div style="margin-bottom: 100px;">

</div>
</body>
</html>