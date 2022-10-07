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
        width: 950px;
        height: 200px;
        font-size: 15px;
    }

    .btn_wrap{
        padding-left : 80px;
        margin-top : 50px;
    }  .boby {
               margin: auto;
               text-align: center;
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

            font-weight:400;
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



.container-shadow{
    box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset, rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
    background-color: #FFFFFF;
}



    </style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body style="background-color: #E2E2E2;">
<div style="height: 50px"></div>
<div class="container-shadow" style="width: 1200px; margin: auto;" >
<div class="container body"  >
    <div style="margin-bottom: 100px;">

        <div style="height: 50px"></div>

    <div class="card my-4" style="width: 950px; margin:auto">
        <h7 class="card-header">

            <div class="row align-items-start" >
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

        <h7  class="card-header">  제목  /  <c:out value="${pageInfo.title}"/> </h7>
    </div>


    <div class="container p-2 text-left " style=" width: 970px; margin: auto; ">

        <span>내용</span>
        <textarea  type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024"  readonly style="height: 400px;"><c:out value="${pageInfo.content}"/></textarea>


</div>
        <div style="height: 50px"></div>
        <div class=" d-grid gap-2" style="width: 950px; margin: auto;">
    <c:if test="${ pageInfo.writer == memberDTO.user_id}">
        <input type="submit" id="modify_btn" class="btn btn-primary btn-lg" value="수정하기">
    </c:if>

            <a href="/board/list" type="button" class="btn btn-secondary btn-lg" style="color: #FFFFFF">목록</a>
</div>



        <div style="height: 50px"></div>

    <form id="infoForm" action="/board/modify" method="get">
        <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
        <input type="hidden" name="type" value="${cri.type }">
        <input type="hidden" name="keyword" value="${cri.keyword }">
    </form>


    <div class="card my-4" style="width: 950px; margin:auto">
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

    <div class="card my-4" style="width: 950px; margin:auto">

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


                <details>

                    <summary>대댓글보기</summary>
                    <ul>
                        <div class="card my-4" >

                                <h5 class="card-header">대댓글</h5>
                                <div class="card-body">
                                    <form name="comment-form" action="/board/recoin" method="post">
                                        <div class="form-group">
                                            <input type="hidden"  name="bno" value="<c:out value="${pageInfo.bno}"/>" />
                                            <input type="hidden" name="comet_seq" value="${clist.comet_seq}" />
                                            <input type="hidden"  name="recowriter" value="${memberDTO.user_id}" />
                                            <textarea  name="reco_content" class="form-control" rows="1"></textarea>
                                        </div>
                                        <input type="submit" class="btn btn-primary" style="float: right;" value="저장"/>
                                    </form>

                            </div>


                <c:forEach items="${rlist}" var="rlist">
                    <c:if test="${rlist.comet_seq == clist.comet_seq }">
                            <div class="divTableRow" style="float: right">
                                <input type="hidden" value="${rlist.recomet_seq}">
                                <div class="divTableCell" > 작성자 : <c:out value="${rlist.recowriter}"/> 작성시간 :

                                    <fmt:formatDate pattern="yyyy/MM/dd" value="${rlist.recoregdate}"/>

                                    <c:if test="${  rlist.recowriter ==  memberDTO.user_id }">

                                        <form id="deletereco" action="/board/deletereco" method="post" style="display: inline;">
                                            <input type="hidden" name="recomet_seq" value="${rlist.recomet_seq}"/>
                                            <input type="hidden"  name="bno" value="<c:out value="${pageInfo.bno}"/>" />
                                            <a  style="float: right; text-align: right;" onclick="deletere()">삭제</a>
                                        </form>
                                    </c:if>

                                </div>

                                <textarea readonly name="comet_content" class="form-control" style="resize: none;border: none;" rows="1" ><c:out value="${rlist.reco_content}"/></textarea>
                            </div>
                                </c:if>
                                </c:forEach>

                        </div>


                    </ul>
                </details>



    </c:if>


        </c:forEach>
    </div>

</div>



        <div class="pageInfo_wrap"  style="text-align: center">
            <div class="pageInfo_area body" style="text-align: center">
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
        </div>
<div style="height: 50px;">

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
function deletere(){
    document.getElementById('deletereco').submit();
}




</script>
<!-- Comments Form -->

<div style="margin-bottom: 100px;">

</div>
</div>
</body>
</html>