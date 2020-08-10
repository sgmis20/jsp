<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%!String name, title, filename, uploadFilePath; %>
		<%
			request.setCharacterEncoding("utf-8");

			name = (String) request.getAttribute("name");
			title = (String) request.getAttribute("title");
			filename = (String) request.getAttribute("filename");
		%>

		<h3>파일확인</h3>
		<p><a href="/upload/<%=filename%>"><img src="/upload/<%=filename%>" alt="" /></a></p>
		<p><%=name%></p>
		<p><%=title%></p>
	</div>
</body>
</html>