<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// 연습을 위해 샘플데이터 생성  - MVC 패턴으로 만들 때는 모델, 컨트롤러에 의해 제공됨
	String[] cities = {"Seoul", "Tokyo", "Osaka", "Sapporo", "Fukuoka"};
	pageContext.setAttribute("myCities", cities);
%>

<html>
<head>
<title>core tag 2</title>
<style>
body{
	background-color: AntiqueWhite;
	color: MidnightBlue;
	font-weight: bold;
}
</style>
</head>

<body>
	
	<c:forEach var="tempCity" items="${myCities}">
		
		${tempCity} <br/>
		
	</c:forEach>
	
</body>
</html>