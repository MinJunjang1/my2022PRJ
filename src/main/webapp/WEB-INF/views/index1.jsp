
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<title>챗팅</title>
	<link rel="stylesheet" href="/css/main.css" />
</head>
<jsp:include page="header.jsp" flush="false"></jsp:include>
<body>

<div id="username-page">
	<div class="username-page-container">
		<h1 class="title">챗팅</h1>
		<form id="usernameForm" name="usernameForm">
			<div class="form-group">

				<input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" value="${memberDTO.user_id}" readonly/>
			</div>
			<div class="form-group">
				<button type="submit" class="accent username-submit">채팅 시작하기</button>
			</div>
		</form>
	</div>
</div>

<div id="chat-page" class="hidden">
	<div class="chat-container">
		<div class="chat-header">
			<h2>챗팅</h2>
		</div>
		<div class="connecting">
			연결중...
		</div>
		<ul id="messageArea">

		</ul>
		<form id="messageForm" name="messageForm">
			<div class="form-group">
				<div class="input-group clearfix">

					<input type="hidden" id="room" placeholder="roomname" autocomplete="off" class="form-control" value="1" readonly/>

					<input type="text" id="message" placeholder="메세지를 입력해주세요..." autocomplete="off" class="form-control"/>
					<button type="submit" class="primary">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<c:if test="${ memberDTO == null }">
	<meta http-equiv="refresh" content="0;url=/login">
</c:if>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/Chat.js"></script>

</body>
</html>