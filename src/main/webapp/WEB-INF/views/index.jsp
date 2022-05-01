<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<title>확인</title>

</head>
<style>
	*{
		margin: 0;
		padding:0;
	}
	/* 화면 전체 렙 */
	.wrapper{
		width: 1900px;
	}
	/* content 랩 */
	.wrap{
		width : 1080px;
		margin: auto;
	}
	/* 홈페이지 기능 네비 */
	.top_gnb_area{
		width: 100%;
		height: 50px;
		background-color: #a2a2ea;
	}
	/* 로고, 검색, 로그인 */
	.top_area{
		width: 100%;
		height: 150px;
		/* background-color: #f7f0b9; */
	}
	/* 로고 영역 */
	.logo_area{
		width: 25%;
		height: 100%;
		background-color: red;
		float:left;
	}
	/* 검색 박스 영역 */
	.search_area{
		width: 50%;
		height: 100%;
		background-color: yellow;
		float:left;
	}
	/* 로그인 버튼 영역 */
	.login_area{
		width: 25%;
		height: 100%;
		display: inline-block;
		text-align: center;
	}
	.login_button{
		height: 50%;
		background-color: #D4DFE6;
		margin-top: 30px;
		line-height: 77px;
		font-size: 40px;
		font-weight: 900;
		border-radius: 10px;
		cursor: pointer;
	}
	.login_area>span{
		margin-top: 10px;
		font-weight: 900;
		display: inline-block;
	}
	.login_button{
		height : 50%;
		background-color: #D4DFE6;
		margin-top:30px;
	}

	/* 제품 목록 네비 */
	.navi_bar_area{
		width: 100%;
		height: 70px;
		background-color: #7696fd;
	}

	/* 홈페이지 메인 제품 목록  */
	.content_area{
		width: 100%;
		background-color: #97ef97;
		height: 1000px;
	}

	/* float 속성 해제 */
	.clearfix{
		clear: both;
	}
</style>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<h1>gnb area</h1>
		</div>
		<div class="top_area">
			<div class="logo_area">
				<h1>logo area</h1>
			</div>
			<div class="search_area">
				<h1>Search area</h1>
			</div>
			<div class="login_area">
				<div class="login_button"><a href="/login">로그인</a></div>
				<span><a href="/join1">회원가입</a></span>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="navi_bar_area">
			<h1>navi area</h1>
		</div>
		<div class="content_area">
			<h1>content area</h1>
		</div>
	</div>
</div>

</body>
</html>