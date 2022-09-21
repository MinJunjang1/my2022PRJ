<%--
  Created by IntelliJ IDEA.
  User: DATA12
  Date: 2022-09-20
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <mata charset="UTF-8"></mata>
    <title>채팅방 입장을 위한 별명 설정</title>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function (){
            let btnSend = document.getElementById("btnSend");
            btnSend.onclick = function (){
                const f = document.getElementById("f");
                f.submit();
            }
        });

        setInterval(function (){
            $.ajax({
                url: "/chat/roomList",
                type: "get",
                dataType: "JSON",
                success: function (json){
                    let roomHtml = "";

                    for (const room of json){
                        roomHtml += ("<span>" + room + "<span>");

                    }
                    $("#room").html(roomHtml);
                }
            });
        },5000)
    </script>
</head>
<body>
<div><b>현재 오픈된 채팅방</b></div>
<hr/>
<form method="post" id="f" action="/chat/room">
    <div><b>채팅입장</b></div>
    <hr/>
    <div><span>채팅방 이름 : <input type="text" name="roomname"></span></div>
    <div><span>채팅 별병 : <input type="text" name="nicname"></span></div>
    <button id="btnSend">채팅방 입장</button>
</form>
</body>
</html>
