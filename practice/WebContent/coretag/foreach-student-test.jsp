<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.*, tagdemo.Student" %>

<%
	//간단한 예제 구성을 위해 샘플 데이터 생성
	ArrayList<Student> studentList = new ArrayList<>();

	studentList.add(new Student("병후", "김", false));
	studentList.add(new Student("효근", "최", false));
	studentList.add(new Student("유경", "오", true));
	studentList.add(new Student("상원", "이", true));

	pageContext.setAttribute("myStudents", studentList);
%>

<html>
<head>
<title>JSTL core 03</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
	<table>

	<tr>
		<th>성</th>
		<th>이름</th>
		<th>골드회원</th>
	</tr>
	
	<c:forEach var="tempStudent" items="${myStudents}">
		
		<tr>
			<td>${tempStudent.lastName}</td>
			<td>${tempStudent.firstName}</td>
			<td>${tempStudent.goldCustomer}</td> 
		</tr>
		
	</c:forEach>

	</table>

</body>

</html>












