
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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
	.nav-pill{
		width: 100%;
		display: inline-block;
	}
	.right-tab{
		float: right;
	}
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="/index">MAIN</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo02" >


		</div>
		<ul class="nav justify-content-center navbar-nav " >
			<li class="nav-item ">
				<a class="nav-link active" aria-current="page" href="/index">Home</a>
			</li>
			<li class="nav-item ">
				<a class="nav-link" href="#">게시판</a>
			</li>
			<li class="nav-item ">
				<a class="nav-link" href="/admin/main">관리자페이지</a>
			</li>
			<c:if test="${ memberDTO != null }">
				<li class="nav-item ">
					<a class="nav-link" href="/info?user_id=${memberDTO.user_id}">마이페이지</a>
				</li>
				<li class="nav-item ">
					<a class="nav-link" href="/admin/main">관리</a>
				</li>
				<li class="nav-item ">
					<a class="nav-link" href="/logout">회원 : ${memberDTO.user_id} 로그아웃</a>
				</li>
			</c:if>


		</ul>
	</div>
</nav>
<c:if test="${ memberDTO == null }">
	<meta http-equiv="refresh" content="0;url=/login">
</c:if>
<!-- Optional JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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