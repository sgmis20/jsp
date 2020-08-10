<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<c:if test="${3>4 }">
이 내용은 화면에 나타나지 않습니다.
</c:if>

<c:if test="${param.type eq 'guest'}">
홈페이지 방문을 환영하는 바이나 아직 회원이 아니십니다 <br><br>
빠른 시일 내에 회원가입을 해주시면 감사하겠습니다
</c:if>

<c:if test="${param.type eq 'member' }">
우리 회원님 방문을 환영하는 바입니다
즐거운 시간을 보내시기 바라며<br>
더 나은 서비스로 보답하겠습니다<br>
</c:if>

</body>
</html>