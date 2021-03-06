
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
</head>
<body>
<section class="content container-fluid">
    <div class="col-lg-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">댓글 작성</h3>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="newReplyText">댓글 내용</label>
                    <input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="newReplyWriter">댓글 작성자</label>
                    <input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요">
                </div>
            </div>
            <div class="box-footer">
                <ul id="replies">

                </ul>
            </div>
            <div class="box-footer">
                <div class="text-center">
                    <ul class="pagination pagination-sm no-margin">

                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modifyModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">댓글 수정창</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="replyNo">댓글 번호</label>
                        <input class="form-control" id="replyNo" name="replyNo" readonly>
                    </div>
                    <div class="form-group">
                        <label for="replyText">댓글 내용</label>
                        <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="replyWriter">댓글 작성자</label>
                        <input class="form-control" id="replyWriter" name="replyWriter" readonly>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-success modalModBtn">수정</button>
                    <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
                </div>
            </div>
        </div>
    </div>

</section>
<script>
    var articleNo = 1000;

    // 댓글 목록 호출
    getReplies();

    // 댓글 목록 출력 함수
    function getReplies() {

        $.getJSON("/replies/all/" + articleNo, function (data) {

            console.log(data);

            var str = "";

            $(data).each(function () {
                str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
                    +   "<p class='replyText'>" + this.replyText + "</p>"
                    +   "<p class='replyWriter'>" + this.replyWriter + "</p>"
                    +   "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                    + "</li>"
                    + "<hr/>";

            });

            $("#replies").html(str);

        });

    }
    var articleNo = 1000;

    // 댓글 목록 출력 함수 ...

    // 댓글 저장 버튼 클릭 이벤트 발생시
    $("#replyAddBtn").on("click", function () {

        // 화면으로부터 입력 받은 변수값의 처리
        var replyText = $("#newReplyText");
        var replyWriter = $("#newReplyWriter");

        var replyTextVal = replyText.val();
        var replyWriterVal = replyWriter.val();

        // AJAX 통신 : POST
        $.ajax({
            type : "post",
            url : "/replies",
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
                articleNo : articleNo,
                replyText : replyTextVal,
                replyWriter : replyWriterVal
            }),
            success : function (result) {
                // 성공적인 댓글 등록 처리 알림
                if (result == "regSuccess") {
                    alert("댓글 등록 완료!");
                }
                getReplies(); // 댓글 목록 출력 함수 호출
                replyText.val(""); // 댓글 내용 초기화
                replyWriter.val(""); // 댓글 작성자 초기화
            }
        });
    });
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>