<%@ page import="kopo.poly.util.CmmUtil" %><%--
  Created by IntelliJ IDEA.
  User: DATA12
  Date: 2022-09-20
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String roomname = CmmUtil.nvl(request.getParameter("roomname"));
    String nicname = CmmUtil.nvl(request.getParameter("nicname"));
%>
<html lang="ko">
<head>
    <mata charset="UTF-8"></mata>
    <title>채팅방 입장</title>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script>
        let data = {};
        let ws;
        const roomname = "<%=roomname%>";
        const nicname = "<%=nicname%>";
        $(document).ready(function (){
            let btnSend = document.getElementById("btnSend");
            btnSend.onclick = function (){
                send();
            }
            console.log("openSoket");
            if (ws !== undefined && ws.readyState !== WebSocket.CLOSED){
                console.log("Websocket is already opened!");
                return;
            }
            ws = new WebSocket("ws://" + location.host + "/ws/" + roomname + "/" + nicname);

            ws.onopen = function (event){
                if(event.data === undefined)
                    return;
                console.log(event.data)
            };
            ws.onmessage = function (msg){

                let data = JSON.parse(msg.data);

                if(data.name === nicname){
                    $("#chat").append("<div>");
                    $("#chat").append("<span style='color: blue'><b>[보낸사람]</b></span>");
                    $("#chat").append("<span style='color: blue'>나</span>");
                    $("#chat").append("<span style='color: blue'><b>[발송메세지]</b></span>");
                    $("#chat").append("<span style='color: blue'>"+ data.msg +"</span>");
                    $("#chat").append("<span style='color: blue'><b>[발송시간]</b></span>");
                    $("#chat").append("<span style='color: blue'>"+ data.date+"</span>");
                    $("#chat").append("</div>");

                }else if(data.name === "관리자"){
                    $("#chat").append("<div>");
                    $("#chat").append("<span style='color: red'><b>[보낸사람]</b></span>");
                    $("#chat").append("<span style='color: red'>"+data.name+"</span>");
                    $("#chat").append("<span style='color: red'><b>[발송메세지]</b></span>");
                    $("#chat").append("<span style='color: red'>"+ data.msg +"</span>");
                    $("#chat").append("<span style='color: red'><b>[발송시간]</b></span>");
                    $("#chat").append("<span style='color: red'>"+ data.date+"</span>");
                    $("#chat").append("</div>");

                }else {
                    $("#chat").append("<div>");
                    $("#chat").append("<span><b>[보낸사람]</b></span>");
                    $("#chat").append("<span>"+data.name+"</span>");
                    $("#chat").append("<span><b>[발송메세지]</b></span>");
                    $("#chat").append("<span>"+ data.msg +"</span>");
                    $("#chat").append("<span><b>[발송시간]</b></span>");
                    $("#chat").append("<span>"+ data.date+"</span>");
                    $("#chat").append("</div>");

                }
            }
        });
        function send(){
            let msgObj = $("#msg");

            if(msgObj.value !== ""){
                data.name = nicname;
                data.msg = msgObj.val();

                let temp = JSON.stringify(data);

                ws.send(temp);
            }
            msgObj.val("");
        }
    </script>
</head>
<body>
<h2><%=nicname%> 님! <%=roomname%> 채팅방 입장하셨습니다</h2><br/><br/>
<div><b>채팅내용</b></div>
<hr/>
<div id="chat"></div>
<div>
    <label for="msg">전달할 메시지 :</label><input type="text" id="msg">
    <button id="btnSend">메시지 전송</button>
</div>
</body>
</html>
