<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>JSTL core 01</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>

<!-- 	c:set 태그 :  JSP 교재 296~298 페이지 참고 	-->
<c:set var = "serverTime" value="<%= new java.util.Date() %>" />

<p>현재 서버 시각  :   ${serverTime} </p>

</body>
</html>