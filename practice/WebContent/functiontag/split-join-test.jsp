<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<title>split, join</title>
<style>
body{
	background-color: #2D3842;
	color: #C1CEDB;
}

h3{
	color: #DBD1A7;
}

</style>
</head>
<body>

<c:set var="data" value="Seoul,Helsinki,Sapporo,Osaka,Tokyo" />

<h3>Split 예제</h3>

<c:set var="citiesArray" value="${fn:split(data, ',')}" />

<c:forEach var="tempCity" items="${citiesArray}" >
	${tempCity} <br/>
</c:forEach>

<br><hr>

<h3>Join 예제</h3>

<c:set var="fun" value="${fn:join(citiesArray, '*')}" />

join 결과 : ${fun} 


</body>
</html>










