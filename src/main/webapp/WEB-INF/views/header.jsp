
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Bootstrap CSS -->
	<title></title>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

</head>
<body>
<!-- 화면 변경 크기와 navbar의 배경색, 글자색 변경 -->

<!-- 화면 위쪽에 고정하기 위해 fixed-top 클래스 추가 -->

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">

	<!-- navbar-brand의 content 변경 -->

	<a class="navbar-brand" href="#">Fixed navbar</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">

		<span class="navbar-toggler-icon"></span>

	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">

		<ul class="navbar-nav mr-auto">

			<li class="nav-item active">

				<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>

			</li>

			<li class="nav-item">

				<a class="nav-link" href="#">Link</a>

			</li>

			<!-- dropdown 메뉴 삭제 -->

			<li class="nav-item">

				<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>

			</li>

		</ul>
<div>
	<c:if test="${ memberDTO != null }">
		<span>회원 : ${memberDTO.user_id}</span>
		<a href="/logout">로그아웃</a>
		<a href="/info?user_id=${memberDTO.user_id}">마이페이지</a>
		<a href="/admin/main">관리</a>

	</c:if>

</div>

	</div>

</nav>
<!-- Optional JavaScript -->

<c:if test="${ memberDTO == null }">
	<meta http-equiv="refresh" content="0;url=/login">
</c:if>
</body>
</html>
<%--
	<div class="float-right">
				<c:if test="${ memberDTO != null }">
					<span>회원 : ${memberDTO.user_id}</span>
					<a href="/logout">로그아웃</a>
					<a href="/info?user_id=${memberDTO.user_id}">마이페이지</a>
					<a href="/admin/main">관리</a>

				</c:if>
			</div>
--%>