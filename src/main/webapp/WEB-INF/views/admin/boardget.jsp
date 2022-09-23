<%@ page import="kopo.poly.dto.MemberDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
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
        *{
            margin: 0;
            padding:0;
        }
        a{
            text-decoration: none;
        }
        ul{
            list-style: none;
        }
        /* 화면 전체 렙 */
        .wrapper{
            width: 100%;
        }
        /* content 랩 */
        .wrap{
            width : 1080px;
            margin: auto;
        }

        .top_gnb_area .list{
            position: absolute;
            top: 0px;
            right: 0;

        }
        .top_gnb_area .list li{
            list-style: none;
            float : left;
            padding: 13px 15px 0 10px;
            font-weight: 900;
            cursor: pointer;
        }

        /* 관리제 페이지 상단 현페이지 정보 */
        .admin_top_wrap{
            height:110px;
            line-height: 110px;
            background-color: #5080bd;
            margin-bottom:15px;
        }
        .admin_top_wrap>span{
            margin-left: 30px;
            display:inline-block;
            color: white;
            font-size: 50px;
            font-weight: bolder;
        }
        /* 관리자 wrap(네비+컨텐츠) */
        .admin_wrap{


        }

        /* 관리자페이지 네비 영역 */
        .admin_navi_wrap{
            width: 20%;
            height: 300px;
            float:left;
            height: 100%;
        }
        .admin_navi_wrap li{
            display: block;
            height: 80px;
            line-height: 80px;
            text-align: center;
        }
        .admin_navi_wrap li a{
            display: block;
            height: 100%;
            width: 95%;
            margin: 0 auto;
            cursor: pointer;
            font-size: 30px;
            font-weight: bolder;
        }
        .admin_navi_wrap li a:link {color: black;}
        .admin_navi_wrap li a:visited {color: black;}
        .admin_navi_wrap li a:active {color: black;}
        .admin_navi_wrap li a:hover {color: black;}

        .admin_list_01{
            background-color: #c8c8c8;
        }


        /* 관리자페이지 컨텐츠 영역 */
        .admin_content_wrap{
            width: 80%;
            float:left;
            height: 100%;
            height: 700px;

        }
        .admin_content_subject{            /* 관리자 컨텐츠 제목 영역 */
            font-size: 40px;
            font-weight: bolder;
            padding-left: 15px;
            background-color: #6AAFE6;
            height: 80px;
            line-height: 80px;
            color: white;
        }


        .footer_nav_container>ul{
            font-weight : bold;
            float:left;
            list-style:none;
            position:relative;
            padding-top:10px;
            line-height: 27px;
            font-family: dotum;
            margin-left: 10px;
        }
        .footer_nav_container>ul>li{
            display:inline;
            width: 45px;
            height: 19px;
            padding: 10px 9px 0 10px;
        }
        .footer_nav_container>ul>span{
            margin: 0 4px;
        }

        .footer_left>img {
            width: 150%;
            height: 130px;
            margin-left: -20px;
            margin-top: -12px;
        }




        /* float 속성 해제 */
        .clearfix{
            clear: both;
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

      .boby{
               margin: auto;
               text-align: center;
                          }
        .pageInfo li{
            float: left;
            font-size: 20px;
            margin-left: 18px;
            padding: 7px;
            font-weight: 500;
        }
</style>
<jsp:include page="../header.jsp" flush="false"></jsp:include>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="admin_top_wrap">
            <span>관리자 페이지</span>

        </div>
        <!-- contents-area -->
        <div class="admin_wrap">
            <!-- 네비영역 -->
            <div class="admin_navi_wrap">
                <ul>
                    <li >
                        <a class="admin_list_01" href="/userlist">사용자 관리</a>
                    </li>
                    <li>
                        <a class="admin_list_02" href="/admin/boardlist">게시판관리</a>
                    </li>
                </ul>
            </div>
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>사용자 관리</span></div>


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

                        <input type="submit" id="modify_btn" class="btn btn-primary pull-right" value="수정하기">

                    <button type="button" id="list_btn" class="btn btn-secondary" value="">목록</button>
                </div>

                <form id="infoForm" action="/admin/admin_modify" method="get">
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
                                <div class="divTableCell"> 작성자 : <c:out value="${clist.writer}"/> 작성시간 :

                                    <fmt:formatDate pattern="yyyy/MM/dd" value="${clist.regdate}"/>

                                    <a id="delete_btn"  style="float: right; text-align: right;" onclick="deletec(<c:out value="${clist.comet_seq}"/>)">삭제</a>
                                </div>
                                <textarea readonly name="comet_content" class="form-control" style="resize: none;border: none;" rows="1" ><c:out value="${clist.comet_content}"/></textarea>
                            </div>
                        </c:forEach>
                    </div>

                </div>






                <form id="moveForm" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                    <input type="hidden" name="type" value="${pageMaker.cri.type }">
                </form>
            </div>
        </div>



        <div class="clearfix">

            </div>
        </div>
    </div>
</div>

<script>
    let form = $("#infoForm");

    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/admin/boardlist");
        form.submit();
    });

    $("#delete_btn").on("click", function(e){
        form.attr("action", "/admin/boarddelete");
        form.attr("method", "post");
        form.submit();
    });


    $("#modify_btn").on("click", function(e){
        form.attr("action", "/board/modify");
        form.submit();
    });




</script>

<script>
    window.onpageshow=function (event){
        if(event.persisted || (window.performance && window.performance.navigation.type ==2)){
            location.reload()
        }
    };

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



</script>
</body>
</html>