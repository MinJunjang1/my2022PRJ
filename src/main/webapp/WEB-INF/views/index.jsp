
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
</head>
<body>
<c:if test="${ memberDTO == null }">
	<meta http-equiv="refresh" content="0;url=/login">
</c:if>
<c:if test="${ memberDTO != null }">
	<meta http-equiv="refresh" content="0;url=/main">
</c:if>

</body>
</html>