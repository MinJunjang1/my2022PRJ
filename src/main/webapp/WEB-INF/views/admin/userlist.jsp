<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>회원정보</title>

</head>
<body>
<h2></h2>
<table border="1">
    <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이메일</th>
        <th>주소</th>
        <th>회원가입일</th>
    </tr>
    <c:forEach items="${list}" var="memberDTO">
    <tr>
        <th>${MemberDTO.user_seq}</th>
        <th>${MemberDTO.user_id}</th>
        <th>${MemberDTO.user_pw}</th>
        <th>${MemberDTO.user_email}</th>
        <th>${MemberDTO.user_addr2}</th>
        <th>${MemberDTO.user_dt}</th>
    </tr>
    </c:forEach>
</table>
</body>
</html>