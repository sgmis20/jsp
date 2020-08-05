<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>To to List</title>
<style>
body {
	background-color: #004643;
	color: #e8e4e6;
	font-size: 22px;
	font-weight: bold;
}

li {
	color: #f9bc60;
	font-size: 18px;
}
</style>
</head>

<body>

<!-- 1단계 HTML 폼 만들기  -->

<form action = "session-todo-FINISHED.jsp">
	<span>새로운 할 일 추가 : </span>
	<input type= "text" name = "userInput" />
	<input type="submit" value="추가" />
</form>


<!-- 2단계  To Do 리스트에 새로운 항목 추가하기 -->

<%
	@SuppressWarnings("unchecked")

	ArrayList<String> items = (ArrayList<String>)session.getAttribute("myToDoList");
	
	if (items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items); // 
	}
	
	String userInput = request.getParameter("userInput");
	if (userInput != null && !userInput.trim().equals(""))  {
		items.add(userInput);
	}
	
%>


<!-- 3단계 모든 To Do 항목 들을 세션으로부터 가져와 화면에 출력하기 -->

<hr>
	<h3>To Do 리스트 </h3>
<br/>

<ol>
	<%
	for(String print : items){
		out.println("<li>" + print + "</li>");
	}
	%>
</ol>

</body>

</html>