<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	// 간단한 예제 구성을 위해 샘플 데이터 생성 (일반적으로는 MVC 패턴을 통해 주어짐)
	String[] cities = { "Seoul", "Helsinki", "Osaka" };

	//객체 pageContext의 메소드 setAttribute(name, value) 를 이용
	pageContext.setAttribute("myCities", cities);
%>

<html>
<head>
<title>JSTL core 02</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>

	<!-- c:forEach 태그 : JSP 교재 303~306 페이지 참고  -->

	<c:forEach var="tempCity" items="${myCities}">	
		${tempCity} <br>
	</c:forEach>

</body>
</html>