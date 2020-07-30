<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>core tag 1</title>
</head>
<body>

<c:set var="time" value="<%= new java.util.Date() %>" />

현재 서버 시각 :  ${time}

</body>

</html>