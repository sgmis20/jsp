<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<title>function tag</title>
<style>
body{
	background-color: #2D3842;
	color: #C1CEDB;
}

p{
	color: #DBD1A7;
	display: inline-flex;
	font-weight: bold;
}
</style>
</head>
<body>

<c:set var="data" value="tokyo" />
<c:set var="name" value="김병후" />

다음 String의 길이는 ? <b>${data}</b> → <p> ${fn:length(data)}</p>

<br>

다음 영문자를 대문자로 변경 <b>${data}</b> → <p> ${fn:toUpperCase(data)} </p>

<br><hr>

String <b>${name}</b>가 <b>김</b>으로 시작되는가? → <p> ${fn:startsWith(name, "김")} </p>
<br>
String <b>${name}</b>가 <b>최</b>로 시작되는가? →  <p> ${fn:startsWith(name, "최")} </p>
</body>

</html>











